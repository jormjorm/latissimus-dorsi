CC = gcc
CFLAGS = `pkg-config --cflags gtk4 glib-2.0`
LDFLAGS = `pkg-config --libs gtk4 glib-2.0`

all: deltoidUI injector

deltoidUI: deltoidUI.o
	$(CC) -o deltoidUI deltoidUI.o $(LDFLAGS)

injector: Injector.o
	$(CC) -o injector Injector.o $(LDFLAGS)

%.o: %.c
	$(CC) -c $< $(CFLAGS)

clean:
	rm -f *.o deltoidUI injector

.PHONY: all clean
