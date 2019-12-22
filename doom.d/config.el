;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; (global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; (setq-default show-trailing-whitespace t)
;; (setq-default indicate-empty-lines t)
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'before-save-hook 'doom/delete-trailing-newlines)

(map! :leader
      :prefix "c"
      :desc "Comment" "k" #'comment-dwim)
