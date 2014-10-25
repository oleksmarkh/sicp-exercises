; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_thm_1.16

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter
                b
                (- counter 1)
                (* b product))))

(define (square a)
  (* a a))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

; a*b^n is invariant through iterations
; since b is constant, if n changes, a should change accordingly
; if n is even, b => b^2; n => n/2; a => a   since a*b^n = a*(b^2)^(n/2)
; if n is odd,  b => b;   n => n-1; a => a*b since a*b^n = a*b*b^(n-1)
(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter
                                  (square b)
                                  (/ n 2)
                                  a))
        (else (fast-expt-iter
                             b
                             (- n 1)
                             (* a b)))))

(print (expt 2 10))
(print (fast-expt 2 10))
