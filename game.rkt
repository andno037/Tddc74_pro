(define game% (class object%
  
  (init-field dc)

  (define vägtext-x 100)
  (define vägtext-y 100)
  
  (super-new)  
  
  (define/public (rita-currentväg)
    (send dc set-text-foreground "lime")
    (if (eq? *current-väg* #f)
    (send dc draw-text currentvägnamn vägtext-x vägtext-y)
    (send dc draw-text "Ingen väg vald" vägtext-x vägtext-y)))))