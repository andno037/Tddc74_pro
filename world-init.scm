(define *image* (read-bitmap "nordic_map.jpg" ))
(define *image2* (read-bitmap "grön_knapp.png" ))
(define *image3* (read-bitmap "gul_knapp.png" ))
(define lista-städer '())

(define (install dc)


(define (add-stad tag en-stad)
  (set! lista-städer (cons (cons tag en-stad) lista-städer))
  )

(add-stad 'st (new stad% [namn "stockholm"] [dc dc] [x-led 677] [y-led 691] [bild1 *image2*] [bild2 *image3*] [ scale 0.07]))
    (add-stad 'no (new stad% [namn "norrköping"] [dc dc] [x-led 676] [y-led 761] [bild1 *image2*] [bild2 *image3*] [ scale 0.05]))
    (add-stad 'ör (new stad% [namn "örebro"] [dc dc] [x-led 586] [y-led 726] [bild1 *image2*] [bild2 *image3*] [ scale 0.05]))
    (add-stad 'os (new stad% [namn "oslo"] [dc dc] [x-led 495] [y-led 755] [bild1 *image2*] [bild2 *image3*] [ scale 0.07]))
    (add-stad 'gö (new stad% [namn "göteborg"] [dc dc] [x-led 568] [y-led 838] [bild1 *image2*] [bild2 *image3*] [ scale 0.05]))
  
  (display "ok")
  )