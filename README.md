# A Hack to Make 'make' Work Better!

 This is a simple implementation of _build
 logging_ or _accumulative build methodology_
 (I'm not quite sure which describes it best).
 I have hear some confusion with ccache, but
 ccache is implemented on the lower level and
 is [language specific](http://ccache.samba.org/).
 The idea is to check upon whether contents
 of a file and the compilation flags has
 changed from one run to another.

 It appear to be not too difficult to do in
 a simple makefile, rather then trying to
 reinvent the wheel in a different language!

## _Notes:_

 So far it's a very immature project, but
 once I'm done with the testing I hope it
 will be useful to many users!

 I need to consider renaming it, perhaps,
 because there exists a command in Solaris
 with the same name.<br>However this is not
 a command, but only a makefile template. Of
 course it may be turned into one somewhat.

# _Motivation_

 I needed a way of storing all build output
 for one of my hardware design (read: Verilog)
 projects and one of the problem that I faced
 with<br>make was forcing remake when flags
 for the preprocessor have changed and yet
 I wanted to store outputs for each of run.

 This however doesn't mean that the hashmake
 template is Verilog-specific. One may wish
 to use it for build logging purposes or any
 other<br>imaginable paradigm. Of course, in
 many cases, some consideration needs to be
 taken whether a revision control system may
 be more appropriate.

# _Future Work_

 - **Testing**
   * testing with different projects
 - **Reusability**
   * generalisation of code to make it
     usable as a part of existing code
     (plugged into real-world makefiles)
   * attempt to fit around autotools<br>
   _A simple solution would be to just add
   'move-build' target if you just need to
   store the builds, but that doesn't help
   to<br>solve checks on preprocessor flags,
   which needs to be done much earlier!_
 - **Scripts**
   * find builds made with specific flags
   * run or view specific builds
   * integrate with revision control tools
     (i.e. grep for git commit id) <br>
   _There is no use for taking care of what
   the commit/revision id is when building
   the code, since that doesn't explicitly
   mean<br>that the particular file was
   changed. However it would be usefull to
   be able to find a build made in between
   specific commits<br>to the repository or,
   in other words, builds which had been made
   on a given code revision._

