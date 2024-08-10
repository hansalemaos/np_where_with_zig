from zignpwhereequal import (
    npzigwhere_lt,
    npzigwhere_le,
    npzigwhere_eq,
    npzigwhere_ge,
    npzigwhere_gt,
)
import numpy as np

shape = (
    1000,
    1000,
    10,
)

c = (
    np.random.randint(-1_000_000_000_000, 1_000_000_000_000, np.prod(shape), dtype="q")
    .reshape(shape)
    .astype("q")
)
dtypes = [
    "i",
    "l",
    "L",
    "I",
    "b",
    "B",
    "h",
    "H",
    "q",
    "Q",
    "f",
    "d",
]
no = 500
res1 = npzigwhere_lt(c, no)
print(res1)

res2 = npzigwhere_le(c, no)
print(res2)

res3 = npzigwhere_eq(c, no)
print(res3)

res4 = npzigwhere_ge(c, no)
print(res4)

res5 = npzigwhere_gt(c, no)
print(res5)

"""
print("lt")
%timeit res6 = np.where(c < no)
%timeit res1 = npzigwhere_lt(c, no)

print("le")
%timeit res7 = np.where(c <= no)
%timeit res2 = npzigwhere_le(c, no)

print("eq")
%timeit res8 = np.where(c == no)
%timeit res3 = npzigwhere_eq(c, no)

print("ge")
%timeit res9 = np.where(c >= no)
%timeit res4 = npzigwhere_ge(c, no)

print("gt")
%timeit res10 = np.where(c > no)
%timeit res5 = npzigwhere_gt(c, no)

"""
