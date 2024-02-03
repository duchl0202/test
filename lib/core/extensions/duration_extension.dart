extension DurationExtensions on int {
  String toHHmmss() {
    final int totalSeconds = this ~/ 1000; // Chuyển từ mili giây sang giây
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;

    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      final String hoursStr = hours.toString().padLeft(2, '0');
      return '$hoursStr:$minutesStr:$secondsStr';
    } else {
      return '$minutesStr:$secondsStr';
    }
  }

  String toMinuteSecondMillisecond() {
    final int hours = (this ~/ 1000) ~/ 3600;
    final int minutes = ((this ~/ 1000) % 3600) ~/ 60;
    final int seconds = (this ~/ 1000) % 60;
    final int milliseconds = this % 1000;

    final String hoursStr = hours.toString().padLeft(2, '0');
    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');
    final String millisecondsStr = milliseconds
        .toString()
        .substring(0, 2.clamp(0, milliseconds.toString().length))
        .padLeft(2, '0');

    return (hours > 0)
        ? '$hoursStr:$minutesStr:$secondsStr.$millisecondsStr'
        : '$minutesStr:$secondsStr.$millisecondsStr';
  }
}
