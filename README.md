# flutter_visibility_aware

A tiny widget which is aware of its visibility based on `WidgetsBindingObserver` and 
https://pub.dev/packages/visibility_detector

# Intro

```dart

    // Just wrapper on the widget which wants to handle visible or invisible events. 

    VisibilityAware(
      visibleCallback: () async {
        debugPrint("$this is visible.");
      },
      invisibleCallback: () async {
        debugPrint("$this is invisible.");
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "$this",
            ),
          ),
        ),
      ),
    );

```

![](./media/intro.gif)

# Dependencies

[visibility_detector](https://pub.dev/packages/visibility_detector)

# License

```
Copyright 2020 Chris Xinyue Zhao

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
