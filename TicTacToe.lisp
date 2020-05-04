(load "ltk/ltk")
(in-package :ltk)

(defun main()
  (with-ltk ()
    (let* ((board (make-instance 'frame))
           (north (make-instance 'button
                              :master board
                              :text "North"
                              :command (lambda () (format t "North~&"))))
           (northEast (make-instance 'button
                              :master board
                              :text "North East"
                              :command (lambda () (format t "North East~&"))))
           (east (make-instance 'button
                              :master board
                              :text "East"
                              :command (lambda () (format t "East~&"))))
           (southEast (make-instance 'button
                              :master board
                              :text "South East"
                              :command (lambda () (format t "South East~&"))))
           (south (make-instance 'button
                              :master board
                              :text "South"
                              :command (lambda () (format t "South~&"))))
           (southWest (make-instance 'button
                              :master board
                              :text "South West"
                              :command (lambda () (format t "South West~&"))))
           (west (make-instance 'button
                              :master board
                              :text "West"
                              :command (lambda () (format t "West~&"))))
           (northWest (make-instance 'button
                              :master board
                              :text "North West"
                              :command (lambda () (format t "North West~&"))))
           (center (make-instance 'button
                              :master board
                              :text "Center"
                              :command (lambda () (format t "Center~&")))))
      (pack board)
      (pack north :anchor :n)
      (pack northEast :anchor :ne)
      (pack east :anchor :e)
      (pack southEast :anchor :se)
      (pack south :anchor :s)
      (pack southWest :anchor :sw)
      (pack west :anchor :w)     
      (pack northWest :anchor :nw)
      (pack center :anchor :center)
      (configure board :borderwidth 3)
      (configure board :relief :sunken))))

(main)
