NAME		= a.out
SRCDIR		= ./src
SRCS		= $(shell find $(SRCDIR) -name "*.cpp" -type f | xargs)
OBJS		= $(SRCS:.cpp=.o)
DEPENDS		= $(OBJS:.o=.d)
CXX			= g++
CXXFLAGS	= -Wall -Wextra -Werror -std=c++98 -pedantic -MMD -MP
CXXFLAGS += -g
INCDIR  = -I/usr/include/
INCDIR  += -I/usr/local/include/
LIBDIR  = -L/usr/lib/
LIBDIR  += -L/usr/local/lib/
LIBS    = 

.PHONY: all
all: $(NAME)

-include $(DEPENDS)

$(NAME): $(OBJS)
	$(CXX) $(CXXFLAGS) $(INCDIR) -o $(NAME) $(OBJS) $(LIBDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) $(DEPENDS) $(NAME)
