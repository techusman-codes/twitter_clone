import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.title});

  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            'SignUp to X',
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
                  hintText: "Enter your email",
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
                  'Sign UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Already have an account? Log in",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    ));
  }
}
