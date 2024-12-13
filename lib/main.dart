import 'package:dy2_form_app/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Twitter Clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _signInKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage('assets/twitter.png'),
            width: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Login to X',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: "Enter Email",
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print('Plss enter your Email');
                } else if (emailValid.hasMatch(value)) {
                  return 'Enter a Valid Email';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(
              15,
            ),
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print('Plss enter your passwod');
                } else if (value.length < 6) {
                  print('Password Most be  atleast 6 chracters');
                }
                return null;
              },
            ),
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: TextButton(
                onPressed: () {
                  if (_signInKey.currentState!.validate()) {
                    debugPrint("Email: $_emailController.text");
                    debugPrint("Password $_passwordController.text");
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUp(
                          title: '',
                        )));
              },
              child: const Text(
                "Don't have an account? Sign Up here",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    ));
  }
}
