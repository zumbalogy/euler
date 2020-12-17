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

use std::fs;
use std::path::Path;

fn main() {
    let dir = Path::new(file!())
        .parent()
        .unwrap()
        .display();
    let path = format!("{}/{}", dir, "sudoku.txt");
    let data = fs::read_to_string(path).unwrap();
    let lines: Vec<&str> = data
        .split("\n")
        .collect();
    let boards = lines
        .chunks(10)
        .into_iter()
        .map(|x| &x[1..])
        .collect::<Vec<_>>();

    println!("{}", boards[1][0]);
}
