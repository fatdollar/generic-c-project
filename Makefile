#put desired executable name here
TARGET = a

#change to g++ or desired compiler
CC = gcc
#change flags as desired
CFLAGS = -g -O -Wall

#executable goes here
BINDIR = ./bin
#location of header files
INCDIR = inc
#location of c files 
SRCDIR = src
#object files go here
OBJDIR = ./obj

INCS = $(wildcard *.h $(foreach fd, $(INCDIR), $(fd)/*.h)) #get list of all .h files
SRCS = $(wildcard *.c $(foreach fd, $(SRCDIR), $(fd)/*.c)) #get list of all .c files
SRCFILES = $(notdir $(SRCS)) #remove directory from .c files for obj directory
OBJS = $(addprefix $(OBJDIR)/, $(SRCFILES:c=o)) #get lis of .o files - obj/xxx.o
INC_FLAG = $(addprefix -I./, $(INCDIR)) #include flag for gcc

#add these if using libraries
#LIBS = -llibname 
#LIB_DIRS = -L/dir/to/lib

#executable
$(TARGET): dir $(OBJS)
	$(CC) -o $(BINDIR)/$@ $(OBJS)

#object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INCS)
	$(CC) $(CFLAGS) $(INC_FLAG) -o $@ -c $<  

clean: #just remove .o files
	rm -rf $(OBJDIR)
	
distclean: #remove everything
	rm -rf $(BINDIR) $(OBJDIR)

dir: #create build directories
	mkdir -p $(BINDIR) $(OBJDIR)

echoes: #run "make echoes" to check that all diretories are discovered/referenced correctly
	@echo "INC files: $(INCS)"
	@echo "SRC files: $(SRCS)"
	@echo "OBJ files: $(OBJS)"
	@echo "INC flag: $(INC_FLAG)"
	@echo "SRCFILES: $(SRCFILES)"
	@echo "CLEAN: $(BINDIR) $(OBJDIR)"