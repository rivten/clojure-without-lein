(ns t
  (:gen-class)
  (:require e))

(defn -main
  [& args]
  (println 
    (greet (nth args 0))))
