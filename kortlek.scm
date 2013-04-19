(define kortlek% (class object%
                   
                   (super-new)
                   
                   (define lista-kort (mcons 'lek  '{}))
                   
                   (define/public (blanda) void)
                   
                   (define/public (ta-kort!)
                     (let ((current (mcdr lista-kort) ) (ut #f))
                     
                     
                     (cond
                       ((null? current) (error "du det var tomte här"))
                       (else (set! ut (mcar(mcdr lista-kort))) (set-mcdr! lista-kort (mcdr current))ut)
                       )))
                   
                   (define/public (del-kort) void)
                   
                   (define/public (add-kort! kort-in)
                     
                     (set-mcdr! lista-kort (mcons kort-in (mcdr lista-kort))))
                     
                     
                   
                   ;;temporär för att visa i command föster
                   (define/public (visa)
                     
                     (m-for-each (lambda (arg) (printf "~a ~n" (make-object image-snip% (send arg visa)) )) (mcdr lista-kort))
                     )
                   
                   (define (m-for-each fun lista)
                     
                     (cond
                       
                       ((or (null? lista) (eq? lista '{})) void)
                       ((null? (mcar lista)) void)
                       (else (fun (mcar lista)) (m-for-each fun (mcdr lista)))
                       )
                     
                     )
                   
                     
                     
                     ))