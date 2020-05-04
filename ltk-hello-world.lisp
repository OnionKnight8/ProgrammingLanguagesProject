(in-package :ltk)

(defun hello-1()
  (with-ltk ()
    (let ((b (make-instance 'button 
                            :master nil
                            :text "Press Me"
                            :command (lambda ()
                                       (format t "Hello World!~&")))))
      (pack b))))

(defun hello-2()
  (with-ltk ()
    (let* ((f (make-instance 'frame))
           (b1 (make-instance 'button
                              :master f
                              :text "Button 1"
                              :command (lambda () (format t "Button1~&"))))
           (b2 (make-instance 'button
                              :master f
                              :text "Button 2"
                              :command (lambda () (format t "Button2~&")))))
      (pack f)
      (pack b1 :side :left)
      (pack b2 :side :left)
      (configure f :borderwidth 3)
      (configure f :relief :sunken)
      ))) 
