;;; flycheck-joker.el --- Add Clojure syntax checker (via Joker) to flycheck

;; Copyright (C) 2017 Roman Bataev <roman.bataev@gmail.com>
;;
;; Author: Roman Bataev <roman.bataev@gmail.com>
;; Created: 12 February 2017
;; Version: 0.1
;; Package-Requires: ((flycheck "0.18"))

;;; Commentary:

;; This package adds Clojure syntax checker (via Joker) to flycheck.  To use it, add
;; to your init.el:

;; (require 'flycheck-joker)

;; Make sure Joker executable is on your path.  The latest version
;; of Joker can be downloaded from https://github.com/candid82/joker/releases

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'flycheck)

(flycheck-define-checker clojure-joker
  "A Clojure syntax checker using Joker.

  See URL `https://github.com/candid82/joker'."
  :command ("joker" "--lint" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojure-mode clojurec-mode))

(flycheck-define-checker clojurescript-joker
  "A ClojureScript syntax checker using Joker.

  See URL `https://github.com/candid82/joker'."
  :command ("joker" "--lintcljs" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojurescript-mode))

(defun flycheck-joker-setup ()
  "Setup Flycheck for Joker."
  (add-to-list 'flycheck-checkers 'clojure-joker)
  (add-to-list 'flycheck-checkers 'clojurescript-joker))

(provide 'flycheck-joker)
;;; flycheck-joker.el ends here
