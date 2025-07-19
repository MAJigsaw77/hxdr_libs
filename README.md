# hxdr_libs

![](https://img.shields.io/github/repo-size/MAJigsaw77/hxdr_libs) ![](https://badgen.net/github/open-issues/MAJigsaw77/hxdr_libs) ![](https://badgen.net/badge/license/MIT/green)

A Haxe/[Lime](https://lime.openfl.org) library for @:native audio decoding using [dr_libs](https://github.com/mackron/dr_libs).

> [!WARNING]
> **Hashlink or Neko are not supported**

### Installation

You can install it through `Haxelib`.

```bash
haxelib install hxdr_libs
```
Or through `Git`, if you want the latest updates
```bash
haxelib git hxdr_libs https://github.com/MAJigsaw77/hxdr_libs.git
```

### Basic Usage Example

#### Flac Decoding
```haxe
import hxdr_libs.Flac;

import lime.media.AudioSource;

final again:AudioSource = new AudioSource(Flac.fromFile("assets/AGAIN.flac"));
again.play();
```

#### Mp3 Decoding
```haxe
import hxdr_libs.Mp3;

import lime.media.AudioSource;

final complex:AudioSource = new AudioSource(Mp3.fromFile("assets/COMPLEX.mp3"));
complex.play();
```

#### Wav Decoding
```haxe
import hxdr_libs.Wav;

import lime.media.AudioSource;

final nextToYou:AudioSource = new AudioSource(Wav.fromFile("assets/NEXT TO YOU.wav"));
nextToYou.play();
```

### Licensing

**hxdr_libs** is made available under the **MIT License**. See [LICENSE](./LICENSE) for details.

**dr_libs** is made available under either **public domain (Unlicense)** or **MIT No Attribution**. Check [dr_libs's LICENSE](https://github.com/mackron/dr_libs/blob/master/LICENSE) for more information.

