cimport math as cm
cimport numpy as cnp
def combinations(int n,int m,int f=1):
    """m*l array which give the distinct m-tuples of numbers 0 to n-1 with offset f"""
    if (m-1)*f>m:
        print('no tuples exist')
    cdef int c
    c=cm.comb(n+(1-f)*m,m)
    cdef cnp.ndarray[cnp.int_t, ndim=2] A=cnp.empty((m,c),dtype=cnp.int)
    cdef unsigned int i, j, k
    for j in range(0,m):
        A[0,j]=0
    cdef int d=n+(m-1)*f-1
    for i in range(1,c):
        for j in range(0,m,-1):
            if A[i-1,j]<d:
                for k in range(0,j-1):
                    A[i,k]=A[i-1,k]
                for k in range(j,m):
                    A[i,k]=A[i-1,j]+1
                break
    return A+cnp.arrange(0,m*f,f)[:,None]*cnp.ones((m,c),dtype=cnp.int)