# Pomo25 [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

## Pomodoro app

A productivity app that helps with time management by allowing users to take on a big task gradually using 25 minutes sessions with 5 minutes break, so as to keep focused instead of getting stressed out by long non-stop work/study hours.
After the 25 minutes work/study session the 5 minute break commences.

Users can continue the pomodoro session until they've finish the task they've decided to do.

This is an app built upon the [pomodoro technique](https://en.wikipedia.org/wiki/Pomodoro_Technique) developed by Francesco Cirillo in the late 1980s

## Target device

Targets both Android and iOS but has only been tested on a physical iOS device

## NB
Since the pomodoro session takes 25 minutes, during grading 25 minutes might be a long time to wait, the session time and the break time can be adjusted to a shorter time in the pomo_timer.dart file, line 5 & 6.
It can be adjusted to something like
```dart
  static const SESSION_TIME = Duration(minutes: 1);
  static const BREAK_TIME = Duration(seconds: 10);
```

## Author

Ogundiran Al-Ameen

## License & Copyright

Licensed under the [MIT License](LICENSE.md).