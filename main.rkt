(load "fönster.scm")

(define uppdateringslista '())

(define (uppdatera)
  (send (send *my-canvas* get-dc) draw-bitmap *image* (/(- (send *my-window* get-width) (send *image* get-width))2) 0)
  (for-each (lambda (obj) (send obj uppdatera-dig!)) uppdateringslista))