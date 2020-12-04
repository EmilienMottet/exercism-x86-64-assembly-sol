(ns beer-song)
(require '[clojure.core.match :refer [match]])
(require 'clojure.string)

(defn bottle_format
  [n]
  (match n
    0 "no more"
    n n))

(defn plurial
  [n]
  (match n
    1 ""
    _ "s"))

(defn take_bottle
  [n]
  (match n
    1 "it"
    _ "one"))

(defn action
  [n]
  (match n
    0 "Go to the store and buy some more"
    n (str "Take " (take_bottle n) " down and pass it around")))

(defn verse
  "Returns the nth verse of the song."
  [num]
  (let [next_bottle (mod (+ 99 num) 100)]
    (str (clojure.string/capitalize (bottle_format num)) " bottle" (plurial num) " of beer on the wall, " (bottle_format num) " bottle" (plurial num) " of beer.\n" (action num) ", " (bottle_format next_bottle) " bottle" (plurial next_bottle) " of beer on the wall.\n")))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end] (clojure.string/join "\n" (map #(verse %) (range start (dec end) -1)))))
