#include <string>
#include <iostream>

/**
 * Whether debug() prints its messages. Set to false to silence them.
 */
bool debugFlag = true;

/**
 * Log a message to the console.
 */
void log(std::string message) {
    std::cout << "[LOG] " << message << std::endl;
}

/**
 * Log a debug message to the console, only if debugFlag is true.
 */
void debug(std::string message) {
    if (debugFlag) {
        std::cout << "[DEBUG] " << message << std::endl;
    }
}

int main() {
    std::string toPrint = "Hello World!";
    log(toPrint);
    debug("debugFlag is true, so this message is shown.");
    return 0;
}