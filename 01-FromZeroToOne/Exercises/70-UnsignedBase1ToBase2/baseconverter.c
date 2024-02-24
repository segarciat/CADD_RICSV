#include <stdio.h> /* printf, getchar, EOF */
#include <ctype.h> /* toupper, tolower */
#include <stdlib.h>	/* strtol */
#include <string.h> /* strlen */
#define DECIMAL 10
#define BINARY 2
#define HEX 16
#define MAXBITS 64

int readbase(char *s);
int checkbase(int c, int base);
int validatenumber(char *s, int base);
unsigned long todecimal(char *s, int base);
void tobase(unsigned long n, int base, char *s);
void reverse(char *s);

/* given number bases b1 and b2, followed by an unsigned number in base b1, outputs the number in base b2 
 *
 * Assumes the given number fits in 64 bits.
 * */
int main(int argc, char *argv[])
{
    int b1, b2;
    if (!(b1 = readbase(*++argv)) || !(b2 = readbase(*++argv))|| !validatenumber(*++argv, b1)) {
	printf("Usage: <base1> <base2> <n>\n");
	printf("\t base1 and base2 must be %d through %d, and n must be an unsigned number in base2 that can fit in a 64-bit word\n", BINARY, HEX);
	return 1;
    }
    unsigned long n;
    char s[MAXBITS + 1];

    n = todecimal(*argv, b1);	/* b1 to decimal */
    tobase(n, b2, s);		/* decimal to b2 */
    printf("%s\n", s);
}

/* todecimal: converts unsigned integer string a given base to decimal: supports bases BINARY through HEX */
unsigned long todecimal(char *s, int base)
{
    unsigned long n;
    for (n = 0; *s != '\0'; s++)
	n = base * n + (isdigit(*s)? (*s - '0'): (10 + (tolower(*s) - 'a')));
    return n;
}

/* tobasE: converts unsigned integer n to a string representation in the given base */
void tobase(unsigned long n, int base, char *s)
{
    int r;
    char *p;
    for (p = s; n ; n /= base, p++) {
	r = n % base;
	*p = (char) ((r < 10) ? '0' + r : ('A' + (r-10)) );
    }
    *p = '\0';
    reverse(s);
}

/* readbase: parses numerical base from s and returns it, returning 0 if invalid */
int readbase(char *s)
{
    if (s == NULL)
	return 0;
    char *endp;
    int base = (int) strtol(s, &endp, DECIMAL);

    if (*endp != '\0') {
	printf("Error: invalid character encountered when reading base: %s\n", endp);
	return 0;
    }
    if (base < BINARY || base > HEX) {
	printf("Error: invalid base %d, expected base between %d and %d\n", base, BINARY, HEX);
	return 0;
    }
    return base;
}

/* checkdigit: returns 1 if c is a valid digit in the given base, 0 otherwise. Supported bases: binary through hexadecimal */
int checkdigit(int c, int base)
{
    if (base < BINARY || base > HEX) {	/* invalid base */
	printf("Error: Only bases %d through %d are supported, but got: %d\n", BINARY, HEX, base);
	return 0;
    }

    if (base <= DECIMAL && (!isdigit(c) || (c - '0') >= base))
	return 0;

    int maxletter = 'a' + (base - DECIMAL) - 1;
    return isdigit(c) || (base > DECIMAL && tolower(c) <= maxletter); 
}

/* validatenumber: returns 1 if s is valid in the given base, 0 otherwise */
int validatenumber(char *s, int base)
{
    if (s == NULL)
	return 0;
    while (*s)
        if (!checkdigit(*s++, base))
            return 0;
    return 1;    
}

/* reverse: reverse string s in-place */
void reverse(char *s)
{
    int c, i, j;
    for (i = 0, j = strlen(s) - 1; i < j; i++, j--) {
	c = s[i];
	s[i] = s[j];
	s[j] = c;
    }
}
