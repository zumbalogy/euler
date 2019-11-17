;; Find the greatest product of 13 consecutive digits in the 1000-digit number.

(module
    ;; Import the required fd_write WASI function which will write the given io vectors to stdout
    ;; (File Descriptor, *iovs, iovs_len, nwritten) -> Returns number of bytes written
    (import "wasi_unstable" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))

    (memory $mem 1)
    ;; (export "memory" (memory $mem))
    ;; Write to memory at an offset of 0 bytes
    (data (i32.const 0) "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450")

    (func $printChar (param $char i64)
      ;; 10 = \n
      ;; 48 = 0
      ;; 65 = A
      ;; 97 = a
      (local $save1 i32)
      (local $save2 i32)
      (local $save3 i64)
      (local.set $save1 (i32.load (i32.const 0)))
      (local.set $save2 (i32.load (i32.const 4)))
      (local.set $save3 (i64.load (i32.const 8)))
      (i32.store (i32.const 0) (i32.const 8)) ;; iov.iov_base - This is a pointer to the start of the 'hello world\n' string
      (i32.store (i32.const 4) (i32.const 1)) ;; iov.iov_len - The length of the 'hello world\n' string
      (i64.store (i32.const 8) (local.get $char))
      (call $fd_write
        (i32.const 1) ;; file_descriptor - 1 for stdout
        (i32.const 0) ;; *iovs - The pointer to the iov array, which is stored at memory location 0
        (i32.const 1) ;; iovs_len - We're printing 1 string stored in an iov - so one.
        (i32.const 0)) ;; nwritten - A place in memory to store the number of bytes written
      (i32.store (i32.const 0) (local.get $save1))
      (i32.store (i32.const 4) (local.get $save2))
      (i64.store (i32.const 8) (local.get $save3))
      drop) ;; Discard the number of bytes written from the top the stack

    (func $printDigit (param $digit i64)
      (call $printChar (i64.add (i64.const 48) (local.get $digit))))

    (func $printNum (param $num i64)
      (local $i i64)
      (local $limit i64)
      (local.set $i (i64.const 1))
      (local.set $limit
        (i64.add
          (i64.const 1)
          (i64.div_u (local.get $num) (i64.const 10))))
      (loop $loop
        (if (i64.lt_u (local.get $i) (local.get $limit))
          (then
            (local.set $i (i64.mul (local.get $i) (i64.const 10)))
            (br $loop))))
      (loop $loop
        (call $printDigit (i64.div_u (local.get $num) (local.get $i)))
        (local.set $num (i64.rem_u (local.get $num) (local.get $i)))
        (local.set $i (i64.div_u (local.get $i) (i64.const 10)))
        (br_if $loop (i64.gt_u (local.get $i) (i64.const 0))))
      (call $printChar (i64.const 10)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (func $loadDigit (param $i i32) (result i64)
      (i64.sub
        (i64.load8_u (local.get $i))
        (i64.const 48)))

    (func $longest_product_from_len (param $len i32) (result i64)
      (local $acc i64)
      (local $top_acc i64)
      (local $i i32)
      (local $inner_i i32)
      (local $limit i32)
      (local.set $limit (i32.sub (i32.const 1000) (local.get $len)))
      (local.set $i (i32.const 0))
      (loop $loop
        (local.set $i (i32.add (i32.const 1) (local.get $i)))
        (local.set $acc (call $loadDigit (local.get $i)))
        (local.set $inner_i (i32.const 1))
        (loop $inner
          (local.set $acc
            (i64.mul
              (local.get $acc)
              (call $loadDigit
                (i32.add
                  (local.get $i)
                  (local.get $inner_i)))))
          (local.set $inner_i (i32.add (i32.const 1) (local.get $inner_i)))
          (br_if $inner (i32.ne (local.get $inner_i) (local.get $len))))
        (if (i64.lt_u (local.get $top_acc) (local.get $acc))
          (then (local.set $top_acc (local.get $acc))))
        (br_if $loop (i32.ne (local.get $i) (local.get $limit))))
      (local.get $top_acc))

    (func $main (export "_start")
      (call $printNum
        (call $longest_product_from_len (i32.const 13)))))
;; 23514624000
