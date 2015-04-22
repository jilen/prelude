;;; prelude-scala-sbt.el --- Scala2 and sbt mode

;;; Commentary:
;;
;;  Source: https://coderwall.com/p/z6riog/my-emacs-scala-development-environment
;;    (accessed 10 April 2015)
;;; Code:
(prelude-require-package 'sbt-mode)
(require 'prelude-scala)
(require 'sbt-mode)
(defun play-start ()
  "Start Play console."
  (interactive)
  (let ((sbt:program-name "play")) ; do a 'let' binding for the variable
    (sbt-start)))
(setq scala-indent:use-javadoc-style t)

(defun test-only ()
  "Run test with current file."
  (interactive)
  (sbt-command (concat "testOnly " (find-spec-name))))

(defun find-spec-name ()
  "Find spec name of current buffer."
  (concat "*." (file-name-sans-extension (file-name-nondirectory (buffer-name)))))

(defun compile-sbt-project ()
  "Compile the sbt project."
  (sbt-command "test:compile")
  )

(add-hook 'scala-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'compile-sbt-project)))

(provide 'prelude-scala-sbt)
;;; prelude-scala-sbt.el ends here
