# TODO

In general, more app preferences...

## Fix the cp method of installing apps

`cp` will often fail to copy over existing apps. Really, it's very likely that we want to first remove the app, then
copy to avoid issues. The downside is that this will remove the app from wherever it lives in launchpad.

## Jetbrains toolbox

1. Accept the agreement.
1. Install selected IDEs. The toolbox seems to be missing functionality to do this from the command line. Investigate
   AppleScript, Automator, etc.

This probably requires a fix for [TBX-653](https://youtrack.jetbrains.com/issue/TBX-653).

## GPG tools

GPG tools on requires some manual setup. Open Mail > Preferences > General, click on "Manage Plug-ins...",
and check the box next to the GPGMailLoader plugin.

Can we automate that away?

## Other stuff

* Fonts.
    * [Noto](https://www.google.com/get/noto/)
    * [ProFont](https://tobiasjung.name/profont/)
    * [STIX](https://www.stixfonts.org/)
    * [Source Code Pro](https://github.com/adobe-fonts/source-code-pro), etc.
    * fontconfig settings for DejaVu.
* iTerm2 settings.
* More settings via `osx_defaults`.
* Secrets.
    * SSH public/private keys.
    * GPG public/private keys.
    * Log in to docker hub, jetbrains, and other accounts.
