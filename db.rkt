#lang racket
(require db)

(define (get-env-val env)
  (bytes->string/utf-8 (environment-variables-ref (current-environment-variables) env)))

(define pgc
  (postgresql-connect #:user (get-env-val #"tiierUser")
                        #:database (get-env-val #"tiierDB")
                        #:password (get-env-val #"tiierPass")))

(query pgc "SELECT * FROM abc LIMIT 100")