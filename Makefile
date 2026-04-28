# Makefile

# Targets for building deltoidUI and injector

# Compiler
CC = gcc

# Compiler flags
CFLAGS = `pkg-config --cflags gtk4 glib-2.0`

# Linker flags
LDFLAGS = `pkg-config --libs gtk4 glib-2.0`

# Build targets
all: deltoidUI injector

# deltoidUI target

deltoidUI: deltoidUI.o
\t$(CC) -o deltoidUI deltoidUI.o $(LDFLAGS)

# injector target

injector: injector.o
\t$(CC) -o injector injector.o $(LDFLAGS)

# Source files
%.o: %.c
\t$(CC) -c $< $(CFLAGS)

# Clean target
clean:
\trm -f *.o deltoidUI injector
