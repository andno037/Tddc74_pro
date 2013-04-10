(define väg% (class objct%
               (init längd poäng dc)
               (define denna-dc dc)
               (define denna-längd längd)
               (define denna-poäng poäng)
               (define lista_punkter '())
               (define köpt #f)
               (super-new)
               (define/public (set-punkter lista)
                 (set! lista_punkter lista)
                 )
               (define/public (set-köpt! bild spelare)
                 (set! köpt #t)
                 
                 )
               ;;SKYPE?
               
               ))