# the executable this build produces, named in one place so the build and clean steps cannot disagree
TARGET = testing

# every .cpp file under src/ is compiled, so a new source is picked up without editing this file
SOURCES = $(wildcard src/*.cpp)

# warnings are on by default, so a project started from this template does not hide them
CXXFLAGS = -Wall -Wextra

all: $(TARGET)

$(TARGET): $(SOURCES)
	@echo "---"
	@echo "Compiling $(SOURCES)"

	g++ $(CXXFLAGS) $(SOURCES) -o $(TARGET)

	@echo "Finished compiling $(SOURCES)"

clean:
	@echo "---"
	@echo "Removing $(TARGET)"

	rm -f ./$(TARGET)

	@echo "Finished removing $(TARGET)"

.PHONY: all clean
