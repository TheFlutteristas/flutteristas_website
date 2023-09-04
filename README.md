## Flutteristas Website

The site is built with Dart utilizing the [Dart Web Platform](https://dart.dev/web) with core web libraries like [dart:html](https://api.dart.dev/stable/3.1.0/dart-html/dart-html-library.html).

We utilize [Jaspr](https://pub.dev/packages/jaspr) to provide a more Flutter centric feel to web development. Check out the [docs](https://docs.page/schultek/jaspr) for more info.


## Prerequisites

Install the [webdev tool](https://dart.dev/tools/webdev)

```sh
dart pub global activate webdev
```

## Run locally with

```sh
webdev serve --auto refresh
```

## Debugging

Install the [Dart Debug Extension](https://chrome.google.com/webstore/detail/dart-debug-extension/eljbmlghnomdjgdjmbdekegdkbabckhm) and run:

```sh
webdev serve --debug-extension
```

or you use devtools [Debugging Web Info](https://dart.dev/web/debugging)

## Build and Deploy

```sh
webdev build
firebase deploy
```
