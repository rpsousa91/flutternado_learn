import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              label: 'Name',
              icon: Icons.person,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: 'Email',
              icon: Icons.email,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: 'Password',
              icon: Icons.vpn_key,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: 'Confirm Password',
              icon: Icons.vpn_key,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.save),
                label: Text('Save'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.restore),
                label: Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CustomTextField({Key? key, required this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: 'Type $label...',
          border: OutlineInputBorder(),
          prefixIcon: icon == null ? null : Icon(icon)),
    );
    /* AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return Text(controller.text);
                }), */
  }
}
