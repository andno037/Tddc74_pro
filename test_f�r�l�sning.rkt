


;; Minimal exempelruta
(define *my-window* (new frame% 
  [width 300] [height 200] [label "En ram"]))
(define (render-fn canvas dc)
  (let-values ([(w h) (send canvas get-virtual-size)])
    (send dc draw-rectangle 4 4 (- w 8) (- h 8))))
(define *my-canvas* (new canvas%
  [parent *my-window*] [paint-callback render-fn]))
(send *my-window* show #t)


;; Exempel med roterande fyrkant

;
;(define *my-window* (new frame% 
;  [width 300] [height 200] [label "Roterande fyrkant"]))
;
;(define (rotating-square x y)
;  (let ((angle 0))
;    (define (update)
;      (set! angle (+ angle (/ 1 6.28))))
;    (define (render canvas dc)
;      (begin
;        (send dc translate x y)
;        (send dc rotate angle)
;        (send dc draw-rectangle -30 -30 60 60)
;        (send dc rotate (- angle))
;        (send dc translate (- x) (- y))))
;    (define (dispatch cmd)
;      (cond       
;        ((eq? cmd 'update) update)
;        ((eq? cmd 'render) render)))
;    dispatch))
;
;(define *my-square* (rotating-square 80 70))
;
;(define *my-canvas* (new canvas%
;  [parent *my-window*] [paint-callback
;     (lambda (canvas dc) ((*my-square* 'render) canvas dc))]))
;
;(send *my-window* show #t)
;
;(define *my-timer*
;  (new timer% [notify-callback (lambda () (begin 
;    ((*my-square* 'update)) (send *my-canvas* refresh)))]))
;
;(send *my-timer* start 100)

;; Klass fÃ¶r att ta emot input
(define game-canvas%
  (class canvas%
    (inherit get-width 
             get-height
             refresh)
    (init [keyboard-handler display]
          [mouse-handler display])
    (define on-key-handle keyboard-handler)
    (define on-mouse-handle mouse-handler)
    (define/override (on-char ke)
      (on-key-handle ke))
    (define/override (on-event me)
    (on-mouse-handle me))
  (super-new)))

;; Exempel med input och text
(define *items* '())

(define (magic-box text x y)
  (define (key char)
    (if (char? char)
        (if (eq? #\backspace char)
            (set! text (substring text 0 
                                  (max (- (string-length text) 1) 0)))
            (set! text (string-append text (string char))))))
  (define (render canvas dc)
    (send dc translate x y)
    (send dc rotate -0.785)
    (send dc draw-text text 0 0)
    (send dc rotate 0.785)
    (send dc translate (- x) (- y)))
  (lambda (cmd)
    (cond ((eq? cmd 'render) render)
          ((eq? cmd 'key) key))))
          
(set! *items* (cons (magic-box "Magisk Ruta" 50 50) *items*))

(define *canvas* void)

(define (render-fn canvas dc)
  (define (render-one item)
    ((item 'render) canvas dc))
  (for-each render-one *items*))

(define (key-fn event)
  (define (key-one item)
    ((item 'key) (send event get-key-code)))
  (begin
    (for-each key-one *items*)
    (send *canvas* refresh)))

(define (mouse-fn event)
  (if (send event button-down? 'left)
      (begin
        (set! *items* 
              (cons (magic-box "Klick!" (send event get-x) (send event get-y)) 
                    *items*))
        (send *canvas* refresh))))

(define *window* (new frame% [width 300] 
                      [height 300] 
                      [label "Magisk ruta"]))          
(set! *canvas* (new game-canvas%
                      [parent *window*]
                      [keyboard-handler key-fn]
                      [mouse-handler mouse-fn]
                      [paint-callback render-fn]))
(send *window* show #t)

;; Exempel med knappar


;(define *window* (new frame% [width 300] 
;                      [height 100] 
;                      [label "Knappar och sÃ¥nt"]))
;(begin 
;  (new button% [parent *window*]
;       [label "Hej"]
;       [callback (lambda (button event) (display "Hej"))])
;  (let ((horizontal (new horizontal-pane% 
;                         [alignment '(center center)]
;                         [parent *window*])))
;    (new button% [parent horizontal]
;         [label "I"]
;         [min-width 50]
;         [callback (lambda (button event) (display "I"))])
;    (new button% [parent horizontal]
;         [label "Love"]
;         [min-height 50]
;         [callback (lambda (button event) (display "Love"))])
;    (new button% [parent horizontal]
;         [label "Racket"]
;         [callback (lambda (button event) (display "Racket"))]))
;  (new button% [parent *window*]
;       [label "DÃ¥"]
;       [callback (lambda (button event) (display "DÃ¥"))]))
;(send *window* show #t)