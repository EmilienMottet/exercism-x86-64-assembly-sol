(ns reverse-string)

(defn reverse-string
  ([s] (apply str (reverse-string s '())))
  ([a acc]
   (if (empty? a)
     acc
     (recur (rest a) (conj acc (first a))))))
