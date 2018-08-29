(projectile-rails-global-mode)

(defun Rmodel ()
  "Find a model"
  (interactive)
  (projectile-rails-find-model))

(defun Cmodel ()
  "go to a model connected with the current resource"
  (interactive)
  (projectile-rails-find-current-model))

(defun Rview ()
  "find a view"
  (interactive)
  (projectile-rails-find-view))

(defun Cview ()
  "go to a view connected with the current resource"
  (interactive)
  (projectile-rails-find-current-view))

(defun Rcontroller ()
  "find a controller"
  (interactive)
  (projectile-rails-find-controller))

(defun Ccontroller ()
  "go to a controller connected with the current resource"
  (interactive)
  (projectile-rails-find-current-controller))

(defun Rserializer ()
  "find a serializer"
  (interactive)
  (projectile-rails-find-serializer))

(defun Rhelper ()
  "find a helper"
  (interactive)
  (projectile-rails-find-helper))

(defun Chelper ()
  "go to a helper connected with the current resource"
  (interactive)
  (projectile-rails-find-current-helper))

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

(defun Cfixture ()
  "go to a fixture connected with the current resource"
  (interactive)
  (projectile-rails-find-current-fixture))

(defun Rspec ()
  "find a spec"
  (interactive)
  (projectile-rails-find-spec))

(defun Cspec ()
  "go to a spec connected with the current resource"
  (interactive)
  (projectile-rails-find-current-spec))

(defun Rtest ()
  "find a test"
  (interactive)
  (projectile-rails-find-test))

(defun Ctest ()
  "go to a test connected with the current resource"
  (interactive)
  (projectile-rails-find-current-test))
;;Eintegrationtest
;;Eunittest
;;Efunctionaltest

(defun Rmigration ()
  "find a migration"
  (interactive)
  (projectile-rails-find-migration))

(defun Cmigration ()
  "go to a migration connected with the current resource"
  (interactive)
  (projectile-rails-find-current-migration))

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

;;Echannel

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
