import 'dart:collection';

Range range(int a, [int? b, int? c]) => Range(a, b, c);

class Range extends IterableBase<int> {
  final int start;
  final int end;
  final int step;

  Range(int a, [int? b, int? c])
      : start = b == null ? 0 : a,
        end = b ?? a,
        step = c ?? 1,
        assert(c != 0);

  @override
  Iterator<int> get iterator => RangeIterator(start, end, step);
}

class RangeIterator implements Iterator<int> {
  final int start;
  final int end;
  final int step;
  int _current;

  RangeIterator(this.start, this.end, this.step) : _current = start - step;

  @override
  int get current => _current;

  @override
  bool moveNext() {
    if (step > 0 && _current + step >= end) {
      return false;
    } else if (step < 0 && _current + step <= end) {
      return false;
    } else {
      _current += step;
      return true;
    }
  }
}
