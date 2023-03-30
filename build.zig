const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("zig-test", "src/main.zig");
    lib.setBuildMode(mode);
    lib.install();
    lib.linkLibC();
    lib.addCSourceFile("src/source.c", &.{});
    lib.addIncludePath("src");

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);
    lib.linkLibC();
    main_tests.linkLibrary(lib);
    main_tests.addIncludePath("src");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
