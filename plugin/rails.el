(projectile-rails-global-mode)

(defun Em ()
  "Find a model"
  (interactive)
  (projectile-rails-find-model))

(defun Cm ()
  "go to a model connected with the current resource"
  (interactive)
  (projectile-rails-find-current-model))

(defun Ev ()
  "find a view"
  (interactive)
  (projectile-rails-find-view))

(defun Cv ()
  "go to a view connected with the current resource"
  (interactive)
  (projectile-rails-find-current-view))

(defun Ec ()
  "find a controller"
  (interactive)
  (projectile-rails-find-controller))

(defun Cc ()
  "go to a controller connected with the current resource"
  (interactive)
  (projectile-rails-find-current-controller))

(defun Eserializer ()
  "find a serializer"
  (interactive)
  (projectile-rails-find-serializer))

(defun Ehelper ()
  "find a helper"
  (interactive)
  (projectile-rails-find-helper))

(defun Chelper ()
  "go to a helper connected with the current resource"
  (interactive)
  (projectile-rails-find-current-helper))

(defun Elib ()
  "find a lib"
  (interactive)
  (projectile-rails-find-lib))

(defun Efeature ()
  "find a feature"
  (interactive)
  (projectile-rails-find-feature))

(defun Efixture ()
  "find a fixture"
  (interactive)
  (projectile-rails-find-fixture))

(defun Cfixture ()
  "go to a fixture connected with the current resource"
  (interactive)
  (projectile-rails-find-current-fixture))

(defun Espec ()
  "find a spec"
  (interactive)
  (projectile-rails-find-spec))

(defun Cspec ()
  "go to a spec connected with the current resource"
  (interactive)
  (projectile-rails-find-current-spec))

(defun Etest ()
  "find a test"
  (interactive)
  (projectile-rails-find-test))

(defun Ctest ()
  "go to a test connected with the current resource"
  (interactive)
  (projectile-rails-find-current-test))
;;Eunittest
;;Efunctionaltest

(defun Emigration ()
  "find a migration"
  (interactive)
  (projectile-rails-find-migration))

(defun Cmigration ()
  "go to a migration connected with the current resource"
  (interactive)
  (projectile-rails-find-current-migration))

(defun Ejavascript ()
  "find a javascript"
  (interactive)
  (projectile-rails-find-javascript))

(defun Estylesheet ()
  "find a stylesheet"
  (interactive)
  (projectile-rails-find-stylesheet))

(defun Elog ()
  "find a log"
  (interactive)
  (projectile-rails-find-log))

(defun Einitializer ()
  "find a initializer"
  (interactive)
  (projectile-rails-find-initializer))

(defun Eenvironment ()
  "find a environment"
  (interactive)
  (projectile-rails-find-environment))

(defun Elocale ()
  "find a locale"
  (interactive)
  (projectile-rails-find-locale))

(defun Emailer ()
  "find a mailer"
  (interactive)
  (projectile-rails-find-mailer))

(defun Evalidator ()
  "find a validator"
  (interactive)
  (projectile-rails-find-validator))

(defun Elayout ()
  "find a layout"
  (interactive)
  (projectile-rails-find-layout))

(defun Ejob ()
  "find a job"
  (interactive)
  (projectile-rails-find-job))

(defun Etask ()
  "find a rake task"
  (interactive)
  (projectile-rails-find-rake-task))

(defun Eschema ()
  "go to schema"
  (interactive)
  (projectile-rails-goto-schema))

(defun Egemfile ()
  "go to gemfile"
  (interactive)
  (projectile-rails-goto-gemfile))

(defun Eroutes ()
  "go to routes"
  (interactive)
  (projectile-rails-goto-routes))

(defun Eseeds ()
  "go to seeds"
  (interactive)
  (projectile-rails-goto-seeds))

(defun Efile_at_point ()
  "go to a file at point"
  (interactive)
  (projectile-rails-goto-file-at-point))

(defun Espec_helper ()
  "go to spec helper"
  (interactive)
  (projectile-rails-goto-spec-helper))

;;projectile-rails-extract-region	C-c r x	Extract the selected region to a partial.

(defun Rr ()
  "select a rake task"
  (interactive)
  (projectile-rails-rake))

(defun Rs ()
  "run rails server"
  (interactive)
  (projectile-rails-server))

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

(defun projectile-rails-generate-cmd (command)
  (projectile-rails-with-root
   (let ((command-prefix (projectile-rails-with-preloader
                          :spring (concat projectile-rails-spring-command " rails generate " command)
                          :zeus (concat projectile-rails-zeus-command " generate " command)
                          :vanilla (concat projectile-rails-vanilla-command " generate " command))))
     (compile
      (projectile-rails--generate-with-completion command-prefix)
      'projectile-rails-generate-mode))))

(defun Rgc ()
  "run rails generate controller command"
  (interactive)
  (projectile-rails-generate-cmd "controller "))

(defun Rgm ()
  "run rails generate model command"
  (interactive)
  (projectile-rails-generate-cmd "model "))

(defun Rgd ()
  "run rails generate migration command"
  (interactive)
  (projectile-rails-generate-cmd "migration "))

(defun Rgt ()
  "run rails generate integration_test command"
  (interactive)
  (projectile-rails-generate-cmd "integration_test "))

(defun projectile-rails-cmd (command)
    (projectile-rails-with-root
     (compile (projectile-rails-with-preloader
	       :spring (concat projectile-rails-spring-command " rails " command)
	       :zeus (concat projectile-rails-zeus-command " " command)
	       :vanilla (concat projectile-rails-vanilla-command " " command))
	      'projectile-rails-mode)))

(provide 'language)
