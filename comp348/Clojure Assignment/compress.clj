(ns compress
  (:require [clojure.string :as str])
  (:require [clojure.java.io :as io]))

 (def word-frequencies (atom nil))

(defn load-word-frequencies [file-path]
  (let [reader (java.io.BufferedReader. (java.io.FileReader. file-path))
        frequencies (atom {})]
    (try
      (loop [line (.readLine reader)]
        (when line
          (doseq [word (str/split (clojure.string/lower-case line) #"\s+")]
            (swap! frequencies #(if (contains? % word) % (assoc % word (count %)))))
          (recur (.readLine reader))))
      (finally
        (.close reader)))
    @frequencies))

(defn compress-file [file-name word-frequencies]
  (let [content (slurp file-name)
        words (re-seq #"\W+|\w+" content)]
    (defn process-word [word]
      (if (re-matches #"\w+" word)
        (let [cleaned-word (clojure.string/lower-case word)
              original-word (if (re-matches #"\w+" word) word nil)]
          (let [replacement (or (get word-frequencies cleaned-word)
                                (if (re-matches #"\d+" cleaned-word) (str "@" cleaned-word "@") cleaned-word))]
            (if original-word
              (if (Character/isUpperCase (.charAt original-word 0))
                (str (Character/toUpperCase (.charAt replacement 0)) (subs replacement 1))
                replacement)
              replacement)))
        word))

    (let [compressed (map process-word words)]
      (spit (str file-name ".ct") (apply str compressed))
      (str file-name ".ct"))))
  

(defn apply-formatting-rules
  [decompressed-content]
  (-> decompressed-content
      (str/replace #"(?i)\b(?<=[.!?])\s+" "") ; Remove spaces after punctuation
      (str/replace #"\(\s+" "(")
      (str/replace #"\[\s+" "[")
      (str/replace #"\s+\)" ")")
      (str/replace #"\s+\]" "]")
      (str/replace #"\s+–\s+" " – ") ; Add spaces around dashes
      (str/replace #"\s+@(\d+)@\s+" " $1 ") ; Remove @ symbols from encoded numbers, allowing for surrounding characters
      (str/replace #"\$(\d+)\s+" "$$1")
      (str/replace #"\.(\d+)([^.!?]+)?" (fn [match]
                                          (let [number (second match)
                                                rest (if (next (next match))
                                                       (second (next (next match)))
                                                       "")]
                                            (if (empty? rest)
                                              (str ". " number)
                                              (str ". " (clojure.string/capitalize rest))))))
      (str/replace-first #"\. (\w)" #(clojure.string/capitalize (second %)))))

(defn decompress
  [file-name]
  (let [compressed-content (slurp file-name)
        frequencies (load-word-frequencies "frequency.txt")
        compressed-words (str/split compressed-content #"\s+")
        decompressed-words (for [word compressed-words
                                 :let [decompressed-word (if (re-matches #"\d+" word)
                                                           (let [numeric-label (Integer. word)
                                                                 entry (some #(when (= numeric-label (second %)) %) frequencies)]
                                                             (if entry (first entry) word))
                                                           word)]]
                             decompressed-word)]
    (apply-formatting-rules (clojure.string/join " " decompressed-words))))