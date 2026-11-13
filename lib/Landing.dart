import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    // final Controller c = Get.put(Controller());

    return Scaffold(
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        onPressed: () => Get.toNamed("/signin"),
      ),
      body: Center(child: ListView(children: [Text("ok1"), Text("ok2")])),
    );
  }
}
