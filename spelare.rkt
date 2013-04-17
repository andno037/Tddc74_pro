(define spelare% (class object%
               (init-field färg namn dc x-led y-led tågbild)
               
               (define väglista '())
               (define antalpoäng 0)
                   
               (super-new)
               
               (define/public (get-namn) namn)
               (define/public (get-köpt väg) (send väg köpt? this))
               (define/public (köpta) väglista)
               (define/public (add-poäng! värde) (set! antalpoäng (+ antalpoäng värde)))
                (define (add-poäng-iter värde)
                  void
                  )   
               (define/public (poäng) (display antalpoäng))
               
               (define/public (köp-väg! väg) 
                 (if(not(send väg köpt?))
                    (begin
                      (set! väglista (cons väg väglista))
                      (send väg set-köpt! tågbild this))))
                   
               ))