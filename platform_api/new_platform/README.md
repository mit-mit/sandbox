* Platform specific code

These code samples show platform specific code. The goals are:

- Allow code that is for a specific platform to pass analysis (as a developer
  during coding is essentially coding for all platforms), but fail at
  compile-time (and not just at run-time).

- Allow for code that is conditional to a platform check to still be const.

- Enable tree-shaking away code for other platforms than the one being compiled
  for. E.g. this Flutter code should treeshake away `BrowserWidget` when
  compiling for a native platform:

   if (Platform.current.isBrowser) {
    const BrowserWidget()
   } else {
    const HostnameWidget()
   }


