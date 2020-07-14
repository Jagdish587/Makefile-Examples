INC =  -I includes


consoleApp : main.o function.o src/function2.o staticlibrary sharedlibrary
	g++ main.o function.o function2.o -o $@ -L . -lmylib -lcarplay

main.o : main.cpp
	g++ -c main.cpp $(INC)

function.o : function.cpp
	g++ -c function.cpp

src/function2.o : src/function2.cpp
	g++ -c src/function2.cpp


# This is static library

staticlibrary: function3.o
	ar rcs libmylib.a function3.o


function3.o : function3.cpp
	g++ -c function3.cpp

# generate shared library 

sharedlibrary : function4.cpp
	g++ -fPIC -c function4.cpp -o libcarplay.so -shared


clean:
	rm -rf *.o test carplay *.ar *.so *.a consoleApp
