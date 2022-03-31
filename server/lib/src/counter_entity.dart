class CounterEntity {
  int _value = 0;

  int increment() {
    return ++_value;
  }

  int decrement() {
    return --_value;
  }
}
