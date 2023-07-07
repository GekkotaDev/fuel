/// A [Function] that returns an instance of type [T].
typedef Injector<T> = T Function();

/// Processes the given dependency.
typedef Processor<T> = T Function(T);

/// A service locator that manages dependencies of type [T]. Explicit registry
/// of dependencies are optional, they may be lazily registered at the time they
/// are injected instead; The service locator will handle it automatically by
/// utilizing Dart's generics type system.
class Fuel<T> {
  final Map<Type, T> _registry = {};

  /// [dispose]s the given [injectable] from the [Fuel] instance's registry. The
  /// [dispose] method should be used when it can be guaranteed the [injectable]
  /// will not be used again.
  void dispose<R extends T>(Injector<R> injectable) => _registry.remove(R);

  /// [pump] an entirely fresh instance of the dependency through an [Injector].
  /// A [mock] object of subtype [R] may also be provided which will be used
  /// instead of the [injectable]; the mock may be useful to replace an
  /// implementation of type [R] with a compatible subtype implementation at
  /// runtime, in addition to providing mocks during testing.
  R pump<R extends T>(
    Injector<R> injectable, {
    R? mock,
    Processor<R>? processor,
  }) {
    final R injected = switch (mock) {
      null => injectable(),
      _ => mock,
    };

    _registry[R] = switch (processor) {
      null => injected,
      _ => processor(injected),
    };
    return injected;
  }

  /// [inject] a singleton instance of the dependency based on the return type
  /// of the [injector] into the requesting dependent. If the type of the
  /// dependency is not found within this instance of [Fuel], the [injector]
  /// will be called to provide the singleton of the dependency.
  R inject<R extends T>(Injector<R> injector) {
    final injectable = _registry[R];

    if (injectable is! R) return pump(injector);
    return injectable;
  }

  /// An alias to [inject].
  R use<R extends T>(R Function() injector) => inject(injector);
}

/// A special global instance of [Fuel] to manage subtypes of [Fuel]. Note that
/// they **have to be** subtypes of [Fuel] to work, else only a single instance
/// of a [Fuel] injector will be available.
final tank = Fuel<Fuel>();

/// A globally available instance of [Fuel]. Note that this instance is not type
/// safe; if type safety is a requirement, instantiate your own instance of Fuel
/// with a generic to narrow down the usable types.
final fuel = Fuel();
