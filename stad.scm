(define stad% (class object% 
                (init namn dc x-led y-led bild1 bild2 scale)                ; initialization argument
                
                (define my-namn namn)
                (define my-dc dc)
                (define my-x-led x-led)
                (define my-y-led y-led) 
                (define my-bild1 bild1)
                (define my-bild2 bild2) 
                (define my-scale scale)
                (define *lista-vägar* '())
                (define vald #f)
                ; field
                
                (super-new)                ; superclass initialization
                
                (define/public (get-namn)
                  my-namn)
                
                (define/public (add-väg! namn väg)
                  (set! *lista-vägar* (cons (cons namn väg) *lista-vägar*)))
                
                (define/public (get-väg namn)
                  (assq namn *lista-vägar*))
                
                (define/public (vägar)
                  *lista-vägar*)
                
                (define/public (träffad m-x m-y)
                  (if (träffad-in? m-x m-y) 
                      (set-vald! #t)
                      (set-vald! #f)
                      )
                  'ok
                  )
                
                (define (träffad-in? m-x m-y)
                  (and
                   (and(<= 0 (- m-x my-x-led )) (> 25 (- m-x my-x-led )))
                   (and(<= 0 (- m-y my-y-led )) (> 25 (- m-y my-y-led ))))
                  
                  )
                (define/public (set-vald! in)
                  (set! vald in)
                  (if vald
                      (måla-dig! my-bild1)
                      (måla-dig! my-bild2)
                      ))
                (define (måla-dig! bild-tmp)
                  (rita_med_scale bild-tmp my-scale my-scale x-led y-led my-dc))
                
                (define (rita_med_scale image scale-x scale-y x y dc)
                  (send dc scale scale-x scale-y)
                  (send dc draw-bitmap image (* x (/ 1 scale-x)) (* (/ 1 scale-y) y ))
                  (send dc scale (/ 1 scale-x) (/ 1 scale-y))
                  )
                
                ))