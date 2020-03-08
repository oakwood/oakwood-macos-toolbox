# Oakwood macOS Toolbox

[![License](https://img.shields.io/github/license/oakwood/oakwood-macos-toolbox)](https://github.com/oakwood/oakwood-macos-toolbox/blob/master/LICENSE)

> Manage your tools the easy way

### What is Oakwood Toolbox?

The Oakwood Toolbox makes managing your development tools almost effortless! Highly recommended

- Download and configure `Homebrew` as dependency manager.
- Bootstrap your developmnent environment by installing Apps and CLI tools for your [`macOS`](scripts/macos/bootstrap.sh), [`Nodejs`](scripts/macos/nodejs.sh) including global packages.
- Install Xcode Command Line Tools package gives you a complete Unix toolkit accessible through Terminal.
- Install and configure `Git` if it's not installed in your machine.
- Update packages automatically


### Why Oakwood Toolbox

Save time and effort maintaining your macOS, by downloading all apps and cli tools needed for development enviroment.

### Installation

#### ⚠️ Disclaimer! ⚠️
**DO NOT** just run the `installer` snippet if you do not fully understand [what it does](./installer.sh)!

To set up the `oakwood macOS toolbox`, run the appropriate snippet in the terminal:

| Downloader | Snippet                                                                                                                             |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------- |
| `curl`     | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/oakwood/oakwood-macos-toolbox/master/installer.sh)"`                       |
| `wget`     | `bash -c "$(wget https://raw.githubusercontent.com/oakwood/oakwood-macos-toolbox/master/installer.sh -O -)"`                        |
| `git`      | `git clone git@github.com:oakwood/oakwood-macos-toolbox.git ~/oakwood-macos-toolbox && source ~/oakwood-macos-toolbox/installer.sh` |

That's it! 🎉 wait for the magic 😍

### License

Copyright © 2020 Oakwood
Licensed under the MIT [`license`](LICENSE).
