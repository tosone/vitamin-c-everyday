TARGET     = main.test

CFLAGS    += -std=c11 -I. -Os -pthread
LDFLAGS   +=
CPPFLAGS  += -Wall

all: main.o adding.o
	$(CC) -o $(TARGET) $? $(LDFLAGS) $(LDLIBS)

test:
	./$(TARGET)

clean:
	$(RM) *.o *.test
