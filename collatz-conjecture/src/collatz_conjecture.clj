(ns collatz-conjecture)

(defn do_collatz [num, ct]
  (if (== num 1)
    ct
    (if (even? num)
      (do_collatz (bit-shift-right num 1) (inc ct))
      (do_collatz (inc (* num 3)) (inc ct)))))

(defn collatz [num]
  (do_collatz num 0))
