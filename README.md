<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Fuel

Sweetly simple dependency injection.

## Features

- **Zero dependencies.** No third party dependencies, not even the standard
library. Pure Dart, works outside of Flutter.
- **Implicit registration.** Dependencies will automatically register as
singletons the moment they're injected. No need to explicitly register them all
at the start of your program, consequentially making them lazy loaded.
- **Minimal implementation.** Fits within ~2.5 kilobytes with a dead simple API
and documentation, minification not included.
- **No `build_runner`.** A simple abstraction that utilizes Dart's type system.

## Q&A

- **Factories?**. `fuel` does not explicitly provide a method for registering
factories. Provide the dependency as is since `fuel` expects you to not tightly
couple dependencies and dependents a la dependency injection.
- **Eager loading?** Call the `use` method at the start of your program a la
traditional usage of service locators.
- **Asynchronous injectors?** `fuel` will not explicitly provide support for
asynchronous injectors. Since injectors in `fuel` are just functions, futures
can be resolved within the injector via the `.then` method.
- **Updates?** Likely not. The API will intentionally remain small to do one
thing, and one thing well; more complex requirements are better served by the
`get_it` package. It is unlikely bugs will occur with how short & simple the
implementation of this package is.
- **Do I need this?** Not necessarily. This package merely provides you with
the convenience of having an architectural pattern already implemented for you
that you can also implement yourself within a few lines of code.

## Installation

```powershell
# For Flutter projects
flutter pub add fuel

# Otherwise
dart pub add fuel
```

## Notice

Licensed under the BSD 3 Clause license.
