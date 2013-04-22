(define master-kortlek% (class kortlek%
                          
                   (super-new )
                   
                   (define lista-kort (list (cons 'red (new kortlek%)) (cons 'blue (new kortlek%))(cons 'yellow (new kortlek%))(cons 'green (new kortlek%))
                   (cons 'orange (new kortlek%))(cons 'purple (new kortlek%))(cons 'grey (new kortlek%))(cons 'black (new kortlek%))(cons 'rainbow (new kortlek%))))
                   (define antal-kort 0)
                   
                   (define/public (master-ta-kort! tag)
                    (send (cdr (assq tag lista-kort)) ta-kort!))
  
                   (define/public (master-ta-random!)
                     (send (cdr ((list-ref lista-kort (+ (random 9) 1)))) ta-kort!))
                          
                   (define/public (get-antal-kort) antal-kort)
                   
                   (define/public (add-kort! kort-in)
                     (begin
                     (send (cdr (assq (send kort-in get-färg) lista-kort)) add-kort! kort-in)
                     (set! antal-kort (+ antal-kort 1))))
                     
                     
                     
                   
                   ;;temporär för att visa i command föster
                   (define/public (visa)
                     
                     (for-each (lambda (arg) (printf "~a ~n" (make-object image-snip% (send arg visa)) )) (cdr lista-kort))
                     )))