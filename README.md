# Empty C Project Structure with Simple Makefile
C Project structure I use.

Make file uses gcc. It will automatically detect src and header files and outputs .o to a folder name obj and the executable will be placed in .bin

make: will compile the entire project.

make clean: removes the obj files only and leave the executable in tact.

make distclean: removes all generated files.

Change the target name to desired executable name in the make file.  Compiling and running the project as is will print the following message:

"Empty Project: path/to/exe/a.exe"

