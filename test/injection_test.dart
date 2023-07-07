import "package:fuel/fuel.dart";
import "package:test/test.dart";

class Counter {
  int count = 0;

  void decrement([int amount = 1]) => count = count - amount;

  void increment([int amount = 1]) => count = count + amount;

  void reset() => count = 0;
}

void main() {
  test("injects Counter", () {
    final counter = fuel.use(() => Counter());

    expect(counter.count, 0);
    counter.increment();
  });

  test("injects Counter again", () {
    final counter = fuel.use(() => Counter());

    expect(counter.count, 1);
  });
}
