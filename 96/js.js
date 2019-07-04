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

const Cells = []

for (let i = 0; i < 81; i++) {
  Cells.push(0b000000000)
}

const initializeCells = (inputGrid) => {
  inputGrid.forEach((int, index) => {
    if (int === 0) {
      Cells[index] = 0b000000000
    } else {
      Cells[index] = 0b111111111 ^ (2 ** (int - 1))
    }
  })
}

const solution = (isNot) => {
  if (isNot !== 0) {
    const isMaybe = 0b111111111 & isNot
    if ((isMaybe & (isMaybe - 1)) == 0) {
      return isMaybe
    }
  }
}

const colRest = (idx) => {
  const offset = idx % 9
  const indexes = [0,9,18,27,36,45,54,63,72]
  indexes.splice(Math.floor(idx / 9), 1)
  return indexes.map(i -> Cells[i + offset])
}

const rowRest = (idx) => {
  const offset = Math.floor(idx / 9) * 9
  const indexes = [0,1,2,3,4,5,6,7,8].map(x => x + offset)
  const foo = indexes.filter(x => x !== idx - offset) // this is lame
  return foo.map(i => Cells[i])
}

const gridRest = (idx) => {
  const col = idx % 9
  const row = Math.floor(idx / 9)
  const grid = (3 * Math.floor(row / 3)) + Math.floor(col / 3)
  const offset = (Math.floor(grid / 3) * 27) + (grid % 3) * 3
  const idxs = [0, 1, 2, 9, 10, 11, 18, 19, 20]
  // idxs.delete(idx - offset)
  return idxs.map(i => Cells[i + offset])
}

const peersSolutions = (idx) => {
  let out = 0b000000000
  [colRest(idx), rowRest(idx), gridRest(idx)].forEach(cell => {
    const s = solution(cell)
    if (s) {
      out |= s
    }
  })
  return out
}

const cellCalc = (index) => {
  if (solution(Cells[index])) {
    return
  }
  Cells[index] = peersSolutions(index)
  if (Cells[index] === 0b111111111) {
    return 'backout'
  }
  const isMaybe = 0b111111111 ^ Cells[index]
  if ((is_maybe & (is_maybe - 1)) === 0) {
    return
  }
}


console.log(Cells)
