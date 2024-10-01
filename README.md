# rangex

A Dart utility package inspired by Python's range.

## Usage

```dart
import 'package:rangex/rangex.dart';

void main() {
  for (final i in range(5)) {
    print(i); // 0, 1, 2, 3, 4
  }
  for (final i in range(1, 5)) {
    print(i); // 1, 2, 3, 4
  }
  for (final i in range(0, 10, 2)) {
    print(i); // 0, 2, 4, 6, 8
  }
}

```
