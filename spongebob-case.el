;;; spongebob-case.el --- TaLk LiKe ThIs             -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Case Duckworth

;; Author: Case Duckworth <acdw@acdw.net>
;; Keywords: convenience, games

;;; License:

;; Everyone is permitted to do whatever with this software, without limitation.
;; This software comes without any warranty whatsoever, but with two pieces of
;; advice:

;; - Be kind to yourself.

;; - Make good choices.

;;; Commentary:

;; I found `studlify' and its associated functions to be too complicated, and
;; yearned for a way to convey sarcasm via text in a more regular fashion.  A
;; popular internet meme featuring Spongebob Squarepants provided the answer:

;; I cAn JuSt TyPe EvErYtHiNg LiKe ThIs.

;; `spongebob-case' contains functions to make spongebob-case-ifying text
;; easier.

;;; Code:

;;;###autoload
(defun spongebob-case-region (beg end)
  "Make region, defined by BEG and END, lOoK lIkE tHiS."
  (interactive "*r")
  (save-excursion
    (let (case)
      (goto-char beg)
      (while (< (point) end)
        (if (looking-at "[[:alpha:]]")
            (if (setq case (not case))
                (upcase-region (point) (progn (forward-char 1) (point)))
              (downcase-region (point) (progn (forward-char 1) (point))))
          (forward-char 1))))))

;;;###autoload
(defun spongebob-case-word (n)
  "Spongebob-case N words forward, beginning at point, moving over."
  (interactive "*p")
  (spongebob-case-region (point) (progn (forward-word n) (point))))

;;;###autoload
(defun spongebob-case-dwim (arg)
  "Spongebob-case words in the region if active, else word at point.
If ARG exists, it's passed to `spongebob-case-word'."
  (interactive "*p")
  (if (use-region-p)
      (spongebob-case-region (region-beginning) (region-end))
    (spongebob-case-word arg)))

(provide 'spongebob-case)
;;; spongebob-case.el ends here
