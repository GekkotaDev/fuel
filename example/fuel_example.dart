import "package:fuel/fuel.dart";

class Counter {
  int count = 0;

  void decrement([int amount = 1]) => count = count - amount;

  void increment([int amount = 1]) => count = count + amount;

  void reset() => count = 0;
}

void incrementer(Counter counter) => counter.increment();

void main() {
  /*
    Note that this should not be considered a good example. It only aims to
    provide a simple introduction to using Fuel's API. Check the tests directory
    for more information.

    Your need for this package will naturally come as requirements during real
    world programming.
   */

  incrementer(fuel.use(() => Counter()));

  final counter = fuel.use(() => Counter());
  assert(counter.count == 1);
}
