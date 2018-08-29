(projectile-rails-global-mode)

(defun Rmodel ()
  "Find a model"
  (interactive)
  (projectile-rails-find-model))

(defun Rview ()
  "find a view"
  (interactive)
  (projectile-rails-find-view))

(defun Rcontroller ()
  "find a controller"
  (interactive)
  (projectile-rails-find-controller))

(defun Rhelper ()
  "find a helper"
  (interactive)
  (projectile-rails-find-helper))

(defun Rlib ()
  "find a lib"
  (interactive)
  (projectile-rails-find-lib))

(defun Rfeature ()
  "find a feature"
  (interactive)
  (projectile-rails-find-feature))

(defun Rfixture ()
  "find a fixture"
  (interactive)
  (projectile-rails-find-fixture))

(defun Rspec ()
  "find a spec"
  (interactive)
  (projectile-rails-find-spec))

(defun Rtest ()
  "find a test"
  (interactive)
  (projectile-rails-find-test))

(defun Rmigration ()
  "find a migration"
  (interactive)
  (projectile-rails-find-migration))

(defun Rjavascript ()
  "find a javascript"
  (interactive)
  (projectile-rails-find-javascript))

(defun Rstylesheet ()
  "find a stylesheet"
  (interactive)
  (projectile-rails-find-stylesheet))

(defun Rlog ()
  "find a log"
  (interactive)
  (projectile-rails-find-log))

(defun Rinitializer ()
  "find a initializer"
  (interactive)
  (projectile-rails-find-initializer))

(defun Renvironment ()
  "find a environment"
  (interactive)
  (projectile-rails-find-environment))

(defun Rlocale ()
  "find a locale"
  (interactive)
  (projectile-rails-find-locale))

(defun Rmailer ()
  "find a mailer"
  (interactive)
  (projectile-rails-find-mailer))

(defun Rvalidator ()
  "find a validator"
  (interactive)
  (projectile-rails-find-validator))

(defun Rlayout ()
  "find a layout"
  (interactive)
  (projectile-rails-find-layout))

(defun Rjob ()
  "find a job"
  (interactive)
  (projectile-rails-find-job))

(defun Rtask ()
  "find a rake task"
  (interactive)
  (projectile-rails-find-rake-task))

(defun Rschema ()
  "go to schema"
  (interactive)
  (projectile-rails-goto-schema))

(defun Rgemfile ()
  "go to gemfile"
  (interactive)
  (projectile-rails-goto-gemfile))

(defun Rroutes ()
  "go to routes"
  (interactive)
  (projectile-rails-goto-routes))

(defun Rseeds ()
  "go to seeds"
  (interactive)
  (projectile-rails-goto-seeds))

(defun Rfile_at_point ()
  "go to a file at point"
  (interactive)
  (projectile-rails-goto-file-at-point))

(defun Rspec_helper ()
  "go to spec helper"
  (interactive)
  (projectile-rails-goto-spec-helper))

;;projectile-rails-extract-region	C-c r x	Extract the selected region to a partial.

;;Eintegrationtest
;;Eunittest
;;Efunctionaltest
;;Echannel
;;Eserializer

(defun Rdbconsole ()
  "run rails dbconsole command"
  (interactive)
  (projectile-rails-dbconsole))

(defun Rconsole ()
  "run rails console command"
  (interactive)
  (projectile-rails-console))

(defun Rgenerate ()
  "run rails generate command"
  (interactive)
  (projectile-rails-generate))

(defun Rserver ()
  "run rails server"
  (interactive)
  (projectile-rails-server))

(defun Rrake ()
  "select a rake task"
  (interactive)
  (projectile-rails-rake))
