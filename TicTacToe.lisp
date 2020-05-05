; Author: Patrick Dooley
; Date: 4/29/20
; Description: A simple game of TicTacToe using common lisp and LTK.

; Load ltk package
(load "ltk/ltk")
(in-package :ltk)

; Variables
(defvar currentPlayer nil)
(defvar validMove nil)
(defvar horiWin nil)
(defvar vertiWin nil)
(defvar diagWin nil)
(defvar winningPlayer nil)
(defvar winText nil)

; Set up variables at runtime
(defun setVars()
  (setq currentPlayer 1)
  (setq validMove 0)
  (setq wintext 0)
  (setq winningPlayer 0)
  (setf horiWin(list 3 3 3 3 3 3 3 3 3))
  (setf vertiWin(list 3 3 3 3 3 3 3 3 3))
  (setf diagWin(list 3 3 3 3 3)))

; Check move validity
(defun checkMove(winPositions)
  (if (= (nth (first winPositions) horiWin) 3)
       ;(setf (nth (first winPositions) horiWin) currentPlayer)
       (progn (setq validMove 0) (takeScore winPositions))
       ;Else:
       (setq validMove 1)))

; Manages turn
(defun takeTurn(button winPositions)
  (checkMove winPositions)
  (if (= validMove 0)
      (updateText button)
      ;Else:
      (format t "Invalid Move!~&")))

; Updates text on buttons if turn was valid
(defun updateText(button)
  (if(= currentPlayer 1)
    (setf (text button) "X")
    ;Else:
    (setf (text button) "O"))
  (if(= currentPlayer 1)
    (setq currentPlayer 2)
    ;Else:
    (setq currentPlayer 1)))

; Writes scores to win tracker
(defun takeScore(winPositions)
  (if(= (list-length winPositions) 2)
     (progn 
       (setf (nth (first winPositions) horiWin) currentPlayer)
       (setf (nth (second winPositions) vertiWin) currentPlayer)
       (winCheck))
     ;Else:
     (progn 
       (setf (nth (first winPositions) horiWin) currentPlayer)
       (setf (nth (second winPositions) vertiWin) currentPlayer)
       (setf (nth (third winPositions) diagWin) currentPlayer)
       (winCheck))))

; Checks win lists for victory condition
(defun winCheck()
  ; Win Condition 1
  (if (= (nth 0 horiWin) (nth 1 horiWin) (nth 2 horiWin))
      (if (/= 3 (nth 0 horiWin))
        (setq winningPlayer (nth 0 horiWin))))
  ; Win Condition 2
  (if (= (nth 3 horiWin) (nth 4 horiWin) (nth 5 horiWin))
      (if (/= 3 (nth 3 horiWin))
        (setq winningPlayer (nth 3 horiWin))))
  ; Win Condition 3
  (if (= (nth 6 horiWin) (nth 7 horiWin) (nth 8 horiWin))
      (if (/= 3 (nth 6 horiWin))
        (setq winningPlayer (nth 6 horiWin))))
  ; Win Condition 4
  (if (= (nth 0 vertiWin) (nth 1 vertiWin) (nth 2 vertiWin))
      (if (/= 3 (nth 0 vertiWin))
        (setq winningPlayer (nth 0 vertiWin))))
  ; Win Condition 5
  (if (= (nth 3 vertiWin) (nth 4 vertiWin) (nth 5 vertiWin))
      (if (/= 3 (nth 3 vertiWin))
        (setq winningPlayer (nth 3 vertiWin))))
  ; Win Condition 6
  (if (= (nth 6 vertiWin) (nth 7 vertiWin) (nth 8 vertiWin))
      (if (/= 3 (nth 6 vertiWin))
        (setq winningPlayer (nth 6 vertiWin))))
    ; Win Condition 7
  (if (= (nth 0 diagWin) (nth 1 diagWin) (nth 4 diagWin))
      (if (/= 3 (nth 0 diagWin))
        (setq winningPlayer (nth 1 diagWin))))
  ; Win Condition 8
  (if (= (nth 0 diagWin) (nth 3 diagWin) (nth 2 diagWin))
      (if (/= 3 (nth 0 diagWin))
        (setq winningPlayer (nth 3 diagWin))))
  ; Draw Condition
  (if (/= 3 (nth 0 horiWin))
      (if(/= 3 (nth 1 horiWin))
          (if(/= 3 (nth 2 horiWin))
              (if(/= 3 (nth 3 horiWin))
                  (if(/= 3 (nth 4 horiWin))
                      (if(/= 3 (nth 5 horiWin))
                          (if(/= 3 (nth 6 horiWin))
                              (if(/= 3 (nth 7 horiWin))
                                  (if(/= 3 (nth 8 horiWin))
                                      (setq winningPlayer 3))))))))))
  ; Announce Winner
  (if (/= winningPlayer 0)
      (endGame)))

; Game over screen
(defun endGame()
  (if(= winningPlayer 1)
      (setq winText "Player 1 Wins!"))
  (if(= winningPlayer 2)
      (setq winText "Player 2 Wins!"))
  (if(= winningPlayer 3)
      (setq winText "Draw!"))
  (with-ltk ()
    (wm-title *tk* "Game Over")
    (let* ((menu (make-instance 'frame))
           (exitButton (make-instance 'button
                              :master menu
                              :text "Exit"
                              :command (lambda () (quit))))
           (winLabel (make-instance 'label
                              :master menu
                              :text winText)))
      (pack menu)
      (pack winLabel)
      (pack exitButton)
      (force-focus menu))))

; Main game board
(defun main()
  (setVars)
  (with-ltk()
    (wm-title *tk* "TicTacToe")
    (let* ((board (make-instance 'frame))
           (north (make-instance 'button
                              :master board
                              ;:text northText
                              :text " "))
                              ;:command (lambda () (format t "North~&"))))
           (northEast (make-instance 'button
                              :master board
                              ;:text northEastText
                              :text " "))
                              ;:command (lambda () (format t "North East~&"))))
           (east (make-instance 'button
                              :master board
                              ;:text eastText
                              :text " "))
                              ;:command (lambda () (format t "East~&"))))
           (southEast (make-instance 'button
                              :master board
                              ;:text southEastText
                              :text " "))
                              ;:command (lambda () (format t "South East~&"))))
           (south (make-instance 'button
                              :master board
                              ;:text southText
                              :text " "))
                              ;:command (lambda () (format t "South~&"))))
           (southWest (make-instance 'button
                              :master board
                              ;:text southWestText
                              :text " "))
                              ;:command (lambda () (format t "South West~&"))))
           (west (make-instance 'button
                              :master board
                              ;:text westText
                              :text " "))
                              ;:command (lambda () (format t "West~&"))))
           (northWest (make-instance 'button
                              :master board
                              ;:text northWestText
                              :text " "))
                              ;:command (lambda () (format t "North West~&"))))
           (center (make-instance 'button
                              :master board
                              ;:text centerText
                              :text " ")))
                              ;:command (lambda () (format t "Center~&")))))
      
      ; Set commands now that buttons are declared
      (setf (command north) (lambda () (takeTurn north (list 1 3))))
      (setf (command northEast) (lambda () (takeTurn northEast (list 2 6 2))))
      (setf (command east) (lambda () (takeTurn east (list 5 6))))
      (setf (command southEast) (lambda () (takeTurn southEast (list 8 8 4))))
      (setf (command south) (lambda () (takeTurn south (list 7 5))))
      (setf (command southWest) (lambda () (takeTurn southWest (list 6 2 3))))
      (setf (command west) (lambda () (takeTurn west (list 3 1))))
      (setf (command northWest) (lambda () (takeTurn northWest (list 0 0 1))))
      (setf (command center) (lambda () (takeTurn center (list 4 4 0))))
      
      ; Grid game board
      (grid board 0 0
            :sticky :ne
            :padx 10
            :pady 10
            :columnspan 3
            :rowspan 3)
      (grid north 0 1 
            :sticky :n
            :padx 10
            :pady 10
            )
      (grid northEast 0 2 
            :sticky :ne
            :padx 10
            :pady 10)
      (grid east 1 2 
            :sticky :e
            :padx 10
            :pady 10)
      (grid southEast 2 2 
            :sticky :se
            :padx 10
            :pady 10)
      (grid south 2 1 
            :sticky :s
            :padx 10
            :pady 10)
      (grid southWest 2 0 
            :sticky :sw
            :padx 10
            :pady 10)
      (grid west 1 0 
            :sticky :w
            :padx 10
            :pady 10)
      (grid northWest 0 0 
            :sticky :nw
            :padx 10
            :pady 10)
      (grid center 1 1
            :padx 10
            :pady 10)
      (force-focus board))))

(main)
