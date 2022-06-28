import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

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
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                label: 'Name',
                icon: Icons.person,
                validator: (text) => text == null || text.isEmpty
                    ? 'This field cannot be empty'
                    : null,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                label: 'Email',
                icon: Icons.email,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  if (!string_validator.isEmail(text)) {
                    return 'Must be a valid email';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                  label: 'Password',
                  icon: Icons.vpn_key,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This field cannot be empty';
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                  label: 'Confirm Password',
                  icon: Icons.vpn_key,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This field cannot be empty';
                    }
                  }),
              const SizedBox(
                height: 40,
              ),
              Builder(builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (Form.of(context)!.validate()) {
                        Form.of(context)!.save();
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Builder(builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Form.of(context)?.reset();
                    },
                    icon: const Icon(Icons.restore),
                    label: const Text('Reset'),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField(
      {Key? key, required this.label, this.icon, this.validator, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: controller,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: label,
          hintText: 'Type $label...',
          border: const OutlineInputBorder(),
          prefixIcon: icon == null ? null : Icon(icon)),
    );
    /* AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return Text(controller.text);
                }), */
  }
}
