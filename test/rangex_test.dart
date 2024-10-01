import 'dart:convert';
import 'dart:io';

import 'package:rangex/rangex.dart';
import 'package:test/test.dart';

Future<List<int>> runPythonRange(int a, [int? b, int? c]) async {
  final range = [a, b, c].where((e) => e != null).toList();
  final code = "print(list(range(${range.join(',')})))";
  print('python -c "$code"');
  final process = await Process.start(
    'python',
    ['-c', code],
  );

  final result = await process.stdout.transform(utf8.decoder).join();
  return json.decode(result).cast<int>();
}

void main() async {
  test('Run Python', () async {
    expect([0, 1, 2, 3, 4], await runPythonRange(5));
  });

  test('Range(5)', () async {
    expect(range(5), await runPythonRange(5));
  });

  test('Range(1, 5)', () async {
    expect(range(1, 5), await runPythonRange(1, 5));
  });

  test('Range(0, 10, 2)', () async {
    expect(range(0, 10, 2), await runPythonRange(0, 10, 2));
  });

  test('Range(1, 10, 3)', () async {
    expect(range(1, 10, 3), await runPythonRange(1, 10, 3));
  });

  test('Range(10, 0, -2)', () async {
    expect(range(10, 0, -2), await runPythonRange(10, 0, -2));
  });

  test('Range(5, -5, -3)', () async {
    expect(range(5, -5, -3), await runPythonRange(5, -5, -3));
  });

  test('Range(5, 5)', () async {
    expect(range(5, 5), await runPythonRange(5, 5));
  });

  test('Range(5, 1)', () async {
    expect(range(5, 1), await runPythonRange(5, 1));
  });

  test('Range(1, 5, -1)', () async {
    expect(range(1, 5, -1), await runPythonRange(1, 5, -1));
  });

  test('Range(0, 1000000)', () async {
    expect(range(0, 1000000), await runPythonRange(0, 1000000));
  });
}
