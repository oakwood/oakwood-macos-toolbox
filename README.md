# Oakwood macOS Toolbox

[![License](https://img.shields.io/github/license/oakwood/oakwood-macos-toolbox)](https://github.com/oakwood/oakwood-macos-toolbox/blob/master/LICENSE)

Installation
------------

#### ⚠️ Disclaimer! ⚠️
**DO NOT** just run the `installer` snippet if you do not fully understand [what it does](./installer.sh)!

To set up the `oakwood macOS toolbox`, run the appropriate snippet in the terminal:

| Downloader | Snippet                                                                                                                                 |
| :--------- | :--------------------------------------------------------------------------------------------------------                               |
| `curl`     | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/oakwood/oakwood-macos-toolbox/master/installer.sh)"`                           |
| `wget`     | `bash -c "$(wget https://raw.githubusercontent.com/oakwood/oakwood-macos-toolbox/master/installer.sh -O -)"`                            |
| `git`      | `git clone git@github.com:oakwood/oakwood-macos-toolbox.git ~/oakwood-macos-toolbox && source ~/oakwood-macos-toolbox/installer.sh`     |

That's it! 🎉, then the process does a few things:

* Install `Xcode` Commandline tools
* Install and configure `Git` if it's not installed in your machine.
* Download `Homebrew` our main macOS dependency manager.
* Clone `oakwood-macos-toolbox` repo on your computer (by default it will suggest `~/oakwood-macos-toolbox`).
* Boostrape your environment by Installing CLI Tools and Applications for your [`macOS`](scripts/macos/bootstrap.sh), [`Nodejs`](scripts/macos/nodejs.sh) including global packages.

License
-------
Copyright © 2020 Oakwood
Licensed under the MIT [`license`](LICENSE).
