// The Fibonacci sequence is defined by the recurrence relation:

// Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
// Hence the first 12 terms will be:
// 1 1 2 3 5 8 13 21 34 55 89 144

// The 12th term, 114, is the first term to contain three digits.

// What is the first term in the Fibonacci sequence to contain 1000 digits?

function crazyAdd([a, b]) {
  a = a.slice().reverse()
  b = b.slice().reverse()
  for(var i = 0; i < b.length; i++) {
    if(a[i]) {
      b[i] += a[i]
    }
    if(b[i] > 9) {
      b[i] -= 10
      b[i + 1] = (b[i + 1] || 0) + 1
    }
  }
  return b.reverse()
}

function firstFibOfLength(len) {
  var fibs = [[1], [1]]
  var count = 2
  while(fibs[1].length < len) {
    fibs.push(crazyAdd(fibs))
    fibs.shift()
    count++
  }
  return count
}

console.log(firstFibOfLength(1000))
// 4782

// 1070066266382758936764980584457396885083683896632151665013235203375314520604694040621889147582489792657804694888177591957484336466672569959512996030461262748092482186144069433051234774442750273781753087579391666192149259186759553966422837148943113074699503439547001985432609723067290192870526447243726117715821825548491120525013201478612965931381792235559657452039506137551467837543229119602129934048260706175397706847068202895486902666185435124521900369480641357447470911707619766945691070098024393439617474103736912503231365532164773697023167755051595173518460579954919410967778373229665796581646513903488154256310184224190259846088000110186255550245493937113651657039447629584714548523425950428582425306083544435428212611008992863795048006894330309773217834864543113205765659868456288616808718693835297350643986297640660000723562917905207051164077614812491885830945940566688339109350944456576357666151619317753792891661581327159616877487983821820492520348473874384736771934512787029218636250627816
