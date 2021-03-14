// Three distinct points plotted on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, form a triangle.
//
// Consider the following two triangles:
// A(-340, 495), B(-153, -910), C(835, -947)
// X(-175, 41), Y(-421, -714), Z(574, -645)
//
// It can be verified that triangle ABC contains the origin, whereas XYZ does not.
//
// Using triangles.txt, a 27K text file containing the co-ordinates of one thousand "random" triangles,
// find the number of triangles for which the interior contains the origin.

const std = @import("std");
const dir = std.fs.cwd();
const stdout = std.io.getStdOut().writer();

fn ray(x1: f32, y1: f32, x2: f32, y2: f32) bool {
    if (0 <= (y1 * y2)) {
        return false;
    }
    return 0 < x1 + ((x2 - x1) * ((- y1) / (y2 - y1)));
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = &arena.allocator;
    defer arena.deinit();
    const file_name = "102/triangles.txt";
    const file_size = (5 * 6) * 1001;
    const file_contents = try dir.readFileAlloc(allocator, file_name, file_size);
    defer allocator.free(file_contents);

    var lines = std.mem.split(file_contents, "\n");
    var total: u32 = 0;
    while (lines.next()) |line| {
        var shape = [_] f32 {0,0,0,0,0,0};
        var points = std.mem.split(line, ",");
        var idx: u8 = 0;
        while (points.next()) |point| {
            const val = try std.fmt.parseFloat(f32, point);
            shape[idx] = val;
            idx += 1;
        }
        var intersect_count: u8 = 0;
        if (ray(shape[0], shape[1], shape[2], shape[3])) {
            intersect_count += 1;
        }
        if (ray(shape[0], shape[1], shape[4], shape[5])) {
            intersect_count += 1;
        }
        if (ray(shape[2], shape[3], shape[4], shape[5])) {
            intersect_count += 1;
        }
        if (intersect_count == 1 or intersect_count == 3) {
            total += 1;
        }
    }
    try stdout.print("{d}\n", .{total});
}
// 228
