###########################################################
# autor: 	Stanislaw Pietrzak							  #
# email: 	integralzerox@gmail.com						  #
# gitHub:	https://github.com/Dev4Embedded/			  #
###########################################################

CC = gcc
OUTPUT_NAME = "versioning"
OUTPUT_PATH = ./Release/
INC_DIR = inc
SRC_DIR = src
SCRIPTS_DIR = scripts
TARGET_NAME = example.c
OBJECTIVES = 
RM := rm -rf

all: cleanup update target
cleanup:
	@$(SCRIPTS_DIR)/cleanup.sh $(SCRIPTS_DIR)
update:
	@echo 'Update firmware version'
	@$(SCRIPTS_DIR)/update.sh
target: 
	@echo 'Building target...';
	gcc -I"$(INC_DIR)" $(TARGET_NAME) -o $(OUTPUT_PATH)$(OUTPUT_NAME)
	@echo 'done.'

	