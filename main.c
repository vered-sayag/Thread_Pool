#include <unistd.h>
#include "threadPool.h"

void hello (void* a)
{
    printf("hello\n");
}


void test_thread_pool_sanity()
{
    int i;

    ThreadPool* tp = tpCreate(5);

    for(i=0; i<10; ++i)
    {
        tpInsertTask(tp,hello,NULL);
    }
    usleep(1);
    tpDestroy(tp,0);
    //ThreadPool* tp2 = tpCreate(5);
    printf("%d",tpInsertTask(tp,hello,NULL));

}


int main()
{
    test_thread_pool_sanity();

    return 0;
}