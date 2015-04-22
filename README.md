SLHandler
=========

A simple sublime launcher (any version) that has a `subl://` url scheme

URL Scheme
=========

`SLHandler` will launch and forward the arguments to the `subl` command line tool
    
    subl://open?url=<file path>&line=<line number>&column=<col number>

which translates to

    subl /etc/hosts:0:0

Arguments are optional, only the `url` param is required.

Usage
=========

-    Build and run app, it at must once to bind the url scheme.
-    When the preferences window launches, choose your correct sublime version and save
-    App will exit when you save
-    open up terminal and type this `open 'subl://open?url=/etc/hosts&line=0&column=0'`

Attributions
=========

The Sublime Handler app icon was done by [Kreg Wallace](https://profiles.wordpress.org/kreg/)
