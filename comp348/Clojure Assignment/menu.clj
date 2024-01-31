(ns menu
  (:gen-class)
  (:require [clojure.string :as str]
            [clojure.java.io :as io]))
 ;(:require [compress :as cmp]))

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
              original-case (cond
                              (= word cleaned-word) :unchanged
                              (= word (clojure.string/upper-case word)) :fully-uppercase
                              :else :capitalized)]

          (let [replacement (or (get word-frequencies cleaned-word)
                                (if (re-matches #"\d+" cleaned-word) (str "@" cleaned-word "@") cleaned-word))]
            (case original-case
              :unchanged replacement
              :capitalized (clojure.string/capitalize replacement)
              :fully-uppercase (clojure.string/upper-case replacement)
              replacement)))
        word))

    (let [compressed (map process-word words)]
      (spit (str file-name ".ct") (apply str compressed))
      (str file-name ".ct"))))

(defn apply-formatting-rules
  [decompressed-content]
  (-> decompressed-content
      (str/replace #"\s*\@\s*(\d+)\s*\@" "$1") ; Handle @number@ format
       ;(str/replace #"\s+@(\d+)@\s+" " $1 ")
      (str/replace-first #"\b\w+\b" #(clojure.string/capitalize %))
       ;(str/replace #"\b(\p{Lu}\p{Ll}*)\b" #(if (empty? (re-find #"\p{Lu}" %)) % (clojure.string/capitalize %)))
      (str/replace #"\s+\(\s+" " (")
      (str/replace #"\s+\)\s+" ") ")
      (str/replace #"\s*,\s*" ", ")
      (str/replace #"\s+–\s+" " – ")
      (str/replace #"\s+\$\s+" (java.util.regex.Matcher/quoteReplacement " $"))
       (str/replace #"\s*\@\s*(\d+)\s*\@" " $1 ") ; Handle standalone @ symbols with numbers
      (str/replace #"\s+@\s+" " @")
      (str/replace #"\s+\[\s+" " [")
      (str/replace #"\s+\]\s+" "] ")
      (str/replace #"\s*\.\s*(\w)" (fn [match] (str ". " (.toUpperCase (second match)))))
      (str/replace #"\s*\?\s*(\w)" (fn [match] (str "? " (.toUpperCase (second match)))))
      (str/replace #"\s*\!\s*(\w)" (fn [match] (str "! " (.toUpperCase (second match)))))
      (str/replace #"[.,!?;:()\[\]\$]" (fn [match] (str match)))))


(defn decompress
  [file-name]
  (let [compressed-content (slurp file-name)
        frequencies (load-word-frequencies "frequency.txt")
        compressed-tokens (re-seq #"\b\w+\b|[.,!?;:\-()@\[\]\$]" compressed-content) ; Include brackets, parentheses, and dollar sign
        decompressed-tokens (for [token compressed-tokens
                                  :let [decompressed-token (if (re-matches #"\b\w+\b" token)
                                                             (if (re-matches #"\s+@(\d+)@\s+" token)
                                                               (subs token 1 (dec (.length token))) ; Extract the number without @ symbols
                                                               (if (re-matches #"\d+" token)
                                                                 (let [numeric-label (Integer. token)
                                                                       entry (some #(when (= numeric-label (second %)) %) frequencies)]
                                                                   (if entry (first entry) token))
                                                                 token))
                                                             token)]]
                              decompressed-token)]
    (apply-formatting-rules (clojure.string/join " " decompressed-tokens))))



(defn showMenu []
  (println "\n\n*** Compression Menu ***")
  (println "------------------\n")
  (println "1. Display list of files")
  (println "2. Display file contents")
  (println "3. Compress a file")
  (println "4. Uncompress a file")
  (println "5. Exit")
  ;(do
  (print "\nEnter an option? ")
  (flush)
    ; (read-line)))
  (str/trim (read-line)))




(defn option1 []
  (println "File list:")
  (doseq [file (file-seq (io/file "."))]
    (when (.isFile file)
      (println (.getName file)))))



(defn option2 []
  (print "\nPlease enter a file name => ")
  (flush)
  (let [file-name (read-line)]
    (let [file (io/file file-name)]
      (if (.exists file)
        (println (str "Contents of " file-name ": " (slurp file)))
        (println (str "File " file-name " does not exist."))))))

(defn option3 []
  (print "\nPlease enter a file name => ")
  (flush)
  (let [file-name (read-line)
        file (io/file file-name)]
    (if (.exists file)
      (do
        (compress-file file-name @word-frequencies)
        (println "File compressed successfully."))
      (println "File" file-name "does not exist."))))


(defn option4
  []
  (print "\nPlease enter a file name => ")
  (flush)
  (let [file-name (read-line)]
    (let [decompressed-content (decompress file-name)]
      (println (str "\nDecompressed content:\n" decompressed-content)))))






(defn processOption
  [option]
  (if (= option "1")
    (option1)
    (if (= option "2")
      (option2)
      (if (= option "3")
        (option3)
        (if (= option "4")
          (option4)
          (println "Invalid Option, please try again"))))))



(defn menu
  []
  (let [option (str/trim (showMenu))]
    (if (= option "5")
      (println "\nGood Bye\n")
      (do
        (processOption option)
        (recur)))))

; ------------------------------

(defn -main [& args] ())
(reset! word-frequencies (load-word-frequencies "frequency.txt"))
(menu)