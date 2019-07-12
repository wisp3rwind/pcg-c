# 
# PCG Random Number Generation for C.
# 
# Copyright 2014-2017 Melissa O'Neill <oneill@pcg-random.org>,
#                     and the PCG Project contributors.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)
#
# Licensed under the Apache License, Version 2.0 (provided in
# LICENSE-APACHE.txt and at http://www.apache.org/licenses/LICENSE-2.0)
# or under the MIT license (provided in LICENSE-MIT.txt and at
# http://opensource.org/licenses/MIT), at your option. This file may not
# be copied, modified, or distributed except according to those terms.
#
# Distributed on an "AS IS" BASIS, WITHOUT WARRANTY OF ANY KIND, either
# express or implied.  See your chosen license for details.
#
# For additional information about the PCG random number generation scheme,
# visit http://www.pcg-random.org/.
#

CURRENT_SRC_DIR=$(SRC_DIR)/sample
CURRENT_BUILD_DIR=$(BUILD_DIR)/sample

TARGETS_NAMES = pcg32-demo pcg32-global-demo pcg32x2-demo pcg64-demo

# Filenames only
OBJS_FILES = $(addsuffix .o, $(TARGETS_NAMES))

# Complete paths
OBJS = $(addprefix ${CURRENT_BUILD_DIR}/, $(OBJS_FILES))
TARGETS = $(addprefix ${CURRENT_BUILD_DIR}/, $(TARGETS_NAMES))

LDFLAGS  += -L$(BUILD_DIR)/src
LDLIBS   += -lpcg_random
CPPFLAGS += -I $(SRC_DIR)/include -I $(SRC_DIR)/extras
CFLAGS   += -std=c99 -Wall


# Top-level targets
all: $(TARGETS)

clean:
	rm -f $(OBJS) $(TARGETS)
	rm -rf actual

# Executables
$(TARGETS): %: %.o $(BUILD_DIR)/extras/entropy.o


# Compilation

$(BUILD_DIR)/extras/entropy.o: $(SRC_DIR)/extras/entropy.c | $(BUILD_DIR)/extras
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(OBJS): $(CURRENT_BUILD_DIR)/%.o: $(CURRENT_SRC_DIR)/%.c | $(CURRENT_BUILD_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) -I $(CURRENT_SRC_DIR) -c $< -o $@


# Make build dir
$(CURRENT_BUILD_DIR):
	mkdir -p $(CURRENT_BUILD_DIR)
$(BUILD_DIR)/extras:
	mkdir -p $(BUILD_DIR)/extras
