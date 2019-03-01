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

use std::fs;

fn ray_intersects(x1: f32, y1: f32, x2: f32, y2: f32) -> bool {
    if 0.0 <= (y1 * y2) {
        return false;
    }
    return 0.0 < x1 + ((x2 - x1) * ((- y1) / (y2 - y1)));
}

fn main() {
    let mut output = 0;
    let data = fs::read_to_string("triangles.txt").unwrap();
    let lines: Vec<&str> = data.split("\n").collect();
    for line in lines {
        let nums: Vec<&str> = line.split(",").collect();
        let x1 = nums[0].parse::<f32>().unwrap();
        let y1 = nums[1].parse::<f32>().unwrap();
        let x2 = nums[2].parse::<f32>().unwrap();
        let y2 = nums[3].parse::<f32>().unwrap();
        let x3 = nums[4].parse::<f32>().unwrap();
        let y3 = nums[5].parse::<f32>().unwrap();
        let mut intesects = 0;
        if ray_intersects(x1, y1, x2, y2) { intesects += 1; }
        if ray_intersects(x1, y1, x3, y3) { intesects += 1; }
        if ray_intersects(x2, y2, x3, y3) { intesects += 1; }
        if intesects == 1 {
            output += 1;
        }
    }
    println!("{}", output);
}
// 228
