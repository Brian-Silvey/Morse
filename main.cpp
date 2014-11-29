#include "mbed.h"
#include <string>
#include <ctype.h>

extern "C" int to_morse_code(char symbol);
extern "C" void init_table(int table[36]);

PwmOut speaker(p21);
DigitalIn dit(p7);
DigitalIn dah(p6);
DigitalIn space(p8);

Serial pc(USBTX, USBRX);    // set up serial over USB

float UNIT = 0.15;

void beep(float time) {
    speaker = 0.1;
    wait(time);
    speaker = 0.0;
}

int main() {
    dit.mode(PullDown);
    dah.mode(PullDown);
    space.mode(PullDown);
    int convert;
    char input[256];
    int table[36];
    init_table(table);
    for (int i = 0; i < 256; i = i + 1) {
        input[i] = NULL;
    }
input:
    pc.printf("Please enter the number corresponding to the conversion you'd like:\n\r1. Morse code to text\n\r2. Text to Morse code\n\r");
    pc.scanf("%256[^\t]", &input[0]);
    pc.printf("You have selected: ");
    if (input[0] == '1') {
        convert = 1;
        for (int i = 0; i < 256; i = i + 1) {
            input[i] = NULL;
        }
        pc.printf("Morse code to text\n\r");
        pc.printf("Input Morse code via buttons on device.\n\rRightmost = 'dah'\n\rMiddle = 'dit'\n\rLeftmost = space (between letters)\n\r");
        pc.printf("To add a space between words, enter two spaces.\n\r");
        pc.printf("To finish input, enter three spaces.\n\r");
        int loc = 0;
        char last = ' ';
        int temp;
        while(1) {
            if (dit) {
                convert <<= 1;
                pc.printf(".");
                last = 'd';
                wait(0.2);
                continue;
            }
            if (dah) {
                convert <<= 1;
                convert |= 1;
                pc.printf("-");
                last = 'd';
                wait(0.2);
                continue;
            }
            if (space) {
                if (last == 'p') {
                    pc.printf("\n\r");
                    break;
                }
                if (last == 's') {
                    pc.printf(" ");
                    input[loc] = ' ';
                    loc = loc + 1;
                    last = 'p';
                    wait(0.2);
                    continue;
                }
                temp = 1;
                while (convert > 1) {
                    temp <<= 1;
                    temp |= (convert & 1);
                    convert >>= 1;
                }
                convert = temp;
                for (int i = 0; i < 36; i = i + 1) {
                    if (convert == table[i] && i < 26) {
                        input[loc] = (char)(i + 97);
                        loc = loc + 1;
                        break;
                    } else if (convert == table[i] && i < 35) {
                        input[loc] = (char)(i + 23);
                        loc = loc + 1;
                        break;
                    } else if (convert == table[i]) {
                        input[loc] = '0';
                        loc = loc + 1;
                        break;
                    }
                }
                convert = 1;
                pc.printf(" ");
                if (loc >= 256)
                    break;
                if (last == 'd')
                    last = 's';
                wait(0.2);
                continue;
            }
        }
        pc.printf("You entered: %s\n\r", input);
        wait(0.2);
        while (1) {
            if (space || dit || dah)
                goto input;
        }
    } else if (input[0] == '2') {
        pc.printf("Text to Morse code\n\r");
        pc.printf("Input word or phrase to convert to Morse Code:\n\r");
        pc.scanf("%256[^\t]", &input[0]);
        pc.printf("%s\n\r", input);
        for(int i = 0; input[i] != NULL && i < 256; i = i + 1) {
            if (isalnum(input[i]))
                input[i] = tolower(input[i]);
        }
        for(int i = 0; input[i] != NULL && i < 256; i = i + 1) {
            if (!isalnum(input[i]))
                continue;
            convert = to_morse_code(input[i]);
            convert = table[convert];
            while(convert > 1) {
                if((convert & 1) == 1) {
                    beep(UNIT*3.0);
                } else {
                    beep(UNIT);
                }
                convert >>= 1;
                if (convert > 1)
                    wait(UNIT);
            }
            if (input[i+1] == ' ')
                wait(UNIT*7.0);
            else
                wait(UNIT*3.0);
        }
        while (1) {
            if (space || dit || dah)
                goto input;
        }
    } else {
        pc.printf("Neither! Please input either '1' or '2'!\n\r");
        goto input;
    }
}