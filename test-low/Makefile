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

CURRENT_SRC_DIR=$(SRC_DIR)/test-low
CURRENT_BUILD_DIR=$(BUILD_DIR)/test-low

TARGETS_NAMES =   check-mcg-128-rxs-m-64 check-mcg-128-xsh-rr-64       \
            check-mcg-128-xsh-rs-64 check-mcg-128-xsl-rr-64            \
            check-mcg-16-rxs-m-8 check-mcg-16-xsh-rr-8                 \
            check-mcg-16-xsh-rs-8 check-mcg-32-rxs-m-16                \
            check-mcg-32-xsh-rr-16 check-mcg-32-xsh-rs-16              \
            check-mcg-64-rxs-m-32 check-mcg-64-xsh-rr-32               \
            check-mcg-64-xsh-rs-32 check-mcg-64-xsl-rr-32              \
            check-oneseq-128-rxs-m-64 check-oneseq-128-rxs-m-xs-128    \
            check-oneseq-128-xsh-rr-64 check-oneseq-128-xsh-rs-64      \
            check-oneseq-128-xsl-rr-64 check-oneseq-128-xsl-rr-rr-128  \
            check-oneseq-16-rxs-m-8 check-oneseq-16-rxs-m-xs-16        \
            check-oneseq-16-xsh-rr-8 check-oneseq-16-xsh-rs-8          \
            check-oneseq-32-rxs-m-16 check-oneseq-32-rxs-m-xs-32       \
            check-oneseq-32-xsh-rr-16 check-oneseq-32-xsh-rs-16        \
            check-oneseq-64-rxs-m-32 check-oneseq-64-rxs-m-xs-64       \
            check-oneseq-64-xsh-rr-32 check-oneseq-64-xsh-rs-32        \
            check-oneseq-64-xsl-rr-32 check-oneseq-64-xsl-rr-rr-64     \
            check-oneseq-8-rxs-m-xs-8 check-setseq-128-rxs-m-64        \
            check-setseq-128-rxs-m-xs-128 check-setseq-128-xsh-rr-64   \
            check-setseq-128-xsh-rs-64 check-setseq-128-xsl-rr-64      \
            check-setseq-128-xsl-rr-rr-128 check-setseq-16-rxs-m-8     \
            check-setseq-16-rxs-m-xs-16 check-setseq-16-xsh-rr-8       \
            check-setseq-16-xsh-rs-8 check-setseq-32-rxs-m-16          \
            check-setseq-32-rxs-m-xs-32 check-setseq-32-xsh-rr-16      \
            check-setseq-32-xsh-rs-16 check-setseq-64-rxs-m-32         \
            check-setseq-64-rxs-m-xs-64 check-setseq-64-xsh-rr-32      \
            check-setseq-64-xsh-rs-32 check-setseq-64-xsl-rr-32        \
            check-setseq-64-xsl-rr-rr-64 check-setseq-8-rxs-m-xs-8     \
            check-unique-128-rxs-m-64 check-unique-128-rxs-m-xs-128    \
            check-unique-128-xsh-rr-64 check-unique-128-xsh-rs-64      \
            check-unique-128-xsl-rr-64 check-unique-128-xsl-rr-rr-128  \
            check-unique-16-rxs-m-8 check-unique-16-rxs-m-xs-16        \
            check-unique-16-xsh-rr-8 check-unique-16-xsh-rs-8          \
            check-unique-32-rxs-m-16 check-unique-32-rxs-m-xs-32       \
            check-unique-32-xsh-rr-16 check-unique-32-xsh-rs-16        \
            check-unique-64-rxs-m-32 check-unique-64-rxs-m-xs-64       \
            check-unique-64-xsh-rr-32 check-unique-64-xsh-rs-32        \
            check-unique-64-xsl-rr-32 check-unique-64-xsl-rr-rr-64

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
all: $(TARGETS) $(CURRENT_BUILD_DIR)/run-tests.sh

clean:
	rm -f $(OBJS) $(TARGETS)
	rm -rf actual

test: $(TARGETS)
	sh $(CURRENT_BUILD_DIR)/run-tests.sh


# Executables
$(TARGETS): %: %.o $(BUILD_DIR)/extras/entropy.o


# Compilation

$(BUILD_DIR)/extras/entropy.o: $(SRC_DIR)/extras/entropy.c | $(BUILD_DIR)/extras
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(OBJS): $(CURRENT_BUILD_DIR)/%.o: $(CURRENT_SRC_DIR)/%.c | $(CURRENT_BUILD_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) -I $(CURRENT_SRC_DIR) -c $< -o $@


# Copy test runner to build dir
$(CURRENT_BUILD_DIR)/run-tests.sh: run-tests.sh | $(CURRENT_BUILD_DIR)
	cp $< $@


# Make build dir
$(CURRENT_BUILD_DIR):
	mkdir -p $(CURRENT_BUILD_DIR)
$(BUILD_DIR)/extras:
	mkdir -p $(BUILD_DIR)/extras
