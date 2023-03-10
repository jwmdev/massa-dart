class Slot {
  Slot({
    required this.period,
    required this.thread,
  });
  late final int period;
  late final int thread;

  Slot.decode(Map<String, dynamic> json) {
    period = json['period'];
    thread = json['thread'];
  }

  Map<String, dynamic> encode() {
    final data = <String, dynamic>{};
    data['period'] = period;
    data['thread'] = thread;
    return data;
  }
}
