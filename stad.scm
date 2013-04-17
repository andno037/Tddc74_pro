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
                (define/public (get-x)
                  my-x-led)
                (define/public (get-y)
                  my-y-led)
                (define/public (get-scale)
                  my-scale)
                
                (define/public (add-väg! namn väg)
                  (set! *lista-vägar* (cons (cons namn väg) *lista-vägar*)))
                
                (define/public (get-väg namn)
                  (assq namn *lista-vägar*))
                
                (define/public (vägar)
                  *lista-vägar*)
                
                (define/public (träffad m-x m-y)
                  (if (träffad-in? m-x m-y) 
                      (begin(set-vald! #t) this)
                      (begin (set-vald! #f) #f)))
                
                (define (träffad-in? m-x m-y)
                  
                  (>= (*(* 175 my-scale )(* 175 my-scale )) (+ (* (- m-x my-x-led ) (- m-x my-x-led )) (* (- m-y my-y-led ) (- m-y my-y-led ))))
                 ;;det tar kanske litte tid med det här är pytagoras för att få avståndet av dit klik till stadens mitt ;) 
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
                  (send dc draw-bitmap image (-(* x (/ 1 scale-x))(* 12 (/ 1 scale-x))) (- (* (/ 1 scale-y) y )(* 12 (/ 1 scale-x))))
                  (send dc scale (/ 1 scale-x) (/ 1 scale-y))
                  )
                
                ))