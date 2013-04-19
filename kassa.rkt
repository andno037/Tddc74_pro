(define kassa% (class object%)
  (define red 0)
  (define green 0)
  (define väg #f)
  (define spelare #f)
  (super-new)
  
  (define/public (start tväg tspelare) (set! väg tväg ) (set! spelare tspelare))
  
  (define/public (betala färg)
     (cond
      ((eq? färg 'red) (set! red (+ red 1)))
      ((eq? färg 'green) (set! green (+ green 1))))
      (if (tillräckligt?)
          (send spelare köp-väg! väg)
          void))
  
  (define (tillräckligt?)
    (if (eq? (send väg get-färg) 'grey)
        void
    (=(get-värde-av-färg (send väg get-färg)) (send väg kostnad))))
  
  (define (get-värde-av-färg tag)
    (cond
      ((eq? tag 'green) green)
      ((eq? tag 'red) red)
      
      
      )
    
    )
  
  )