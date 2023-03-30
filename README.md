# Float in C variadic function

In C a `float` (f32) should be implicitly converted to `double` (f64)
when passed to a variadic function.

That is not happening when calling a C variadic function on Zig code.

Zig v0.10.1

We expect that these tests should pass.

```console
$ zig cc src/main.c src/source.c -Isrc -o main && ./main
OK
```

```console
$ zig test src/main.zig src/source.c -Isrc
1 passed; 0 skipped; 1 failed.
```
