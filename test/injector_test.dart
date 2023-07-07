import "package:fuel/fuel.dart";
import "package:test/test.dart";

class Counter {
  int count = 0;

  void decrement([int amount = 1]) => count = count - amount;

  void increment([int amount = 1]) => count = count + amount;

  void reset() => count = 0;
}

class Label {
  String label = "";
}

class CounterService extends Fuel {}

class LabelService extends Fuel {}

void main() {
  test("registers service locators", () {
    final counterA = tank.use(() => CounterService());
    final labelA = tank.use(() => LabelService());

    final counterB = tank.use(() => CounterService());
    final labelB = tank.use(() => LabelService());

    expect(counterA, counterB);
    expect(labelA, labelB);
  });

  group("[Counter]", () {
    test("injects counter", () {
      final counterService = tank.use(() => CounterService());
      final counter = counterService.use(() => Counter());

      expect(counter.count, 0);
      counter.increment();
    });

    test("increments counter", () {
      final counterService = tank.use(() => CounterService());
      final counter = counterService.use(() => Counter());

      expect(counter.count, 1);
    });
  });

  group("[Label]", () {
    test("injects label", () {
      final labelService = tank.use(() => LabelService());
      final label = labelService.use(() => Label());

      expect(label.label, "");
      label.label = "Dart!";
    });

    test("sets label", () {
      final labelService = tank.use(() => LabelService());
      final label = labelService.use(() => Label());

      expect(label.label, "Dart!");
    });
  });
}
