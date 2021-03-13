// By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

// 3
// 7 4
// 2 4 6
// 8 5 9 3

// That is, 3 + 7 + 4 + 9 = 23.

// Find the maximum total from top to bottom of the triangle below:

// NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
// However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force)

const std = @import("std");
const stdout = std.io.getStdOut().writer();

var mat = [_][15]u32{
    [_]u32{75,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{95, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{17, 47, 82,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{18, 35, 87, 10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{20,  4, 82, 47, 65,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{19,  1, 23, 75,  3, 34,  0,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{88,  2, 77, 73,  7, 63, 67,  0,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{99, 65,  4, 28,  6, 16, 70, 92,  0,  0,  0,  0,  0,  0,  0},
    [_]u32{41, 41, 26, 56, 83, 40, 80, 70, 33,  0,  0,  0,  0,  0,  0},
    [_]u32{41, 48, 72, 33, 47, 32, 37, 16, 94, 29,  0,  0,  0,  0,  0},
    [_]u32{53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14,  0,  0,  0,  0},
    [_]u32{70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57,  0,  0,  0},
    [_]u32{91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48,  0,  0},
    [_]u32{63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31,  0},
    [_]u32{ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23}
};

fn foobar(limit: u8, x: *[15]u32, y: *[15]u32) void {
    var i: u8 = 0;
    while (i < limit) : (i += 1) {
        x.*[i] += std.math.max(y.*[i], y.*[i + 1]);
    }
}

pub fn main() !void {
    var i: u8 = 14;
    while (i > 0) : (i -= 1) {
        foobar(i, &mat[i - 1], &mat[i]);
    }
    try stdout.print("{d}\n", .{mat[0][0]});
}
// 1074
