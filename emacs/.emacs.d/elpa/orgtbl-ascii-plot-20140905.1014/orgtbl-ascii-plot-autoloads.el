;;; orgtbl-ascii-plot-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (orgtbl-ascii-plot-bindings orgtbl-ascii-plot)
;;;;;;  "orgtbl-ascii-plot" "orgtbl-ascii-plot.el" (21532 19735 0
;;;;;;  0))
;;; Generated autoloads from orgtbl-ascii-plot.el

(autoload 'orgtbl-ascii-plot "orgtbl-ascii-plot" "\
Draws an ascii bars plot in a column, out of values found in another column.
  A numeric prefix may be given to override the default 12 characters wide plot.
    

\(fn &optional ASK)" t nil)

(autoload 'orgtbl-ascii-plot-bindings "orgtbl-ascii-plot" "\


\(fn)" nil nil)

(if (functionp 'org-defkey) (orgtbl-ascii-plot-bindings) (setq org-load-hook (cons 'orgtbl-ascii-plot-bindings (if (boundp 'org-load-hook) org-load-hook))))

;;;***

;;;### (autoloads nil nil ("orgtbl-ascii-plot-pkg.el") (21532 19735
;;;;;;  930178 0))

;;;***

(provide 'orgtbl-ascii-plot-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; orgtbl-ascii-plot-autoloads.el ends here
