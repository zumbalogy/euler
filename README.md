the syntax for renaming all folders in OSX
  for D in `find . -type 'd' -name '*p[0-9]*'`;  { mv "$D" "${D/substring/substitution}"; }

some clojure problems done in light-table, so putting them in a repl or a lighttable live repl, or using lein exec, might be nessesary to see proper return value somewhere
