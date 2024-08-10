from __future__ import annotations
import numpy as np

try:
    import npprint

except Exception as e:
    import Cython, setuptools, platform, subprocess, os, sys, time

    iswindows = "win" in platform.platform().lower()
    if iswindows:
        addtolist = []
    else:
        addtolist = ["&"]

    olddict = os.getcwd()
    dirname = os.path.dirname(__file__)
    os.chdir(dirname)
    compile_file = os.path.join(dirname, "zigprint_compile.py")
    subprocess._USE_VFORK = False
    subprocess._USE_POSIX_SPAWN = False
    subprocess.run(
        " ".join([sys.executable, compile_file, "build_ext", "--inplace"] + addtolist),
        shell=True,
        env=os.environ,
        preexec_fn=None
        if iswindows
        else os.setpgrp
        if hasattr(os, "setpgrp")
        else None,
    )
    if not iswindows:
        time.sleep(30)
    import npprint

    os.chdir(olddict)


def _npzigwhere(o, v, a):
    rav = a.ravel()
    ashape = np.array(a.shape, dtype=np.uintp)
    npval = np.array([v], dtype=a.dtype)
    return npprint.npzigwhere(
        o,
        npval,
        rav,
        a.dtype.char,
        ashape,
    )


def npzigwhere_lt(a, v):
    return _npzigwhere(0, v, a)


def npzigwhere_le(a, v):
    return _npzigwhere(1, v, a)


def npzigwhere_eq(a, v):
    return _npzigwhere(2, v, a)


def npzigwhere_ge(a, v):
    return _npzigwhere(3, v, a)


def npzigwhere_gt(a, v):
    return _npzigwhere(4, v, a)
