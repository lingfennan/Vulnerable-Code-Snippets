#include <stdint.h>


void handle_error(char* s) {}

int main() {
	uint16_t v = 65535;
	uint16_t b = 1;
	uint16_t result;
	if (v + b < v) {
	    handle_error("overflow");
	} else {
	    result = v + b;
	}
	return 0;
}
