abstract class Matcher<T> {
  const Matcher();

  Exception? match(T value);
}
