#include "gtest/gtest.h"
#include "A/index.h"
#include "B/lib.h"

TEST(ExampleSuite, GlobalVarTest)
{
    ASSERT_EQ(gVariable, 5);
}

TEST(ExampleSuite, LibraryTest)
{
    ASSERT_EQ(Lib::return11(), 11);
}