; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_thm_1.12

; row=1      1
; row=2     1 1
; row=3    1 2 1
; row=4   1 3 3 1
; row=5  1 4 6 4 1

(define (el row pos)
  (cond ((= pos 1) 1)
        ((= pos row) 1)
        (else (+
                (el (- row 1) (- pos 1))
                (el (- row 1) pos)))))

(print "    " (el 1 1))
(print "   " (el 2 1) " " (el 2 2))
(print "  " (el 3 1) " " (el 3 2) " " (el 3 3))
(print " " (el 4 1) " " (el 4 2) " " (el 4 3) " " (el 4 4))
(print (el 5 1) " " (el 5 2) " " (el 5 3) " " (el 5 4) " " (el 5 5))
