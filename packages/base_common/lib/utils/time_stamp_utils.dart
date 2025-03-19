class TimeStampUtils {
  static String formatTimeMinuteAndSecond(Duration duration) {
    return '${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  static String formatTimeMinuteAndSecondIntroductionPage(Duration duration) {
    return '${(duration.inMinutes).toString().padLeft(2, '0')} minutes ${(duration.inSeconds % 60).toString().padLeft(2, '0')} seconds';
  }
}
