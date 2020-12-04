(ns series)
(require 'clojure.string)

(defn slices [string length]
  (if (== length 0)
    [""]
    (map clojure.string/join (partition length 1 string))))
