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

fn cast

fn printGrid() void {
    var x:u8 = 0;
    while (x < 81) : (x += 1) {
        std.debug.warn("{}", .{Cells[x]});
        if ((x + 1) % 3 == 0) {
            std.debug.warn(" ", .{});
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

//
// fn ray(x1: f32, y1: f32, x2: f32, y2: f32) bool {
//     if (0 <= (y1 * y2)) {
//         return false;
//     }
//     return 0 < x1 + ((x2 - x1) * ((-y1) / (y2 - y1)));
// }

pub fn main() !void {
    // var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // const allocator = &arena.allocator;
    // defer arena.deinit();
    // const file_name = "102/triangles.txt";
    // const file_size = (5 * 6) * 1001;
    // const file_contents = try dir.readFileAlloc(allocator, file_name, file_size);
    // defer allocator.free(file_contents);
    //
    // var lines = std.mem.split(file_contents, "\n");
    // var total: u32 = 0;
    // while (lines.next()) |line| {
    //     var shape = [_]f32{ 0, 0, 0, 0, 0, 0 };
    //     var points = std.mem.split(line, ",");
    //     var idx: u8 = 0;
    //     while (points.next()) |point| {
    //         const val = try std.fmt.parseFloat(f32, point);
    //         shape[idx] = val;
    //         idx += 1;
    //     }
    //     var intersect_count: u8 = 0;
    //     if (ray(shape[0], shape[1], shape[2], shape[3])) {
    //         intersect_count += 1;
    //     }
    //     if (ray(shape[0], shape[1], shape[4], shape[5])) {
    //         intersect_count += 1;
    //     }
    //     if (ray(shape[2], shape[3], shape[4], shape[5])) {
    //         intersect_count += 1;
    //     }
    //     if (intersect_count == 1 or intersect_count == 3) {
    //         total += 1;
    //     }
    // }
    // try stdout.print("{d}\n", .{total});
    // try stdout.print("{d}\n", .{Cells[0]});
    printGrid();
}
// 228
