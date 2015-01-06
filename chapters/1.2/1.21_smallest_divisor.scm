; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_thm_1.21

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n
                            (next test-divisor)))))

(define (square a)
  (* a a))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next a)
  (if (= a 2)
      3
      (+ a 2)))

(print (smallest-divisor 199))
(print (smallest-divisor 1999))
(print (smallest-divisor 19999))
