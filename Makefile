CFLAGS = -Os -Wall -Werror -pedantic --std=gnu99
CPPFLAGS = -I.
LDFLAGS =

all: relayd 

relayd: uloop.o main.o route.o
	$(CC) -o $@ $^ $(LDFLAGS)

relayd.h: list.h
uloop.c: uloop.h
main.c: uloop.h relayd.h
route.c: relayd.h

%.o: %.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -o $@ $^


clean:
	rm -f relayd *.o
