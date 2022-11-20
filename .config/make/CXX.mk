CXXFLAGS := -Wall -Wpedantic -Wextra
CPPFLAGS := -MMD -MP

SRCS := $(wildcard *.cpp)
DEPS := $(SRCS:.cpp=.d)
OBJS := $(SRCS:.cpp=.o)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

-include $(DEPS)
