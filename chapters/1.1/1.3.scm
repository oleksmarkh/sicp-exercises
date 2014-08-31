; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html#%_thm_1.3

(define (sqare a)
  (* a a))

(define (sum-of-squares a b)
  (+ (sqare a) (sqare b)))

(define (sum-of-bigger-squares a b c)
  (if (> a b)
    (if (> b c)
      (sum-of-squares a b)
      (sum-of-squares a c))
    (if (> a c)
      (sum-of-squares b a)
      (sum-of-squares b c))))

(print (sum-of-bigger-squares 2 1 3))
