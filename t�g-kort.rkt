(define tåg-kort% (class kort%
               (init-field färg)   
               
                (super-new)
               (define/public (get-färg)
                 färg
                 )
               ))