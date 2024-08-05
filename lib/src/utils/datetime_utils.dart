class DateTimeUtils {
  static Duration? parseDuration(dynamic offset) {
    if (offset == null) return null;
    if (offset is int) {
      return Duration(hours: offset);
    } else if (offset is String) {
      final regex = RegExp(r'^([+-])(\d{2}):(\d{2})$');
      final match = regex.firstMatch(offset);
      if (match == null) return null;

      final sign = match.group(1) == '+' ? 1 : -1;
      final hours = int.parse(match.group(2)!);
      final minutes = int.parse(match.group(3)!);

      return Duration(hours: hours * sign, minutes: minutes * sign);
    }
    return null;
  }
}
