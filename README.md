Alert
===

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Platform](https://img.shields.io/badge/platform-iOS-yellow.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
[![Swift Version](https://img.shields.io/badge/Swift-3-F16D39.svg)](https://developer.apple.com/swift)

Alert is a syntax sugar library of UIAlertController.

# Usage

## Simple

```swift
import Alert

Alert(title: "Title", message: "Message")
    .addAction("OK") { _ in
        print("ok")
    }
    .addAction("Cancel", style: .cancel) { _ in
        print("cancel")
    }
    .present()

ActionSheet(title: "Title", message: "Message")
    .addAction("OK") { _ in
        print("ok")
    }
    .addAction("Cancel", style: .cancel) { _ in
        print("cancel")
    }
    .presentingSource(view)
    .present()
```

## TextField

```swift
Alert(title: "Title", message: "Message")
    .addAction("OK") { _ in
        print("ok")
    }
    .addAction("Cancel", style: .cancel) { _ in
        print("cancel")
    }
    .addTextField(configuration: { textField in
        textField.placeholder = "E-mail"
    }, textDidChanged: { alert, textField in
        print(textField.text)
    })
    .addTextField(configuration: { textField in
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
    })
    .present()
```


# Installation

## Carthage

```ruby
github "tattn/Alert"
```

# Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

# License

Alert is released under the MIT license. See LICENSE for details.
