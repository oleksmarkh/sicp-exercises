; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html#%_thm_1.7

(define (average a b)
  (/ (+ a b) 2))

(define (improve guess x)
  (average guess (/ x guess)))

; checks if "guess" doesn't change much from last iteration
(define (good-enough? guess prev-guess)
  (< (/ (abs (- guess prev-guess))
        guess)
     0.001))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  ; "guess" and "prev-guess" must differ on first iteration
  (sqrt-iter 1 2 x))

(print (sqrt 2.25))
