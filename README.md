# Wishfish

**Wishfish** is a SSH wrapper for macOS that binds to a specific network interface, e. g. Wi-Fi.


## Warning

**This is alpha-quality software.** If you don’t know what this means, do not use Wishfish.

If you do use Wishfish, be advised that it is largely untested. That said, it’s only a tiny wrapper so I expect it to work well enough.


## System requirements

To use Wishfish, you need OS&nbsp;X 10.11 El Capitan, macOS 10.12 Sierra, or a later macOS version.


## Purpose

I use this command to force SSH to run over the Wi-Fi interface even if there is another network interface with higher priority (e.&nbsp;g. Ethernet).

In other words, `wishfish` allows you to disconnect an Ethernet cable from your Mac without disconnecting your active SSH sessions as long as you’re on Wi-Fi.

Without `wishfish`, you’d need to either configure your Wi-Fi interface to have the highest priority, which you may not want at all times because your Ethernet is faster; or, you’d need to pass your own link-local IP address to the `ssh` command so it binds to that interface. The latter is especially cumbersome because you may not want to memorize your local IP address, or you may not find it acceptable that the IP address can change.


## Installation

1. Make sure you have [Homebrew](https://brew.sh) installed.

2. Run `brew install claui/public/wishfish` if you haven’t already done so.


## Usage

There are two executables in this package: `wishfish` and `ipv6_address`.

### Using wishfish

Run the `wishfish` command from the Terminal to establish a SSH connection. As the first command-line argument, pass the name of the interface you wish to bind, and then append your `ssh` arguments:

```
$ wishfish <interface> <ssh_arguments>
```

For example:

```
$ wishfish en0 -p 22 user@example.com
```


### Using ipv6_address

This package depends on another CLI tool `ipv6_address`, which tells you one of your current IPv6 addresses bound to specific network interface. Pass the interface name as the single command-line argument:

```
$ bin/ipv6_address
```

Running ipv6_address results in one of the following two scenarios:

- `ipv6_address` finds one or more IPv6 addresses currently bound to the given interface. It then prints one of those addresses to standard output, and the exit status will be 0.

- `ipv6_address` does not find an IPv6 address to the given interface, or runs into another error. Either way, it does not print anything on standard output, and exits with a status code of 1.


## License

Copyright (c) 2017 Claudia <clau@tiqua.de>

Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted, provided that the
above copyright notice and this permission notice appear in all
copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
