(define *image* (read-bitmap "nordic_map.jpg" ))
(define *image2* (read-bitmap "grön_knapp.png" ))
(define *image3* (read-bitmap "gul_knapp.png" ))
(define lista-städer '())
(define lista-vägar '())
(define väg #f)
(load "stad.scm")
(load "väg.scm")
(load "spelare.rkt")

(define (install dc)


(define (add-stad tag en-stad)
  (set! lista-städer (cons (cons tag en-stad) lista-städer))
  )

;  (add-stad 'st (new stad% [namn "stockholm"] [dc dc] [x-led 677] [y-led 691] [bild1 *image2*] [bild2 *image3*] [ scale 0.07]))
;  (add-stad 'no (new stad% [namn "norrköping"] [dc dc] [x-led 676] [y-led 761] [bild1 *image2*] [bild2 *image3*] [ scale 0.05]))
;  (add-stad 'ör (new stad% [namn "örebro"] [dc dc] [x-led 586] [y-led 726] [bild1 *image2*] [bild2 *image3*] [ scale 0.05]))
;  (add-stad 'os (new stad% [namn "oslo"] [dc dc] [x-led 495] [y-led 755] [bild1 *image2*] [bild2 *image3*] [ scale 0.07]))
;  (add-stad 'gö (new stad% [namn "göteborg"] [dc dc] [x-led 568] [y-led 838] [bild1 *image2*] [bild2 *image3*] [ scale 0.05]))
  
  (my-load "städer2.scm")
  (my-load2 "vägar.scm" )
  (for-each  (lambda (arg) (add-stad (car arg) (new stad% [namn (car arg)] [dc dc] [x-led (cadr arg)] [y-led (caddr arg)] [bild1 *image2*] [bild2 *image3*] [ scale (cdddr arg)])) ) *plungt_lista*)
  (for-each (lambda (arg) (add-väg (new väg% [längd 5] [poäng 5] [dc dc] [stad1 (assq (caaar arg) lista-städer)] [stad2 (assq (cadar arg)lista-städer)]  [färg "black"] [p-lista (cdr arg)]))) lista_att_spara)
  (display "ok")
  )
(define (add-väg tmp-v)
  
  ;;(printf "  ~a     ~a  ~n" (caar(send tmp-v get-länkar))  (caadr(send tmp-v get-länkar)))
  
  
  (set! lista-vägar (cons (cons  (string-append (symbol->string (caar(send tmp-v get-länkar))) "->" (symbol->string (caadr(send tmp-v get-länkar)))) tmp-v) lista-vägar)))
  
  
(define (my-load filename)
      (let ((in-put (open-input-file filename)) )
        (set! *plungt_lista* (read in-put))
        (close-input-port in-put)
        ))
(define (my-load2 filename )
      (let ((in-put (open-input-file filename)) )
        (set! lista_att_spara (read in-put))
        (close-input-port in-put)
        ))