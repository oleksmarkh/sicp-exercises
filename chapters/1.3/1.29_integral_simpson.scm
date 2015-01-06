; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-12.html#%_thm_1.29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; (f(a+dx/2)+f(a+dx+dx/2)+f(a+2*dx+dx/2)+...)*dx
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f
          (+ a (/ dx 2))
          add-dx
          b)
     dx))

; h/3*(y{0}+4*y{1}+2*y{2}+4*y{3}+2*y{4}+...+2*y{n-2}+4*y{n-1}+y{n})
; where h=(b-a)/n
;       y{k}=f(a+kh)
; for some even "n"
(define (integral_simpson f a b n)
  (define (h) (/ (- b a) n))
  (define (yk k) (f (+ a (* k (h)))))
  (define (term k)
    (cond ((or (= k 0) (= k n)) (yk k))
          ((even? k) (* 2 (yk k)))
          (else (* 4 (yk k)))))
  (define (next k) (+ k 1))
  (* (/ (h) 3)
     (sum term
          0
          next
          n)))

(define (even? k)
  (= (remainder k 2) 0))

(define (cube a)
  (* a a a))

(print (integral cube 0 1 0.01))
(print (integral cube 0 1 0.001))
(newline)
(print (integral_simpson cube 0 1 100))
(print (integral_simpson cube 0 1 1000))
