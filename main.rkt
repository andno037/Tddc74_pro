(load "fönster.scm")

(define uppdateringslista '())

(define (uppdatera)
  (send (send *my-canvas* get-dc) draw-bitmap *image* (/(- (send *my-window* get-width) (send *image* get-width))2) 0)
  (for-each (lambda (obj) (send obj uppdatera-dig!)) uppdateringslista))





(define a (new spelare% (färg "blue") (namn "kal") (dc (send *my-canvas* get-dc ) ) (x-led 290) (y-led 16) (tågbild #f)))


;;kör uppdatera




