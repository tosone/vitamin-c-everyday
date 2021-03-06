CFLAGS  += 

CFiles = $(wildcard *.c)

.PHONY: c
c: $(CFiles)

.PHONY: $(CFiles)
$(CFiles):
	@echo Running `echo $@ | cut -d. -f1`:
	@echo
	@$(CC) $(CFLAGS) -std=c99 -Os -g3 -Wall \
	-o `echo $@ | cut -d. -f1`.test $@ $(LDFLAGS)
	@./`echo $@ | cut -d. -f1`.test
	@$(RM) -rf `echo $@ | cut -d. -f1`.test *.dSYM
	@echo
