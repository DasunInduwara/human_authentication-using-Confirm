import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String Confirm = "Confirm";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Please Type "',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Confirm',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '" bellow'),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Form(
                key: _formKey,
                child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Type here",
                    ),
                    style: TextStyle(fontSize: 19),
                    validator: (String? value) {
                      RegExp regexp = RegExp(Confirm);
                      if (!regexp.hasMatch(value.toString()) || value == null)
                        return 'Error'; // error massage
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Processing Data')), // snackbar massage
                      );
                    }
                  },
                  child: const Text('Submit'), // display Text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
