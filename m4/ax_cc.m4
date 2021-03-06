dnl #
dnl # check if were compiling with CLANG, autoconf GCC macro identifies CLANG as GCC
dnl #
AC_DEFUN([AX_CC_IS_CLANG],[
  AC_CACHE_CHECK([if compiler is clang], [ax_cv_clang],[

  AC_COMPILE_IFELSE(
    [AC_LANG_PROGRAM([], [[
    #ifndef __clang__
         not clang
    #endif
    ]])],
    [ax_cv_clang=yes],
    [ax_cv_clang=no])
  ])
])

AC_DEFUN([AX_QUNUSED_ARGUMENTS_FLAG],[
  AC_CACHE_CHECK([for the compiler flag "-Qunused-arguments"], [ax_cv_qunused_arguments_flag],[

    CFLAGS_SAVED=$CFLAGS
    CFLAGS="$CFLAGS -Werror -Qunused-arguments -foobar"
    
    AC_LANG_PUSH(C)
    AC_TRY_COMPILE(
      [],
      [return 0;],
      [ax_cv_qunused_arguments_flag="yes"],
      [ax_cv_qunused_arguments_flag="no"])
    AC_LANG_POP

    CFLAGS="$CFLAGS_SAVED"
  ])
])

AC_DEFUN([AX_WDOCUMENTATION_FLAG],[
  AC_CACHE_CHECK([for the compiler flag "-Wdocumentation"], [ax_cv_wdocumentation_flag],[

    CFLAGS_SAVED=$CFLAGS
    CFLAGS="$CFLAGS -Werror -Wdocumentation"

    AC_LANG_PUSH(C)
    AC_TRY_COMPILE(
      [],
      [return 0;],
      [ax_cv_wdocumentation_flag="yes"],
      [ax_cv_wdocumentation_flag="no"])
    AC_LANG_POP

    CFLAGS="$CFLAGS_SAVED"
  ])
])
