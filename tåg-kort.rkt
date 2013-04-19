(define tåg-kort% (class kort%
               (init-field färg)   
               
                (super-new)
               (define/public (get-färg)
                 färg
                 )
                    
               (define/public (visa)
                 (send this get-bild)
                 )     
                    
               ))