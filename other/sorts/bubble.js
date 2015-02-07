function bubble(array){
  for (var x = 0; x < array.length; x++){
    for (var y = 0; y < array.length - 1; y++){
      var foo = array[y]
      var bar = array[y + 1]
      if (foo > bar) {
        array[y] = bar
        array[y + 1] = foo
      }
    }
  }
  return array
}
