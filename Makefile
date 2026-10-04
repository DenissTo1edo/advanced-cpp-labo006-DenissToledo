CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -pedantic -Iinclude -Itests
BUILD_DIR := build
MAIN_TARGET := $(BUILD_DIR)/main
TEST_TARGET := $(BUILD_DIR)/test_linked_lists

.PHONY: all main test clean

all: $(MAIN_TARGET)

main: $(MAIN_TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(MAIN_TARGET): $(BUILD_DIR) tests/test_linked_lists.cpp
	$(CXX) $(CXXFLAGS) tests/test_linked_lists.cpp -o $@

$(TEST_TARGET): $(BUILD_DIR) tests/test_linked_lists.cpp
	$(CXX) $(CXXFLAGS) tests/test_linked_lists.cpp -o $@

test: $(TEST_TARGET)
	./$(TEST_TARGET)

clean:
	rm -rf $(BUILD_DIR)
