# [![PMDA++](qrc/icon/bipolar30.png)](#) Bipolar
[![Build Status](https://img.shields.io/travis/pcolby/bipolar/master.svg "Linux (Travis CI)")](https://travis-ci.org/pcolby/bipolar)
[![Build Status](https://img.shields.io/appveyor/ci/pcolby/bipolar.svg "Windows (AppVeyor)")](https://ci.appveyor.com/project/pcolby/bipolar)
[![Github Release](http://img.shields.io/github/release/pcolby/bipolar.svg)](https://github.com/pcolby/bipolar/releases/latest)
[![GPLv3 License](http://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/copyleft/gpl.html)
[![Chat](https://img.shields.io/badge/gitter-chat-45cba1.svg "Join the chat")](https://gitter.im/pcolby/bipolar)

Bipolar a simple GUI application for exporting training sessions from Polar
sync software, such as [Polar FlowSync].  Currently, the following applications
and devices are supported:

* [Polar FlowSync], on both Mac and Windows.
* [Polar V800]
* [Polar Loop]

## Installing Bipolar

### Mac OS X

1. Install [Polar FlowSync], if you haven't already.
2. Close FlowSync, if it's already running.
3. Download the [latest Bipolar release] - you'll want the
   `Bipolar-<version>.dmg` file for OS X.
4. Open the downloaded `Bipolar-<version>.dmg` file.
5. Read the includes `README.txt` file.
6. Enter the `Hook` folder.
7. Run the `install.command` script.

See the [How it Works](#how-it-works) for more information about the Hook that
gets installed in that last step.

### Windows

1. Install [Polar FlowSync], if you haven't already.
2. Close FlowSync, if it's already running.
3. Download the [latest Bipolar release] - you'll want the
   `Bipolar-<version>.exe` file for Windows.
4. Run the downloaded `Bipolar-<version>.exe` installer.
5. Follow the usual install wizard prompts.

See the [How it Works](#how-it-works) for more information about the Hook that
gets installed in that last step.

## Using Bipolar

Once installed (see above), the usage pattern is pretty simple:

1. Record some activities on a supported Polar device.
2. Use FlowSync to upload your activities to [flow.polar.com] as usual.
3. Run the Bipolar application, and follow the GUI prompts. Depending on the
   options selected, this will generate GPX, HRM, and/or TCX versions of all
   activities seen.
4. Open/upload the generated GPX, HRM, and/or TCX files to your favorite website
   or application.

## How it Works

### Windows

When Bipolar is installed, it places a custom DLL into the Polar FlowSync
application directory. This custom DLL then writes all training session data it
sees to binary files (in `%LOCALAPPDATA%\Polar\PolarFlowSync\export`).

The installer also installs a separate Bipolar application, which, when exectued
looks through all training session data exported above, and, for any that don't
already have corresponding `*.gpx` and/or `*.tcx` files, converts those sessions
to GPX and/or TCX accordingly.

### OSX

For OSX, Bipolar is provided as a standard disk image (`*.dmg`) file. This file
contains both the Bipolar application (which can run completely standalone), and
the hook library.  However, the hook library is not automatically installed for
OSX. Instead, the disk image includes a simple hook install script to run to
install the hook (which you will want to do, unless using the direct USB option
mentioned below).

### Direct USB Interface

The separate [v800_downloader](https://github.com/profanum429/v800_downloader)
project provides a way of extracting training session data from the V800
directly, without the need for the hook mentioned above. That project extracts
data in a format that is compatible with this project's Bipolar application, so
can be used as a hook alternative if desired.

Of course, that is particularly exciting for Linux users, who otherwise could
not make any significant use of this project, nor the Polar V800 in general.

## Contact

The [issue tracker] is the preferred place for reporting issues, asking basic
questions, making comments and suggestions, etc.

There's also a [Gitter chat room] that _may_ become the preferred place for
general discussion, etc.  It's under evaluation, but looks promising.

There's an older [Bipolar Google Group] available for general discussion,
questions, comments, suggestions, announcements etc.  Email
bipolar-app@googlegroups.com to subscribe.

And finally, there's a
[Bipolar open-source project](http://forum.polar.fi/showthread.php?t=29092)
topic on the Polar forums, which contains quite a bit of relevant information.

[Bipolar Google Group]: http://groups.google.com/d/forum/bipolar-app
[Gitter chat room]: https://gitter.im/pcolby/bipolar
[issue tracker]: https://github.com/pcolby/bipolar/issues?state=open
[latest Bipolar release]: https://github.com/pcolby/bipolar/releases/latest
[Polar FlowSync]: https://flow.polar.com/start
[Polar Loop]: http://www.polarloop.com/
[Polar V800]: http://www.polarv800.com/
