(defn mess
  ([] (mess "hello"))
  ([msg] println msg))

;; 3
(defn greet ([] (greet "world")) ([z] (str "hello " z)) ([x y] (println x ", " y)))

;; 8
(defn oppo [f] (fn [& args] (not (apply f args))))

;; 7
(defn trip [f] (f) (f) (f))

;; 9
(defn tripa [f & args] (apply f args) (apply f args) (apply f args))
(tripa (fn [& a] (apply println "hello" a)))

;; 10
(Math/cos Math/PI)

(def sa (fn [x] (+ (Math/pow (Math/sin x) 2) (Math/pow (Math/cos x) 2))))

;; 11 

(defn htget [url] (slurp url))

;; 12

(defn onless [f x] (fn [& args] (apply f x args)))
((onless println "hello") "world" "of evil")

;; 13
(defn seqc [f g] (fn [x] (f (g x))))
