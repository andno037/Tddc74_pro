(define kortlek% (class object%
                   (init-field )
                   (super-new )
                   
                   (define lista-kort (mcons 'lek  '{}))
                   (define antal-kort 0)
                   
                   (define/public (blanda) void)
                   
                   (define/public (ta-kort!)
                     (let ((current (mcdr lista-kort) ) (ut #f))
                     (cond
                       ((null? current) (error "du det var tomte här"))
                       (else  (set! antal-kort (- antal-kort 1))(set! ut (mcar(mcdr lista-kort))) (set-mcdr! lista-kort (mcdr current))ut)
                       )))
                   
                   (define/public (get-antal-kort) antal-kort)
                   
                   (define/public (del-kort) void)
                   
                   (define/public (add-kort! kort-in)
                     
                     (set-mcdr! lista-kort (mcons kort-in (mcdr lista-kort))) (set! antal-kort (+ antal-kort 1)))
                     
                     
                   
                   ;;temporär för att visa i command föster
                   (define/public (visa)
                     
                     (mfor-each (lambda (arg) (printf "~a ~n" (make-object image-snip% (send arg visa)) )) (mcdr lista-kort))
                     )))
