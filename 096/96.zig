// Su Doku (Japanese for 'number place') is the name of a popular puzzle.
// Its origin is unclear but Leonhard Euler invented a similar, harder,
// puzzle called Latin Squares.
//
// The goal of Su Doku is to replace the blanks (or zeros) in a 9x9 grid in
// such that each row, column, and 3x3 box contains each of the digits 1-9.
//
// A proper Su Doku puzzle has a unique solution and is solvable by logic,
// although it may be necessary to employ "guess and test" methods.
//
// The file sudoku.txt contains 50 Su Doku puzzles ranging in difficulty.
// Find the sum of the 3-digit numbers in the top left corner of each solution.

const std = @import("std");
const dir = std.fs.cwd();
const stdout = std.io.getStdOut().writer();

var Cells = [_]u32 {0} ** 81;

fn key(x: u32) u32 {
    if (x == 0b111111110) { return 1; }
    if (x == 0b111111101) { return 2; }
    if (x == 0b111111011) { return 3; }
    if (x == 0b111110111) { return 4; }
    if (x == 0b111101111) { return 5; }
    if (x == 0b111011111) { return 6; }
    if (x == 0b110111111) { return 7; }
    if (x == 0b101111111) { return 8; }
    if (x == 0b011111111) { return 9; }
    return 0;
}

fn unkey(x: u32) u32 {
    if (x == 1) { return 0b111111110; }
    if (x == 2) { return 0b111111101; }
    if (x == 3) { return 0b111111011; }
    if (x == 4) { return 0b111110111; }
    if (x == 5) { return 0b111101111; }
    if (x == 6) { return 0b111011111; }
    if (x == 7) { return 0b110111111; }
    if (x == 8) { return 0b101111111; }
    if (x == 9) { return 0b011111111; }
    return 0b000000000;
}

fn printGrid() void {
    var x:u8 = 0;
    while (x < 81) : (x += 1) {
        const k = key(Cells[x]);
        std.debug.warn(" ", .{});
        if (k == 0) {
            std.debug.warn(".", .{});
        } else {
            std.debug.warn("{}", .{k});
        }
        if ((x + 1) % 3 == 0) {
            std.debug.warn("   ", .{});
        }
        if ((x + 1) % 9 == 0) {
            std.debug.warn("\n", .{});
        }
        if ((x + 1) % 27 == 0) {
            std.debug.warn("\n", .{});
        }
    }
    std.debug.warn("\n", .{});
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = &arena.allocator;
    defer arena.deinit();
    const file_name = "096/sudoku.txt";
    const file_size = 10 * 501;
    const file_contents = try dir.readFileAlloc(allocator, file_name, file_size);
    defer allocator.free(file_contents);

    var lines = std.mem.split(file_contents, "\n");
    var total: u32 = 0;
    var line_number: u32 = 0;
    while (lines.next()) |line| {
        defer line_number += 1;
        if (line_number == 10) {
            break;
        }
        if (line_number % 10 == 0) {
            continue;
        }
        // std.debug.warn("{c}\n", .{line[0]});
        // std.debug.warn("\n", .{});

        const current_line_number: u32 = (line_number % 10) - 1;
        var current_col_number: u32 = 0;

        while (current_col_number < 9) : (current_col_number += 1) {
            // std.debug.warn("{c} ", .{line[current_col_number]});


            Cells[(current_line_number * 9) + current_col_number] = unkey(line[current_col_number] - 48);
        }
    }
    // try stdout.print("{d}\n", .{total});
    printGrid();
}
// 228
