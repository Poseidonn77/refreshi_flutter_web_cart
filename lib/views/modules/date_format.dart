/// e.g. `13 Nov 2026, 19:42` (local time).
String formatDateTime(DateTime? t) {
  if (t == null) return '-';
  final l = t.toLocal();
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', //
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  String two(int n) => n.toString().padLeft(2, '0');
  return '${l.day} ${months[l.month - 1]} ${l.year}, '
      '${two(l.hour)}:${two(l.minute)}';
}
