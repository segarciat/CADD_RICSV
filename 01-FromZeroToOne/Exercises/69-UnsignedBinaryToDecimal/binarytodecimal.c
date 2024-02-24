#include <stdio.h> /* printf, getchar, EOF */
#include <ctype.h> /* isspace */
#define MAXBITS 64

int readbits(char s[]);
unsigned long bintodecimal(char *s);

/* read unsigned binary number with up MAXBITS bits and display its decimal value */
int main(int argc, char *argv[])
{
    char s[MAXBITS + 1];

    printf("Enter an %d-bit binary number: ", MAXBITS);
    if (!readbits(s))
	return 1;	/* exit unsuccessfully */

    unsigned long n = bintodecimal(s);
    printf("\nThe unsigned decimal equivalent is %lu\n", n);
}

/* readbits: reads contiguous binary number of up to MAXBITS bits into s until newline or EOF is encountered, skipping white space
 * returns 1 if successful, and 0 otherwise
 */
int readbits(char s[])
{
    int c, i;
    i = 0;
    while (isspace(c = getchar())) /* skip leading white space */
	;

    if (c != '1' && c != '0') {
	printf("Invalid binary digit: %c\n", *s);
	s[0] = '\0';
	return 0;
    }

    s[i++] = c;
    while (i < MAXBITS && ((c = getchar()) == '0' || c == '1'))	/* read rest of bits */
	s[i++] = c;

    if (i == MAXBITS)
	c = getchar();

    while (c != '\n' && c != EOF && isspace(c))		/* skip trailing white space besides newline */
	c = getchar();

    if (c == '1' || c == '0') {
	printf("Error: either already received %d bits, or encountered additional bit separated by space: %c\n", MAXBITS, c);
	return 0;
    }
    else if (c != '\n' && c != EOF) {
	printf("Encountered invalid character: %c\n", c);
	return 0;
    }
    s[i] = '\0';
    return 1;
}

/* bintodecimal:  converts unsigned binary string in s to decimal. Expects MSB to be at s[0] */
unsigned long bintodecimal(char *s)
{
    unsigned long n;
    for (n = 0; *s != '\0'; s++)
	n = 2 * n + (*s - '0');
    return n;
}
