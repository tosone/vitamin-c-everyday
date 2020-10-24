LDFLAGS += -L.
CFLAGS  += -I. -std=c11 -Os -Wall
LBLIBS  += -laes
ARFLAGS  = rcs
TARGET   = aes.test

.PHONY: all
all: test.o libaes.a
	$(CC) -o $(TARGET) $< $(CFLAGS) $(LDFLAGS) $(LBLIBS)

libaes.a: aes.o
	$(AR) $(ARFLAGS) $@ $^

test:
	./$(TARGET)

.PHONY: clean
clean:
	$(RM) *.test *.o *.a
