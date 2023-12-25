static const double pi = 3.14;
auto b = 5;
_Bool x = 1;
enum week { Mon = 1, Tue, Wed, Thur, Fri, Sat, Sun };

struct node {
    int value;
	struct node* next;
};

union test {
	int p;
};

inline char toUpper (char ch);

void main() {
	int a = 314e-2;
	char* ab_ad123ak = "Hello, world!";
    _Bool bool_var = 0;

    int n, t;
    do {
        n -= 1;
    } while (n > 1);

    for(int i = 0; (i < 3 && i >= 0) || (i > 100 && i != 101); i++) {
    	continue;
    }

    


    // Identifiers
    unsigned long int variable123;
    char MyIdentifier;

    // Constants
    short int integerConstant = 123;
    float floatingConstant = 3.14;
    enum { ELEM1, ELEM2, ELEM3 } enumVar;
    char characterConstant = 'x';
    char stringLiteral[] = "Hello, world!";

    // Punctuators
    int _a = 5;
    int _b = 10;
    int sum = _a++ + --_b;
    _a = _a&_b;
    _a = _a*_b;
    _a = _a+_b;
    _a = _a-_b;
    _a = _a/_b;
    _a = _a%_b;
    _a = _a<<_b;
    _a = _a>>_b;
    _a = _a|_b;
    _a *= _b;
    _a /= _b;
    _a %= _b;
    _a += _b;
    _a -= _b;
    _a <<= _b;
    _a >>= _b;
    _a &= _b;
    _a ^= _b;
    _a |= _b;


    // Comments
    // This is a single-line comment

    /*
       This is a
       multi-line comment
    */

    return ;
}