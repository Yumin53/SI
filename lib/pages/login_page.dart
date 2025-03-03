import 'package:flutter/material.dart';
import 'package:si/services/fireauth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login')
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: 'Email'
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password'
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FireauthService().signin(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                },
                child: const Text('Login'),
            ),
            ElevatedButton(
                onPressed: () {
                  FireauthService().signup(
                      email: _emailController.text,
                      password: _passwordController.text,
                  );
                },
                child: const Text('SignUp'))
          ],
        ),
      ),
    );
  }
}