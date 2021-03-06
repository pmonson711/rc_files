;;; helm-spotify-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (helm-spotify) "helm-spotify" "helm-spotify.el"
;;;;;;  (21541 32689 0 0))
;;; Generated autoloads from helm-spotify.el

(defvar helm-source-spotify-track-search '((name . "Spotify") (volatile) (delayed) (multiline) (requires-pattern . 2) (candidates-process . helm-spotify-search) (action-transformer . helm-spotify-actions-for-track)))

(autoload 'helm-spotify "helm-spotify" "\
Bring up a Spotify search interface in helm.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("helm-spotify-pkg.el") (21541 32689 661720
;;;;;;  0))

;;;***

(provide 'helm-spotify-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-spotify-autoloads.el ends here
