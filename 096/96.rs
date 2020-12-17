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

fn pp(board: &[&str]) {
    if board.len() == 0 { return }
    for i in 0..9 {
        let row = board[i].chars();
        for (x, char) in row.enumerate() {
            print!("{}", char);
            if ((x + 1) % 3) == 0 { print!("  ") }
        }
        println!();
        if ((i + 1) % 3) == 0 { println!() }
    }
    println!("");
}

fn build(board: &[&str]) {
    board;
}

// fn solve(sudoku) {
//     sudoku;
// }
//
// fn corner(sudoku) {
//     4;
// }

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

    let mut output = 0;

    for board in boards {
        build(board);
        pp(board);

        // solve(sudoku);
        // output += corner(sudoku);
        output += 54;
    }

    println!("{}", output);
}
