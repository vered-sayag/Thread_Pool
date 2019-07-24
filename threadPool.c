//vered sayag
//318211737
#include <unistd.h>
#include "threadPool.h"
#include <string.h>
#include <stdlib.h>

#define ERROR_MESSAGE "Error in system call\n"
#define ERROR write(2, ERROR_MESSAGE, strlen(ERROR_MESSAGE));

void *myThread(void *argv) {
    ForThread *forThread = (ForThread *) argv;
    Task *task;
    int empty;
    int shouldWaitForTasks;
    while (1) {
        pthread_mutex_lock(forThread->mutex);
        shouldWaitForTasks = *(forThread->shouldWaitForTasks);
        pthread_mutex_unlock(forThread->mutex);
        if (!shouldWaitForTasks) {
            break;
        }
        pthread_mutex_lock(forThread->mutex);
        empty = osIsQueueEmpty(forThread->queue);
        if (!empty) {
            task = (Task *) osDequeue(forThread->queue);
            pthread_mutex_unlock(forThread->mutex);
            task->computeFunc(task->param);
            free(task);
        } else if (*(forThread->isDestroy)) {
            pthread_mutex_unlock(forThread->mutex);
            break;
        } else {
            pthread_cond_wait(forThread->cond, forThread->mutex);

        }
    }
    free(forThread);
}

ThreadPool *tpCreate(int numOfThreads) {
    ThreadPool *threadPool = (ThreadPool *) malloc(sizeof(ThreadPool));
    if (threadPool == NULL) {
        ERROR
        exit(-1);
    }
    threadPool->mutex = NULL;
    threadPool->cond = NULL;
    threadPool->threads = NULL;
    threadPool->queue = NULL;

    threadPool->isDestroy = 0;
    threadPool->shouldWaitForTasks = 1;
    threadPool->n = numOfThreads;
    threadPool->mutex = (pthread_mutex_t *) malloc(sizeof(pthread_mutex_t));
    if (threadPool->mutex == NULL) {
        ERROR
        free(threadPool);
        exit(-1);
    }
    threadPool->cond = (pthread_cond_t *) malloc(sizeof(pthread_cond_t));
    if (threadPool->cond == NULL) {
        free(threadPool->mutex);
        free(threadPool);
        ERROR
        exit(-1);
    }

    const pthread_mutexattr_t mutexattr = (pthread_mutexattr_t) PTHREAD_MUTEX_ERRORCHECK;
    if (pthread_mutex_init(threadPool->mutex, &mutexattr)) {
        free(threadPool->cond);
        free(threadPool->mutex);
        free(threadPool);
        ERROR
        exit(-1);
    }
    if (pthread_cond_init(threadPool->cond, NULL)) {
       pthread_mutex_destroy(threadPool->mutex);
        free(threadPool->cond);
        free(threadPool->mutex);
        free(threadPool);
        ERROR
        exit(-1);
    }

    threadPool->threads = (pthread_t *) calloc(numOfThreads, sizeof(pthread_t));
    if (threadPool->threads == NULL) {
        pthread_cond_destroy(threadPool->cond);
        pthread_mutex_destroy(threadPool->mutex);
        free(threadPool->cond);
        free(threadPool->mutex);
        free(threadPool);
        ERROR
        exit(-1);
    }
    threadPool->queue = osCreateQueue();
    if (threadPool->queue == NULL) {
        pthread_cond_destroy(threadPool->cond);
        pthread_mutex_destroy(threadPool->mutex);
        free(threadPool->cond);
        free(threadPool->mutex);
        free(threadPool->threads);
        free(threadPool);
        ERROR
        exit(-1);
    }

    int i;
    for (i = 0; i < threadPool->n; i++) {
        ForThread *forThread = (ForThread *) malloc(sizeof(ForThread));
        if (forThread == NULL) {
            ERROR
            tpDestroy(threadPool, 0);
            exit(-1);
        }
        forThread->isDestroy = (int *) &(threadPool->isDestroy);
        forThread->queue = threadPool->queue;
        forThread->shouldWaitForTasks = (int *) &(threadPool->shouldWaitForTasks);
        forThread->mutex = threadPool->mutex;
        forThread->cond = threadPool->cond;
        if (pthread_create(&(threadPool->threads[i]), NULL, myThread, forThread)) {
            free(forThread);
            ERROR
            tpDestroy(threadPool, 0);
            exit(-1);

        }
    }

    return threadPool;
}

void tpDestroy(ThreadPool *threadPool, int shouldWaitForTasks) {
    if (threadPool != NULL && !threadPool->isDestroy) {
        if (threadPool->mutex != NULL) {
            pthread_mutex_lock(threadPool->mutex);
            threadPool->isDestroy = 1;
            threadPool->shouldWaitForTasks = shouldWaitForTasks;
            pthread_mutex_unlock(threadPool->mutex);

            if (threadPool->cond != NULL) {
                pthread_cond_broadcast(threadPool->cond);
            }
        }
        if (threadPool->threads != NULL) {
            int i;
            for (i = 0; i < threadPool->n; i++) {
                if ((threadPool->threads)[i] != 0) {
                    if ((threadPool->cond != NULL) && (threadPool->mutex != NULL)) {
                        pthread_join((threadPool->threads)[i], NULL);
                    } else {
                        pthread_cancel((threadPool->threads)[i]);
                    }

                }
            }
            free(threadPool->threads);
            threadPool->threads=NULL;
        }
        if (threadPool->queue != NULL) {
            while (!osIsQueueEmpty(threadPool->queue)){
                free(osDequeue(threadPool->queue));
            }
            osDestroyQueue(threadPool->queue);
            threadPool->queue=NULL;
        }

        if (threadPool->mutex != NULL) {
            if (pthread_mutex_destroy(threadPool->mutex)) {
                ERROR
                free(threadPool->mutex);
                threadPool->mutex=NULL;
                pthread_cond_destroy(threadPool->cond);
                free(threadPool->cond);
                threadPool->cond=NULL;
                free(threadPool);
                exit(-1);
            }
            free(threadPool->mutex);
            threadPool->mutex=NULL;
        }
        if (threadPool->cond != NULL) {
            if (pthread_cond_destroy(threadPool->cond)) {
                ERROR
                free(threadPool->cond);
                threadPool->cond=NULL;
                free(threadPool);
                exit(-1);
            }
            free(threadPool->cond);
            threadPool->cond=NULL;
        }
        free(threadPool);
    }
}

int tpInsertTask(ThreadPool *threadPool, void (*computeFunc)(void *), void *param) {

    if (threadPool == NULL || threadPool->isDestroy) {
        return -1;
    }
    Task *task = (Task *) malloc(sizeof(Task));
    if (task == NULL) {
        ERROR
        tpDestroy(threadPool, 0);
        exit(-1);
    }
    task->computeFunc = computeFunc;
    task->param = param;
    pthread_mutex_lock(threadPool->mutex);
    osEnqueue(threadPool->queue, task);
    pthread_mutex_unlock(threadPool->mutex);
    pthread_cond_signal(threadPool->cond);

    return 0;
}