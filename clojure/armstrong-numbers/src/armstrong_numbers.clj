(ns armstrong-numbers (:require [clojure.math.numeric-tower :as math]))

(defn armstrong? [num]
  (= num
     (reduce +
             (map
              (fn [itm]
                (math/expt (Long/valueOf (str itm))
                           (count (str num))))
              (str num)))))

;; (defn armstrong? [num]
;;   (= num
;;      (long
;;       (reduce +
;;               (map
;;                (fn [itm]
;;                  (Math/pow (Character/digit itm 10)
;;                            (count (str num))))
;;                (str num)))))
;; )
