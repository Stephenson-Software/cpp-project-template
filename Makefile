# the executable this build produces, named in one place so the build and clean steps cannot disagree
TARGET = testing

# every .cpp file under src/ is compiled, so a new source is picked up without editing this file
SOURCES = $(wildcard src/*.cpp)

# every header under src/ is a prerequisite too, so editing one triggers a rebuild instead of running a stale executable
HEADERS = $(wildcard src/*.h src/*.hpp)

# the compiler is make's built-in CXX, which is g++ unless overridden by the environment or the command line (e.g. make CXX=clang++), so it can be swapped without editing this file
# warnings are on by default, so a project started from this template does not hide them
CXXFLAGS = -Wall -Wextra

# CPPFLAGS (e.g. -Iinclude), LDFLAGS (e.g. -L/opt/lib), and LDLIBS (e.g. -lpthread) are make's conventional variables and are left unset here
# they are passed through in make's built-in order, libraries after the sources, so e.g. make LDLIBS=-lpthread links a library without editing this file

all: $(TARGET)

# this file is a prerequisite as well, so editing a setting in it (e.g. CXXFLAGS) rebuilds with the new setting instead of keeping an executable built the old way
$(TARGET): $(SOURCES) $(HEADERS) Makefile
	@echo "---"
	@echo "Compiling $(SOURCES)"

	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(SOURCES) $(LDLIBS) -o $(TARGET)

	@echo "Finished compiling $(SOURCES)"

clean:
	@echo "---"
	@echo "Removing $(TARGET)"

	rm -f ./$(TARGET)

	@echo "Finished removing $(TARGET)"

# run the executable, building it first if it is missing or out of date, so nothing outside this file needs its name
run: $(TARGET)
	@echo "---"
	@echo "Running $(TARGET)"

	./$(TARGET)

	@echo "Finished running $(TARGET)"

.PHONY: all clean run
