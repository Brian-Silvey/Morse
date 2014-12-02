#include "mbed.h"
#include <string>
#include <ctype.h>

extern "C" int to_morse_code(char symbol); // maps char to location in array
extern "C" void init_table(int table[36]); // initializes table with morse code bit strings
extern "C" void init_ledtable(int table[36]); // initializes ledtable with char display values

PwmOut speaker(p21); // piezo buzzer
DigitalIn dit(p7); // button
DigitalIn dah(p6); // button
DigitalIn space(p8); // button
BusOut grid(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p22, p23, p24, p25); // grid of 16 LEDs

Serial pc(USBTX, USBRX); // set up serial over USB

float UNIT = 0.15; // change this to set the pace of morse code outputted (faster = smaller)

/*
*   beep the speaker for the amount of time specified
*/
void beep(float time) {
    speaker = 0.1;
    wait(time);
    speaker = 0.0;
}

int main() {
    dit.mode(PullDown);
    dah.mode(PullDown);
    space.mode(PullDown);
    int convert; // the converted code/text
    int loc; // general purpose location for arrays
    char input[256]; // user inputted string
    int table[36]; // contains morse code values for a-z and 0-9 (a=0,b=1,...9=34,0=35)
    init_table(table); // put the values into the table
    int ledtable[36]; // contains LED mapped letter values for a-z and 0-9
    init_ledtable(ledtable); // put the values into the table
    for (int i = 0; i < 256; i = i + 1) { input[i] = NULL; } // initialize input with NULL
input: // where the real interaction between user and machine begins
    pc.printf("Please enter the number corresponding to the conversion you'd like:\n\r1. Morse code to text\n\r2. Text to Morse code\n\r");
    pc.scanf("%256[^\t]", &input[0]); // store serial input until TAB is pressed or 256 char limit reached
    pc.printf("You have selected: ");
    if (input[0] == '1') { // if (Morse code to text)
        convert = 1; // initialize
        for (int i = 0; i < 256; i = i + 1) { input[i] = NULL; } // reset input to NULL (for use again)
        pc.printf("Morse code to text\n\r");
        pc.printf("Input Morse code via buttons on device.\n\rRightmost = 'dah'\n\rMiddle = 'dit'\n\rLeftmost = space (between letters)\n\r");
        pc.printf("To add a space between words, enter two spaces.\n\r");
        pc.printf("To finish input, enter three spaces.\n\r");
        loc = 0; // initialize location to start of array
        char last = 'd'; // initialize last button pressed to dit/dah (affects space)
        int temp; // used to reverse bit string
        while(1) { // loop until break
            if (dit) {
                grid = 0; // all LEDs OFF
                convert <<= 1; // add 0 to right of current bit string
                pc.printf("."); // symbolize dit to user
                last = 'd'; // set last button pressed to dit/dah
                wait(0.2); // wait for button debounce
                continue;
            } // end if
            if (dah) {
                grid = 0; // all LEDs OFF
                convert <<= 1;
                convert |= 1; // add 1 to right of current bit string
                pc.printf("-"); // symbolize dah to user
                last = 'd'; // set last button pressed to dit/dah
                wait(0.2); // wait for button debounce
                continue;
            } // end if
            if (space) {
                if (last == 'p') { // if last button pressed was 2nd space in a row
                    grid = 0; // all LEDs OFF
                    pc.printf("\n\r"); // newline
                    break; // break while loop
                } // end if
                if (last == 's') { // if last button pressed was 1st space since dit/dah
                    pc.printf(" "); // symbolize space between words
                    input[loc] = ' '; // add space in text string
                    loc = loc + 1; // increment location to next element (NULL)
                    last = 'p'; // set last button pressed to 2nd space in a row
                    wait(0.2); // wait for button debounce
                    continue;
                } // end if
                temp = 1; // initialize temporary bit string to 1
                while (convert > 1) { // reverse bit string excluding leftmost 1
                    temp <<= 1; // shift temp left 1
                    temp |= (convert & 1); // put rightmost bit of convert into temp
                    convert >>= 1; // cut rightmost bit of convert off
                } // end while
                convert = temp; // store reversed convert into convert
                for (int i = 0; i < 36; i = i + 1) { // iterate through each element in table until convert = table[i]
                    if (convert == table[i] && i < 26) { // if convert is a letter
                        input[loc] = (char)(i + 97); // set current location to convert as ascii char
                        grid = ledtable[i]; // turn on LEDs for letter
                        loc = loc + 1; // increment location to next element (NULL)
                        break; // break inner for loop
                    } else if (convert == table[i] && i < 35) { // if convert is a number 1-9
                        input[loc] = (char)(i + 23); // set current location to convert as ascii char
                        grid = ledtable[i]; // turn on LEDs for number
                        loc = loc + 1; // increment location to next element (NULL)
                        break; // break inner for loop
                    } else if (convert == table[i]) { // if convert is 0
                        input[loc] = '0'; // set current location to '0'
                        grid = ledtable[i]; // turn on LEDs for 0
                        loc = loc + 1; // increment location to next element (NULL)
                        break; // break inner for loop
                    } // end if-else
                } // end for
                convert = 1; // reinitialize convert to 1 (for next use)
                pc.printf(" "); // display space
                if (loc >= 256) // if next location is out of range
                    break; // break while loop
                if (last == 'd') // if last button pressed is dit/dah
                    last = 's'; // set last button pressed to 1st space
                wait(0.2); // wait for button debounce
                continue;
            } // end if
        } // end while
        pc.printf("You entered: %s\n\r", input); // display converted morse to text
        for (int i = 0; input[i] != NULL; i++) { // display each char in LEDs for 1 second
            if (input[i] == ' ') { // if current char is space
                grid = 0; // all LEDs OFF
                wait(1); // wait 1 second
                continue; // next iteration
            } // end if
            loc = to_morse_code(input[i]); // get location of letter/number in ledtable array
            grid = ledtable[loc]; // set LEDs to display char
            wait(1); // wait 1 second
            grid = 0; // all LEDs OFF
            wait(0.1); // wait 0.1 seconds for brief blink effect
        } // end for
        grid = 0; // all LEDs OFF
        while (1) { // wait until another input to start over
            if (space || dit || dah) // if any button is pressed on the board
                goto input; // rerun
        } // end while
    } else if (input[0] == '2') { // if (Text to Morse code)
        pc.printf("Text to Morse code\n\r");
        pc.printf("Input word or phrase to convert to Morse Code:\n\r");
        pc.scanf("%256[^\t]", &input[0]); // store serial input until TAB is pressed or 256 char limit reached
        pc.printf("%s\n\r", input); // display what the user entered
        for(int i = 0; input[i] != NULL && i < 256; i = i + 1) { // iterate through each char inputted
            if (isalnum(input[i])) // if char is letter or number
                input[i] = tolower(input[i]); // convert to lowercase
        } // end for
        for(int i = 0; input[i] != NULL && i < 256; i = i + 1) { // iterate through each char inputted
            if (!isalnum(input[i])) // if char is not a letter or number
                continue; // next iteration
            loc = to_morse_code(input[i]); // get location of letter/number in (led)table array
            convert = table[loc]; // set convert to morse code bit string representing char
            grid = ledtable[loc]; // set LEDs to display char
            while(convert > 1) { // while bit string has leftmost 1
                if((convert & 1) == 1) { // if rightmost bit is 1
                    beep(UNIT*3.0); // beep for 3 units
                } else { // if rightmost bit is 0
                    beep(UNIT); // beep for 1 unit
                } // end if-else
                convert >>= 1; // cut rightmost bit off
                if (convert > 1) // if bit string has leftmost 1
                    wait(UNIT); // wait for 1 unit
            } // end while
            grid = 0; // all LEDs OFF
            if (input[i+1] == ' ') // if next element is space
                wait(UNIT*7.0); // wait for 7 units
            else // if next element is letter
                wait(UNIT*3.0); // wait for 3 units
        } // end for
        while (1) { // wait until another input to start over
            if (space || dit || dah) // if any button is pressed on the board
                goto input; // rerun
        } // end while
    } else { // if neither modes are inputted
        pc.printf("Neither! Please input either '1' or '2'!\n\r");
        goto input; // rerun
    } // end else
}