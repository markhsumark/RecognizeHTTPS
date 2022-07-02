run: word-spliter
	./word-spliter < input.txt

word-spliter: lex.yy.c
	gcc -o $@ $<

lex.yy.c: word-spliter.l
	flex $<
