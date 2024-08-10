fn calculate_nested_index_c_order(flat_index: usize, pointer_address_of_numpy_array_shape: [*]usize, pointer_address_of_tmp_numpy_shape_array: [*]usize, pointer_address_of_reversed_numpy_shape_range: [*]usize, len_of_numpy_shape_array: usize) void {
    @setCold(false);
    @setFloatMode(.optimized);
    var var_get_out_0 = flat_index;
    var var_get_out_1: usize = 0;
    var var_stays: usize = 0;
    for (0..len_of_numpy_shape_array) |shape_index| {
        var_get_out_1 = @divFloor(var_get_out_0, pointer_address_of_numpy_array_shape[pointer_address_of_reversed_numpy_shape_range[shape_index]]);
        var_stays = @mod(var_get_out_0, pointer_address_of_numpy_array_shape[pointer_address_of_reversed_numpy_shape_range[shape_index]]);
        var_get_out_0 = var_get_out_1;
        pointer_address_of_tmp_numpy_shape_array[pointer_address_of_reversed_numpy_shape_range[shape_index]] = var_stays;
    }
}


export fn np_zig_where_c_char(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_char;
    const thisdtype_no_pointer = c_char;
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

export fn np_zig_where_c_int(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_int;
    const thisdtype_no_pointer = c_int;
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

export fn np_zig_where_c_longlong(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_longlong;
    const thisdtype_no_pointer = c_longlong;
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

export fn np_zig_where_c_short(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_short;
    const thisdtype_no_pointer = c_short;
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

export fn np_zig_where_c_uint(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_uint;
    const thisdtype_no_pointer = c_uint;
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

export fn np_zig_where_c_ulonglong(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_ulonglong;
    const thisdtype_no_pointer = c_ulonglong;
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

export fn np_zig_where_c_ushort(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]c_ushort;
    const thisdtype_no_pointer = c_ushort;
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

export fn np_zig_where_f128(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]f128;
    const thisdtype_no_pointer = f128;
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

export fn np_zig_where_f32(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]f32;
    const thisdtype_no_pointer = f32;
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

export fn np_zig_where_f64(op: usize, address_result_array: usize, address_result_counter: usize, value_to_search_for: usize, address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    @setFloatMode(.optimized);
    const thisdtype = [*]f64;
    const thisdtype_no_pointer = f64;
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
