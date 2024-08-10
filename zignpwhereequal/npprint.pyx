import cython
cimport cython
import os
import numpy as np
cimport numpy as np
import time, subprocess
from libcpp.string cimport string
from libcpp.unordered_map cimport unordered_map
import ctypes
import re
this_folder = os.path.dirname(__file__)


ctypedef fused fusednumbers:
    np.npy_byte
    np.npy_ubyte
    np.npy_short
    np.npy_ushort
    np.npy_int
    np.npy_uint
    np.npy_long
    np.npy_ulong
    np.npy_longlong
    np.npy_ulonglong
    np.npy_intp
    np.npy_uintp
    np.npy_float
    np.npy_double
    np.npy_longdouble
    cython.longdoublecomplex

ctypedef void (*func_t)(size_t,size_t,size_t,size_t,size_t,size_t,size_t,size_t,size_t,size_t) noexcept nogil ;


def compile_it(ziglibfile):
    zigpathstr = os.path.normpath(os.path.join(this_folder, ziglibfile))
    winpathstr = re.sub(r'\.zig$','.dll',zigpathstr)
    linuxpathstr = re.sub(r'\.zig$','.so',zigpathstr)
    win_path=os.path.exists(winpathstr)
    linux_path=os.path.exists(linuxpathstr)
    if not os.path.exists(winpathstr) and not os.path.exists(winpathstr) :
        old_folder=os.getcwd()
        os.chdir(this_folder)
        subprocess.run(
        ["zig", "build-lib", ziglibfile, "-dynamic", "-O", "ReleaseFast"],
        shell=True,
        env=os.environ,
        )
        time.sleep(1)
        win_path=os.path.exists(winpathstr)
        linux_path=os.path.exists(linuxpathstr)
        os.chdir(old_folder)
    if win_path:
        return winpathstr
    if linux_path:
        return linuxpathstr
    raise OSError('Zig library not found')

ziglibfile='zigprint.zig'
library_path_string=compile_it(ziglibfile)
_func_cache = []


cdef unordered_map[string, func_t] get_lookup_dict(str dllpathstr,dict functiondict):
    cdef:
        unordered_map[string, func_t] dtype_lookup
    cta = ctypes.cdll.LoadLibrary(dllpathstr)
    _func_cache.append(cta)
    for npdtype,zigfunction in functiondict.items():
        ctypes_f=getattr(cta, zigfunction)
        dtype_lookup[npdtype]=(<func_t*><size_t>ctypes.addressof(ctypes_f))[0]
    return dtype_lookup

functiondict={
"i":"np_zig_where_c_int",
"l":"np_zig_where_c_int",
"L":"np_zig_where_c_uint",
"I":"np_zig_where_c_uint",
"b":"np_zig_where_c_char",
"B":"np_zig_where_c_char",
"h":"np_zig_where_c_short",
"H":"np_zig_where_c_ushort",
"q":"np_zig_where_c_longlong",
"Q":"np_zig_where_c_ulonglong",
"f":"np_zig_where_f32",
"d":"np_zig_where_f64",
"D":"np_zig_where_f128",
}


cdef:
    unordered_map[string, func_t] dtype_lookup = get_lookup_dict(
        dllpathstr=library_path_string,
        functiondict=functiondict,
)



cpdef np.ndarray npzigwhere(unsigned char op, fusednumbers[:] value, fusednumbers[:] a,str dtype, unsigned long long[:] shape_of_a):
    cdef:
        bytes byte_type=dtype.encode()
        const char* byte_type_char=byte_type
        size_t address_of_shape = <size_t>&shape_of_a[0]
        size_t len_shape_of_a=shape_of_a.shape[0]
        size_t a_array_ptr = <size_t>&a[0]
        size_t len_a = np.prod(shape_of_a)
        np.ndarray[np.npy_uintp, ndim=1, mode="c", cast=False] done_index_full = np.zeros(len_shape_of_a, dtype=np.uintp)
        size_t[:] done_index = done_index_full
        size_t address_done_index = <size_t>&done_index[0]
        np.ndarray[np.npy_uintp, ndim=1, mode="c", cast=False] index_reversed_full = np.arange(len_shape_of_a, dtype=np.uintp)[::-1].astype(np.uintp)
        size_t[:] index_reversed=index_reversed_full
        size_t address_index_reversed = <size_t>&index_reversed[0]
        size_t len_index_reversed = index_reversed_full.shape[0]
        size_t address_value=<size_t>&value[0]
        np.ndarray[np.npy_uintp, ndim=2, mode="c", cast=False] result_array_full = np.empty((len_a,len_shape_of_a), dtype=np.uintp)
        np.ndarray[np.npy_uintp, ndim=1, mode="c", cast=False] result_counter_full = np.zeros(1, dtype=np.uintp)
        size_t[:,:] result_array=result_array_full
        size_t[:] result_counter=result_counter_full
        size_t address_result_array=<size_t>&result_array[0][0]
        size_t address_result_counter=<size_t>&result_counter[0]
        np.ndarray[np.npy_ubyte, ndim=1, mode="c", cast=False] operator_array_full = np.array([op], dtype=np.uint8)
        unsigned char[:] operator_array=operator_array_full
        size_t operator_array_address=<size_t>&operator_array[0]
    dtype_lookup[byte_type_char](
        operator_array_address,
        address_result_array,
        address_result_counter,
        address_value,
        a_array_ptr,
        len_a,
        address_of_shape,
        address_done_index,
        address_index_reversed,
        len_index_reversed,
    )
    return result_array_full.ravel()[:result_counter_full[0]].reshape((-1, result_array_full.shape[1]))

