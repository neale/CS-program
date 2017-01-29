CC     = gcc
CFLAGS =  -g -Wall -Wshadow -Wunreachable-code -Wredundant-decls -Wmissing-declarations -Wold-style-definition -Wmissing-prototypes -Wdeclaration-after-statement
PROGS  = otp_enc_d otp_dec_d otp_enc otp_dec keygen

all: $(PROGS)
	rm -f *o

otp_enc_d: otp_enc_d.c
	$(CC) -o otp_enc_d $(CFLAGS) otp_enc_d.c

otp_dec_d: otp_dec_d.c
	$(CC) -o otp_dec_d $(CFLAGS) otp_dec_d.c

otp_enc: otp_enc.c
	$(CC) -o otp_enc $(CFLAGS) otp_enc.c

otp_dec: otp_dec.c
	$(CC) -o otp_dec $(CFLAGS) otp_dec.c

keygen: keygen.c
	$(CC) -o keygen $(CFLAGS) keygen.c

clean:
	rm -f *o $(PROGS)
