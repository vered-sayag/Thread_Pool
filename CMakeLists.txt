cmake_minimum_required(VERSION 3.14)
project(MA4 C)

set(CMAKE_C_STANDARD 99)

add_executable(MA4 threadPool.c threadPool.h osqueue.c osqueue.h main.c)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")
