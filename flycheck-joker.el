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

;; Make sure Joker binary is on your path.
;; Joker installation instructions are here: https://github.com/candid82/joker#installation
;;
;; Please read about Joker's linter mode to understand its capabilities and limitations:
;; https://github.com/candid82/joker#linter-mode
;; Specifically, it's important to configure Joker to reduce false positives:
;; https://github.com/candid82/joker#reducing-false-positives
;;
;; Please see examples of the errors Joker can catch here:
;; https://github.com/candid82/SublimeLinter-contrib-joker#examples

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
  :command ("joker" "--lint" "--")
  :standard-input t
  :error-patterns
  ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojure-mode clojurec-mode))

(flycheck-define-checker clojurescript-joker
  "A ClojureScript syntax checker using Joker.

  See URL `https://github.com/candid82/joker'."
  :command ("joker" "--lintcljs" "--")
  :standard-input t
  :error-patterns
  ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojurescript-mode))

(flycheck-define-checker clojure-joker-edn
  "EDN syntax checker using Joker.
  See URL `https://github.com/candid82/joker'."
  :command ("joker" "--lintedn" "--")
  :standard-input t
  :error-patterns
  ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojure-mode clojurec-mode)
  :predicate (lambda () (string= "edn" (file-name-extension (buffer-file-name)))))

(add-to-list 'flycheck-checkers 'clojure-joker)
(add-to-list 'flycheck-checkers 'clojurescript-joker)
(add-to-list 'flycheck-checkers 'clojure-joker-edn)

(provide 'flycheck-joker)
;;; flycheck-joker.el ends here
