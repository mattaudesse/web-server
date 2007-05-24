(module add (lib "lang.ss" "web-server" "prototype-web-server")
  (require (lib "url.ss" "net")
           (lib "servlet-helpers.ss" "web-server" "private"))
  (provide start)
  
  ;; get-number-from-user: string -> number
  ;; ask the user for a number
  (define (get-number msg)
    (printf "gn ~a~n" msg)
    (let* ([req
            (send/suspend/url
             (lambda (k-url)
               (printf "ssu~n")
               `(hmtl (head (title ,(format "Get ~a number" msg)))
                      (body
                       (form ([action ,(url->string k-url)]
                              [method "post"]
                              [enctype "application/x-www-form-urlencoded"])
                             ,(format "Enter the ~a number to add: " msg)
                             (input ([type "text"] [name "number"] [value ""]))
                             (input ([type "submit"])))))))]
           [num (string->number
                 (extract-binding/single
                  'number
                  (request-bindings req)))])
      (printf "gn ~a ~a~n" msg num)
      num))
  
  (define (start initial-request)
    (printf "after s-s~n")
    `(html (head (title "Final Page"))
           (body
            (h1 "Final Page")
            (p ,(format "The answer is ~a"
                        (+ (get-number "first") (get-number "second"))))))))