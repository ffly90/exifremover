# Define variables
CC = go
BUILD_DIR = bin
SRC_DIR = cmd/webexif
BINARY_NAME = webexif

# Define targets and their dependencies
all: build

build: npm
	@echo "Building..."
	$(CC) build -o $(BUILD_DIR)/$(BINARY_NAME) $(SRC_DIR)/main.go

npm:
	cd web/static/ && npx webpack

clean:
	@echo "Cleaning..."
	rm -rf $(BUILD_DIR)

run:
	@echo "Running..."
	$(CC) run $(SRC_DIR)/main.go

# Define phony targets (targets that don't represent actual files)
.PHONY: all build clean run
