# every .cpp file under src/ is compiled, so a new source is picked up without editing this file
SOURCES = $(wildcard src/*.cpp)

# warnings are on by default, so a project started from this template does not hide them
CXXFLAGS = -Wall -Wextra

all: testing

testing: $(SOURCES)
	@echo "---"
	@echo "Compiling $(SOURCES)"

	g++ $(CXXFLAGS) $(SOURCES) -o testing

	@echo "Finished compiling $(SOURCES)"

clean:
	@echo "---"
	@echo "Removing testing"

	rm -f ./testing

	@echo "Finished removing testing"

.PHONY: all clean
