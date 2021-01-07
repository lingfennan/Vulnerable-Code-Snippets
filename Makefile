all: bof bog

bof:
	gcc "Buffer Overflow/sprintf.c" -o "Buffer Overflow/sprintf"
	gcc "Buffer Overflow/bof1.c" -o "Buffer Overflow/bof1"

bog:
	gcc bad-overflow-guard/bad-overflow-guard.c -o bad-overflow-guard/bad-overflow-guard
