; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_thm_1.11

(define (f-recursive n)
  (if (< n 3)
      n
      (+
        (f-recursive (- n 1))
        (f-recursive (- n 2))
        (f-recursive (- n 3)))))

; f(3) = f(2) + f(1) + f(0) = 2 + 1 + 0 = 3
; f(4) = f(3) + f(2) + f(1) = 3 + 2 + 1 = 6
; f(5) = f(4) + f(3) + f(2) = 6 + 3 + 2 = 11
;   ^                         ^   ^   ^
;   count                     a   b   c
(define (f-iteration a b c count)
  (if (= count 0)
      c
      (f-iteration
                  (+ a b c)
                  a
                  b
                  (- count 1))))

(define (f-iterative n)
  (f-iteration 2 1 0 n))

(print (f-recursive 10))
(print (f-iterative 10))
