import 'package:material_ui/material_ui.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({super.key, this.start, this.end});

  final DateTime? start;
  final DateTime? end;

  static String _format(DateTime? t) {
    if (t == null) return '--:--';
    final local = t.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.hour)}:${two(local.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.schedule),
      title: const Text('Time slot'),
      subtitle: Text('${_format(start)} – ${_format(end)}'),
    );
  }
}
