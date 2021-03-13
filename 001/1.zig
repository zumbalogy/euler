// The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
// The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn sumUnder(x: u32) u32 {
    return ((x * x) + x) / 2;
}

fn sumSteps(step: u32, limit: u32) u32 {
    return sumUnder((limit - 1) / step) * step;
}

pub fn main() !void {
    const x = sumSteps(3, 1000) + sumSteps(5, 1000) - sumSteps(15, 1000);
    try stdout.print("{d}\n", .{x});
}
