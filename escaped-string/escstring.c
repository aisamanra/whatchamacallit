#include <stdio.h>

int main(int argc, char* argv[])
{
    char c;
    putchar('"');
    while ((c = getchar()) != EOF) {
        switch (c) {
        case 0x08:
            putchar('\\');
            putchar('b');
            break;
        case 0x0a:
            putchar('\\');
            putchar('n');
            break;
        case 0x0c:
            putchar('\\');
            putchar('f');
            break;
        case 0x0d:
            putchar('\\');
            putchar('r');
            break;
        case 0x09:
            putchar('\\');
            putchar('t');
            break;
        case '"':
        case '\\':
        case 0x00:
        case 0x01:
        case 0x02:
        case 0x03:
        case 0x04:
        case 0x05:
        case 0x06:
        case 0x07:
        case 0x0b:
        case 0x0e:
        case 0x0f:
        case 0x10:
        case 0x11:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x17:
        case 0x18:
        case 0x19:
        case 0x1a:
        case 0x1b:
        case 0x1c:
        case 0x1d:
        case 0x1e:
        case 0x1f:
            putchar('\\');
        default:
            putchar(c);
        }
    }
    putchar('"');
}
