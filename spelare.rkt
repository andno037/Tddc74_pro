(define spelare% (class object%
               (init-field färg namn dc x-led y-led tågbild)
               
               (define väglista '())
               (define antalpoäng 0)
                   
               (super-new)
               
               (define/public (get-namn) namn)
               (define/public (get-köpt väg) (send väg köpt? this))
               (define/public (köpta) väglista)
               (define/public (add-poäng! värde) (add-poäng-iter värde))
                (define (add-poäng-iter värde)
                  (cond
                    ((= 0 värde) void)
                    (else (set! antalpoäng (+ 1 antalpoäng)) (set-ny-p antalpoäng) (måla-dig!)(add-poäng-iter (- värde 1))  )))
                   
               (define (måla-dig!)
                 (send dc draw-ellipse (- x-led 4) (- y-led 4) 8 8)
                 (printf "~a ~n" antalpoäng)
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
                   
               
                   
                   
                   
                   ))