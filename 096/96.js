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

const fs = require('fs')

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
    const isMaybe = 0b111111111 ^ isNot
    if ((isMaybe & (isMaybe - 1)) == 0) {
      return isMaybe
    }
  }
}

const colRest = (idx) => {
  const offset = idx % 9
  const indexes = [0,9,18,27,36,45,54,63,72]
  indexes.splice(Math.floor(idx / 9), 1)
  return indexes.map(i => Cells[i + offset])
}

const rowRest = (idx) => {
  const offset = Math.floor(idx / 9) * 9
  const indexes = [0,1,2,3,4,5,6,7,8].map(x => x + offset)
  const foo = indexes.filter(x => x !== idx - offset)
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
  const peers = colRest(idx).concat(rowRest(idx)).concat(gridRest(idx))
  peers.forEach(cell => {
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
  if ((isMaybe & (isMaybe - 1)) === 0) {
    return
  }
  let done = false
  const rests = [colRest(index), rowRest(index), gridRest(index)]
  rests.forEach(rest => {
    if (!done) {
      let hasToBe = isMaybe
      rest.forEach(x => hasToBe &= x)
      if (hasToBe !== 0b000000000) {
        if ((hasToBe & (hasToBe - 1)) === 0) {
          Cells[index] = 0b111111111 ^ hasToBe
          done = true
        } else {
          done = 'backout'
        }
      }
    }
  })
  return done
}

const solvedCount = () => {
  return Cells.filter(solution).length
}

const singleCalc = () => {
  for (let i = 0; i < 81; i++) {
    if (cellCalc(i) === 'backout') {
      return 'backout'
    }
  }
}

const repeatCalc = () => {
  let tally = solvedCount()
  let res = singleCalc()
  if (res === 'backout') {
    return 'backout'
  }
  while (tally !== solvedCount()) {
    tally = solvedCount()
    res = singleCalc()
    if (res === 'backout') {
      return 'backout'
    }
  }
}

const solve = (cellIndex) => {
  cellIndex = cellIndex || 0
  const res = repeatCalc()
  if (res === 'backout') {
    return
  }
  if (solvedCount() === 81) {
    return
  }
  const saved = Object.assign([], Cells)
  const cell = Cells[cellIndex]
  const allGuesses = [
    0b000000001,
    0b000000010,
    0b000000100,
    0b000001000,
    0b000010000,
    0b000100000,
    0b001000000,
    0b010000000,
    0b100000000,
  ]
  const guesses = allGuesses.filter(g => (g & cell) === 0b000000000)
  for (let i = 0; i < guesses.length; i++) {
    const numberGuess = guesses[i]
    Cells[cellIndex] = 0b111111111 ^ numberGuess
    solve(cellIndex + 1)
    if (solvedCount() === 81) {
      return
    }
    saved.forEach((c, i) => Cells[i] = c)
  }
}

const cellKey = {
  0b000000001: 1,
  0b000000010: 2,
  0b000000100: 3,
  0b000001000: 4,
  0b000010000: 5,
  0b000100000: 6,
  0b001000000: 7,
  0b010000000: 8,
  0b100000000: 9
}

const text = fs.readFileSync(__dirname + '/sudoku.txt', 'utf8')
const chunks = text.match(/\d{9}/g)

let eulerCount = 0

for (let i = 0; i < chunks.length; i += 9) {
  const chunk = chunks.slice(i, i + 9)
  const digits = chunk.join('').split('').map(Number)
  initializeCells(digits)
  solve()
  const corner = Cells.slice(0, 3).map(x => cellKey[solution(x)])
  eulerCount += Number(corner.join(''))
}

console.log(eulerCount)
