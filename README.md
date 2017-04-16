flycheck-joker
=================

[![MELPA](https://melpa.org/packages/flycheck-joker-badge.svg)](https://melpa.org/#/flycheck-joker)

This package adds Clojure(Script) syntax checker (via [Joker](https://github.com/candid82/joker)) to flycheck.

## Installation

The package is available on [Melpa](https://melpa.org/#/flycheck-joker):

```
M-x package-install flycheck-joker
```

Then add the following to your init.el:

```
(require 'flycheck-joker)
```

Make sure Joker binary is on your path. See [Joker installation instructions](https://github.com/candid82/joker#installation) for details.

Please read about [Joker's linter mode](https://github.com/candid82/joker#linter-mode) to understand its capabilities and limitations. Specifically, it's important to [configure Joker](https://github.com/candid82/joker#reducing-false-positives) to reduce false positives.

Please see examples of the errors Joker can catch [here](https://github.com/candid82/SublimeLinter-contrib-joker#examples)

