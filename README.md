# bzz

`bzz` is a command-line program that makes your Force Touch trackpad buzz.

## Disclaimer

This will probably break your trackpad.

## Installation

```sh
$ xcodebuild
$ cp build/Release/bzz ~/bin/ # (or somewhere else on your PATH)
```

## Usage

```sh
$ bzz [length [interval]]
```

Both length and interval are in milliseconds.  If unspecified, length is 1000 and interval is 10.
