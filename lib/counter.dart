class Counter {
  int count = 0;
  increament() => Future.delayed(Duration(seconds: 1), () => count++);
}
