(define spelare% (class object%
               (init-field färg namn dc x-led y-led tågbild)
               
               (set! uppdateringslista (cons this uppdateringslista))
               (define väglista '())
               (define antalpoäng 0)
               (define tmp-värde #f)
               (define antal-kort 0)    
               (define alla-kort (list (cons 'red  (new kortlek%)) (cons 'green (new kortlek%)) (cons 'blue (new kortlek%))  (cons 'yellow (new kortlek%)) (cons 'white (new kortlek%)) (cons 'rainbow (new kortlek%)) (cons 'purple (new kortlek%)) (cons 'brown (new kortlek%)) (cons 'black (new kortlek%)) ))
                   
                   
               (super-new)
               (define/public (get-färg) färg)
               (define/public (get-namn) namn)
               (define/public (get-köpt väg) (send väg köpt? this))
               (define/public (köpta) väglista)
               ;;(define/public (add-poäng! värde)(set! tmp-värde värde) (thread add-poäng-start))
                (define/public (add-poäng! värde) ( add-poäng-iter värde))
                   (define (add-poäng-iter värde)
                  (cond
                    ((= 0 värde) (uppdatera))
                    (else (set! antalpoäng (+ 1 antalpoäng)) (set-ny-p antalpoäng) (uppdatera-dig!) (uppdatera) (sleep 0.2) (add-poäng-iter (- värde 1))  )))
               
                   
                   
               (define (add-poäng-start)
                 (add-poäng-iter tmp-värde)
                 ) 
                   
               (define/public (add-kort! kort) 
                 (send (cdr (assq (send kort get-färg) alla-kort)) add-kort! kort)(set! antal-kort (+ antal-kort 1)))
                   
               (define/public (visa) 
                 (for-each (lambda (arg)  (send (cdr arg) visa) )alla-kort))
                   
                   
               (define/public ta-kort!
                 (lambda (tag . antal)
                   
                   (cond
                     ((null? antal) (set! antal-kort (- antal-kort 1)) (if (assq tag alla-kort) (send (cdr (assq tag alla-kort)) ta-kort!)))
                     ((= 0 (car antal)) '())
                     (else (cons (ta-kort! tag) (ta-kort! tag (- (car antal) 1)))))))    
                   
                 
                 
               (define/public get-antal-kort
                 (lambda arg
                   (cond
                     ((null? arg) antal-kort)
                     ( (assq (car arg) alla-kort) (send (cdr (assq (car arg) alla-kort)) get-antal-kort))
                     )))
                   
                
                   
               (define/public (uppdatera-dig!)
                 (define tmp-brush (send dc get-brush))
                 (send dc set-brush färg 'solid)
                 (send dc draw-ellipse (- x-led 8) (- y-led 8) 16 16)
                 
                 ;;(send dc draw-ellipse  x-led   y-led  1 1)
                 (send dc set-brush tmp-brush)
                 ;;(printf "~a ~a ~n" x-led y-led)
                 )    
                   
               (define (set-ny-p poäng)
                 (cond
                   ((> poäng 100) (set-ny-p (- poäng 100)))
                   ((and(> poäng 0)(<= poäng 20)) (set! x-led (+ x-led 31.5)))
                   ((and(> poäng 20)(<= poäng 50)) (set! y-led (+ y-led 32)))
                   ((and(> poäng 50)(<= poäng 70)) (set! x-led (- x-led 31.5)))
                   ((and(> poäng 70)(<= poäng 100)) (set! y-led (- y-led 32)))
                   (else (printf "nu vet jag inte vad jag ska göra!!!"))
                   )
                 
                 )    
               (define/public (poäng) (display antalpoäng))
               
               
                   (define/public (köp-väg! väg) 
                     (if(not(send väg köpt?))
                        (begin
                          (set! väglista (cons väg väglista))
                          (send väg set-köpt! tågbild this))))
                   
               
                   
                   
                   
                   (uppdatera)
                   
                   )
  
  )