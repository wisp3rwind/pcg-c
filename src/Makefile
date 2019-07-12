CURRENT_SRC_DIR=$(SRC_DIR)/src
CURRENT_BUILD_DIR=$(BUILD_DIR)/src

TARGETS = pcg-advance-8 pcg-advance-16 pcg-advance-32 pcg-advance-64 \
       pcg-advance-128 pcg-output-8 pcg-output-16 pcg-output-32   \
       pcg-output-64 pcg-output-128 pcg-rngs-8 pcg-rngs-16        \
       pcg-rngs-32 pcg-rngs-64 pcg-rngs-128 \
       pcg-global-32 pcg-global-64

# Filenames only
OBJS_FILES = $(addsuffix .o, $(TARGETS))

# Complete paths
OBJS = $(addprefix ${CURRENT_BUILD_DIR}/, $(OBJS_FILES))

CPPFLAGS += -I$(SRC_DIR)/include
CFLAGS += -O3 -Wall
CFLAGS   += -std=c99

all: $(CURRENT_BUILD_DIR)/libpcg_random.a

clean:
	rm -f $(OBJS)

$(CURRENT_BUILD_DIR):
	mkdir -p $(CURRENT_BUILD_DIR)

$(CURRENT_BUILD_DIR)/%.o: $(CURRENT_SRC_DIR)/%.c | $(CURRENT_BUILD_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(CURRENT_BUILD_DIR)/libpcg_random.a: $(OBJS)
	ar rc $@ $^
	ranlib $@

