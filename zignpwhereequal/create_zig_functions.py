zigfunction = "np_zig_where"
zigfuncraw = R"""export fn FUNCTIONZIG_DATATYPEZIG(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]DATATYPEZIG;
    const thisdtype_no_pointer = DATATYPEZIG;
    const pointer_address_of_numpy_array: thisdtype = @ptrFromInt(address_of_numpy_array);
    const pointer_value_to_search_for: thisdtype = @ptrFromInt(value_to_search_for);
    const real_value_to_search_for: thisdtype_no_pointer = pointer_value_to_search_for[0];
    var pointer_address_of_tmp_numpy_shape_array: [*]usize = @ptrFromInt(address_of_tmp_numpy_shape_array);
    _ = &pointer_address_of_tmp_numpy_shape_array;
    const pointer_address_of_numpy_array_shape: [*]usize = @ptrFromInt(address_of_numpy_array_shape);
    const pointer_address_of_reversed_numpy_shape_range: [*]usize = @ptrFromInt(address_of_reversed_numpy_shape_range);
    var pointer_address_result_counter: [*]usize = @ptrFromInt(address_result_counter);
    var real_address_result_counter = pointer_address_result_counter[0];
    var pointer_address_result_array: [*]usize = @ptrFromInt(address_result_array);
    var positive_result: bool = false;
    const operator: [*]c_char = @ptrFromInt(op);
    var islt: bool = false;
    var isle: bool = false;
    var iseq: bool = false;
    var isge: bool = false;
    var isgt: bool = false;
    if (operator[0] == 0) {
        islt = true;
    } else if (operator[0] == 1) {
        isle = true;
    } else if (operator[0] == 2) {
        iseq = true;
    } else if (operator[0] == 3) {
        isge = true;
    } else if (operator[0] == 4) {
        isgt = true;
    }
    for (0..len_of_flat_numpy_array) |flat_index| {
        if (islt) {
            positive_result = (pointer_address_of_numpy_array[flat_index] < real_value_to_search_for);
        } else if (isle) {
            positive_result = (pointer_address_of_numpy_array[flat_index] <= real_value_to_search_for);
        } else if (iseq) {
            positive_result = (pointer_address_of_numpy_array[flat_index] == real_value_to_search_for);
        } else if (isge) {
            positive_result = (pointer_address_of_numpy_array[flat_index] >= real_value_to_search_for);
        } else if (isgt) {
            positive_result = (pointer_address_of_numpy_array[flat_index] > real_value_to_search_for);
        }
        if (positive_result) {
            calculate_nested_index_c_order(
                flat_index,
                pointer_address_of_numpy_array_shape,
                pointer_address_of_tmp_numpy_shape_array,
                pointer_address_of_reversed_numpy_shape_range,
                len_of_numpy_shape_array,
            );
            for (0..len_of_numpy_shape_array) |part_of_nested_index| {
                pointer_address_result_array[real_address_result_counter] = pointer_address_of_tmp_numpy_shape_array[part_of_nested_index];
                real_address_result_counter += 1;
            }
        }
    }
    pointer_address_result_counter[0] = real_address_result_counter;
}

    """
zigdatatypes = [
    "c_int",
    "c_int",
    "c_uint",
    "c_uint",
    "c_char",
    "c_char",
    "c_short",
    "c_ushort",
    "c_longlong",
    "c_ulonglong",
    "f32",
    "f64",
    "f128",
]
numpy_short_dtypes = [
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
    "D",
]

allfunctions = {}
# from rich import print
for zigdatatype, numpy_short_dtype in zip(zigdatatypes, numpy_short_dtypes):
    zigfuncdtyped = zigfuncraw.replace("DATATYPEZIG", zigdatatype).replace(
        "FUNCTIONZIG", zigfunction
    )
    allfunctions[numpy_short_dtype] = {
        "funcname": zigfunction + "_" + zigdatatype,
        "func": zigfuncdtyped,
    }
allfus = sorted({h["func"] for h in allfunctions.values()})
for f in allfus:
    print(f)

print("functiondict={")
for k, v in allfunctions.items():
    print(f""""{k}":"{v["funcname"]}",""")

print("}")
