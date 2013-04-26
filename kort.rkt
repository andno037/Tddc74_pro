(define kort% (class object%
               (init-field bild  ägare)   
               (define min-x-koord #f)
               (define min-y-koord #f)
               (define min-x-skala #f)
               (define min-y-skala #f)
                
                (super-new)
               
               (define/public (måla-dig! x y x-skala y-skala) 
               (rita_med_scale bild x-skala y-skala x y dc)
               (set! uppdateringslista (cons this uppdateringslista)))
                
                (define/public (flytta-dig! x y x-skala y-skala)(
                 (begin
                 (set! min-x-koord x)
                 (set! min-y-koord y)
                 (set! min-x-skala x-skala)
                 (set! min-y-skala y-skala))))
               
                (define/public (get-bild) bild)
              
                (define/public (uppdatera-dig!)
                 (rita_med_scale bild min-x-scale min-y-scale min-x-koord min-y-koord dc))
                
                
                (define (rita_med_scale image scale-x scale-y x y dc)
                  (send dc scale scale-x scale-y)
                  (send dc draw-bitmap image (-(* x (/ 1 scale-x))(* 12 (/ 1 scale-x))) (- (* (/ 1 scale-y) y )(* 12 (/ 1 scale-x))))
                  (send dc scale (/ 1 scale-x) (/ 1 scale-y))
                  )))