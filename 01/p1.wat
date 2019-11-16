;; Find the sum of all the multiples of 3 or 5 below 1000.

(module
    ;; Import the required fd_write WASI function which will write the given io vectors to stdout
    ;; (File Descriptor, *iovs, iovs_len, nwritten) -> Returns number of bytes written
    (import "wasi_unstable" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))

    (memory $mem 1)
    ;; (export "memory" (memory $mem))
    ;; Write 'hello world\n' to memory at an offset of 12 bytes
    ;; (data (i32.const 12) "hello world\n")

    (func $printChar (param $char i32)
      ;; 10 = \n
      ;; 48 = 0
      ;; 65 = A
      ;; 97 = a
      (local $save1 i32)
      (local $save2 i32)
      (local $save3 i32)
      (local.set $save1 (i32.load (i32.const 0)))
      (local.set $save2 (i32.load (i32.const 4)))
      (local.set $save3 (i32.load (i32.const 8)))
      (i32.store (i32.const 0) (i32.const 8)) ;; iov.iov_base - This is a pointer to the start of the 'hello world\n' string
      (i32.store (i32.const 4) (i32.const 1)) ;; iov.iov_len - The length of the 'hello world\n' string
      (i32.store (i32.const 8) (local.get $char))
      (call $fd_write
        (i32.const 1) ;; file_descriptor - 1 for stdout
        (i32.const 0) ;; *iovs - The pointer to the iov array, which is stored at memory location 0
        (i32.const 1) ;; iovs_len - We're printing 1 string stored in an iov - so one.
        (i32.const 0)) ;; nwritten - A place in memory to store the number of bytes written
      (i32.store (i32.const 0) (local.get $save1))
      (i32.store (i32.const 4) (local.get $save2))
      (i32.store (i32.const 8) (local.get $save3))
      drop) ;; Discard the number of bytes written from the top the stack

    (func $printDigit (param $digit i32)
      (call $printChar (i32.add (i32.const 48) (local.get $digit))))

    (func $printNum (param $num i32)
      (local $i i32)
      (local.set $i (i32.const 1000000000))
      (loop $loop
        (if (i32.gt_u (local.get $i) (local.get $num))
          (then
            (local.set $i (i32.div_u (local.get $i) (i32.const 10))))
          (else
            (call $printDigit (i32.div_u (local.get $num) (local.get $i)))
            (local.set $num (i32.rem_u (local.get $num) (local.get $i)))))
        (br_if $loop (i32.gt_u (local.get $i) (i32.const 0))))
      (call $printChar (i32.const 10)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (func $sum_under (param $x i32) (result i32)
      (i32.div_u
        (i32.add
          (local.get $x)
          (i32.mul
            (local.get $x)
            (local.get $x)))
        (i32.const 2)))

    (func $multiples_under (param $step i32) (param $limit i32) (result i32)
      (i32.mul
        (local.get $step)
        (call $sum_under
          (i32.div_u
            (i32.sub (local.get $limit) (i32.const 1))
            (local.get $step)))))

    (func $main (export "_start")
      (call $printNum
        (i32.sub
          (i32.add
            (call $multiples_under (i32.const 3) (i32.const 1000))
            (call $multiples_under (i32.const 5) (i32.const 1000)))
          (call $multiples_under (i32.const 15) (i32.const 1000))))))
          ;; 233168
