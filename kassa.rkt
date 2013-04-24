(define kassa% (class object%
  (define red 0)
  (define green 0)
  (define rainbow 0)
  (define blue 0)
  (define purple 0)
  (define black 0)
  (define white 0)
  (define brown 0)
  (define yellow 0)
  (define väglista #f)
  (define spelare #f)
  (define tmp-färg #f)               
  (super-new)
                 
  ;;Väg ska vara i listform med antingen en eller två vägar!
  
  (define/public (start tväg tspelare) (reset) (set! väglista tväg ) (set! spelare tspelare))
  
  (define/public (betala färg)
    (set! tmp-färg färg)
    (cond
      ((eq? färg 'rainbow) (set! rainbow (+ rainbow 1)))
      ((eq? färg 'blue) (set! blue (+ blue 1)))
      ((eq? färg 'purple) (set! purple (+ purple 1)))
      ((eq? färg 'black) (set! black (+ black 1)))
      ((eq? färg 'white) (set! white (+ white 1)))
      ((eq? färg 'brown) (set! brown (+ brown 1)))
      ((eq? färg 'yellow) (set! yellow (+ yellow 1))) 
      ((eq? färg 'red) (set! red (+ red 1)))
      ((eq? färg 'green) (set! green (+ green 1))))
      (for-each köp väglista))
                 
  (define/public (reset)
    (begin
      (set! red 0)
      (set! green 0)
      (set! rainbow 0)
      (set! blue 0)
      (set! purple 0)
      (set! black 0)
      (set! white 0)
      (set! brown 0)
      (set! yellow 0)
      (set! spelare #f)
      (set! väg #f)))
  
  (define (köp väg )
    (if (tillräckligt? väg)
        (begin
        (send spelare köp-väg! väg))))
                 ;;Lägg in discard
  
  (define (tillräckligt? väg)
    (if (eq? (send väg get-färg) 'grey)
    (=(+ (get-värde-av-färg tmp-färg) rainbow) (send väg kostnad))
    (=(+(get-värde-av-färg (send väg get-färg)) rainbow) (send väg kostnad))))
  
  (define (get-värde-av-färg tag)
    (cond
      ((eq? tag 'green) green)
      ((eq? tag 'red) red)
      ((eq? tag 'rainbow)rainbow )
      ((eq? tag 'blue)blue )
      ((eq? tag 'purple)purple )
      ((eq? tag 'black)black )
      ((eq? tag 'white)white )
      ((eq? tag 'brown)brown )
      ((eq? tag 'yellow)yellow)))
  
  ))