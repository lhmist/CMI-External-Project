import numpy as np
def random_points(n,x=1,y=1):
    return np.array([x,y])[None,:]*np.random.random((n,2))
def edges(P):
    """find all edges/pairs of distinct points P"""
    A=np.triu_indices(P.shape[0],k=1)
    return np.concatenate((P[A[0],None,:],P[A[1],None,:]),axis=1)
def circumcentre(T):
    """find the center and radius of the circumcircle for triangle T,
    T is a 3*2 array of three points in the x,y plane; x coordinate given first
    """
    A=T[:,0]*T[:,0]+T[:,1]*T[:,1]
    B=np.roll(T,-1,axis=0)-np.roll(T,1,axis=0)
    return 0.5*np.sum((A[:,None],B[:,::-1]),axis=0)/np.sum((T[:,:],B[:,::-1]),axis=0)
def vcircumcentre(T):
    """vectorised circumcentre"""
    A=T[:,:,0]*T[:,:,0]+T[:,:,1]*T[:,:,1]
    B=np.roll(T,-1,axis=1)-np.roll(T,1,axis=1)
    return 0.5*np.sum(A[:,:,None]*B[:,:,::-1],axis=1)/np.sum(T*B[:,:,::-1],axis=1)
def triangles(P):
    """find all triangles/triples of disctinct points P"""