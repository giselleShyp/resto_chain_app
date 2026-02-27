class WorkingHours {
  /// minutes from start of day (0 - 1440)
  final int openHour;
  final int closeHour;

  const WorkingHours({
    required this.openHour,
    required this.closeHour,
  });

  /// Branch isOpen ?
  bool isOpenNow() {
    final now = DateTime.now();
    final currentMinutes = now.hour * 60 + now.minute;

    // General Status(exp 10:00 → 22:00)
    if (closeHour > openHour) {
      return currentMinutes >= openHour && currentMinutes < closeHour;
    }

    //If Rest Close After 12pm (exp 18:00 → 02:00)
    return currentMinutes >= openHour || currentMinutes < closeHour;
  }

  /// (12-hour format)
  String formattedRange() {
    return "${_format(openHour)} - ${_format(closeHour)}";
  }

  String _format(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;

    final period = hour >= 12 ? "PM" : "AM";
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    final minuteStr = minute.toString().padLeft(2, '0');

    return "$hour12:$minuteStr $period";
  }

  factory WorkingHours.fromMap(Map<String, dynamic> map) {
    return WorkingHours(
      openHour: map['openHour'] as int,
      closeHour: map['closeHour'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'openHour': openHour,
      'closeHour': closeHour,
    };
  }
}
