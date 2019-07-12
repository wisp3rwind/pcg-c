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

PREFIX ?= /usr/local
SRC_DIR ?= .
BUILD_DIR ?= ./build

PREFIX_ABS = $(abspath $(PREFIX))
SRC_DIR_ABS = $(abspath $(SRC_DIR))
BUILD_DIR_ABS = $(abspath $(BUILD_DIR))

all:
	make -C src BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make -C test-low BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make -C test-high BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make -C sample BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"

install: all
	install $(BUILD_DIR)/src/libpcg_random.a $(PREFIX)/lib
	install -m 0644 $(SRC_DIR)/include/pcg_variants.h $(PREFIX)/include

test:   all
	make test -C test-low BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make test -C test-high BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"

clean:
	make clean -C src BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make clean -C test-low BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make clean -C test-high BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	make clean -C sample BUILD_DIR="$(BUILD_DIR_ABS)" SRC_DIR="$(SRC_DIR_ABS)"
	rm -rf $(BUILD_DIR_ABS)/extras
