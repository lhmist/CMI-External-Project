import numpy as np
cimport numpy as np
cdef int comb(int n,int k):
    if k>n:
        return 0
    if k*2>n:
        k=n-k
    if k==0:
        return 1
    
    cdef int result=n
    cdef unsigned int i
    for i in range(2,k+1):
        result *= n-i+1
        result /=i
    return result
def combinations(int n,int m,int f=1):
    """m*l array which give the distinct m-tuples of numbers 0 to n-1 with offset f"""
    if (m-1)*f>n:
        print('no tuples exist')
        return
    cdef int c
    c=comb(n-(f-1)*(m-1),m)
    cdef np.ndarray[np.int_t, ndim=2] A=np.empty((m,c),dtype=np.int)
    cdef unsigned int i, j, k
    for j in range(0,m):
        A[j,0]=0
    cdef unsigned int d=n-(m-1)*f-1
    for i in range(1,c):
        for j in range(m-1,-1,-1):
            if A[j,i-1]<d:
                for k in range(0,j):
                    A[k,i]=A[k,i-1]
                for k in range(j,m):
                    A[k,i]=A[j,i-1]+1
                break
    if f==0:
        return A
    else:
        return A+np.arange(0,m*f,f)[:,None]*np.ones((m,c),dtype=np.int)