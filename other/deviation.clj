; https://gist.github.com/matthewrudy/8677812

; Given an array of integer elements and an integer d please consider all the sequences of d consecutive elements in the array. For each sequence we compute the difference between the maximum and the minimum value of the elements in that sequence and name it the deviation.

; Your task is to;

; write a function that computes the maximum value among the deviations of all the sequences considered above
; print the value the standard output (stdout)
; Note that your function will receive the following arguments:

; v which is the array of integers
; d which is an integer value giving the length of the sequences

; the array will contain up to 100,000 elements all the elements in the array are integer numbers in the following range: [1, 231 -1] the value of d will not exceed the length of the given array

; Input:
; v: 6, 9, 4, 7, 4, 1
; d: 3

; Output:
; 6


(defn deviate [array inputRange]
  ;recursivly, take 3 from array (then 3 from rest array, etc)
  ; then find the max diff within those 3 each time
  ; max of all those is the awnser
  )
