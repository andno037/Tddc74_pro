(define master-kortlek% (class kortlek%
                          
                   (super-new )
                   
                          
                   (define lista-kort (list (cons 'red (new kortlek%)) (cons 'blue (new kortlek%))(cons 'yellow (new kortlek%))(cons 'green (new kortlek%))
                   (cons 'white (new kortlek%))(cons 'purple (new kortlek%))(cons 'brown (new kortlek%))(cons 'black (new kortlek%))(cons 'rainbow (new kortlek%))))
                   (define antal-kort 0)
                   
                     
                          
                   (define/public (master-ta-kort! tag)
                    (send (cdr (assq tag lista-kort)) ta-kort!))
  
                   (define/public (master-ta-random!)
                     (send (cdr (list-ref lista-kort (random 9))) ta-kort!))
                          
                   (define/public (get-antal-master) antal-kort)
                   
                 
                  (define/public  master-add-kort! (lambda arg (if (null?(cdr arg)) (master-add-kort-intärn! (car arg)) (master-add-flera-kort-intärn! arg)) ))
                          
                  (define (master-add-flera-kort-intärn! lista)
                    
                    (for-each (lambda (arg) (master-add-kort-intärn! arg))  lista))
                    
                    
                          
                          
                 (define (master-add-kort-intärn! kort-in)
                   (send (cdr (assq (send kort-in get-färg) lista-kort) ) add-kort! kort-in)(set! antal-kort (+ antal-kort 1))
                   
                   )         
                          
                   ;;(define (get-add-kort) master-add-kort!)       
                          
                          
                          
                     
                     
                     
                   ;;fungerar ej 
                   ;;temporär för att visa i command föster
                   (define/public (visa-master)
                     
                     (for-each (lambda (arg) (printf "~a ~n" (make-object image-snip% (send (cdr arg) visa)) ))  lista-kort)
                     )))