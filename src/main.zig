const std = @import("std");
const expectEqual = std.testing.expectEqual;

const c = @cImport({
    @cInclude("header.h");
});

test "it should work with f64" {
    // This works. This is fine.

    // Equivalent call in C: vaFunc(0, 1.0);
    try expectEqual(@as(f32, 1.0), c.vaFunc(0, @as(f64, 1.0)));
}

test "it should work with f32" {
    // In C floats (f32) should be implicitly converted to double (f64)
    // when passed to a variadic function.
    // That is not happening when calling a C variadic function on Zig code.

    // Equivalent call in C: vaFunc(0, 1.0f);
    try expectEqual(@as(f32, 1.0), c.vaFunc(0, @as(f32, 1.0)));
}
