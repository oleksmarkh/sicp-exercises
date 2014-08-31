; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html#%_thm_1.7

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess prev-quess)
  (<
    (/
      (abs (- guess prev-quess))
      guess)
    0.001))

(define (sqrt-iter guess prev-quess x)
  (if (good-enough? guess prev-quess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  ; "guess" and "prev-guess" must differ on first iteration
  (sqrt-iter 1 2 x))

(print (sqrt 2.25))
