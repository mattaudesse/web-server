(module dispatch-servlets-test mzscheme
  (require (planet "test.ss" ("schematics" "schemeunit.plt" 2)))
  (provide dispatch-servlets-tests)
  
  (define dispatch-servlets-tests
    (test-suite
     "Servlets")))