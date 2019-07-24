//vered sayag
//318211737
#ifndef __THREAD_POOL__
#define __THREAD_POOL__
#include <stdio.h>
#include <sys/types.h>
#include "osqueue.h"
#include <pthread.h>
#include <malloc.h>
typedef struct thread_pool
{
 pthread_t* threads;
 int n;
 volatile int isDestroy;
 volatile int shouldWaitForTasks;
 pthread_mutex_t* mutex;
 struct os_queue* queue;
 pthread_cond_t *cond;
}ThreadPool;

typedef struct Task_
{
    void (*computeFunc)(void *);
    void *param;
}Task;

typedef struct For_Thread
{
    int* isDestroy;
    int* shouldWaitForTasks;
    pthread_mutex_t* mutex;
    struct os_queue* queue;
    pthread_cond_t *cond;

}ForThread;

ThreadPool* tpCreate(int numOfThreads);

void tpDestroy(ThreadPool* threadPool, int shouldWaitForTasks);

int tpInsertTask(ThreadPool* threadPool, void (*computeFunc) (void *), void* param);

#endif
