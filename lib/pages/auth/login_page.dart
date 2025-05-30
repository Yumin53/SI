import 'package:flutter/material.dart';
import '../../components/my_button.dart';
import '../../components/my_textfield.dart';
import '../../services/fireauth.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.recycling_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25,),

            // app name
            Text(
              'DAILY GARDEN',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 25,),

            // email textfield
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10,),

            // password textfield
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 10,),

            // forgot password?
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'forgot password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25,),

            // sign in button
            MyButton(
                text: 'Login',
                buttonSize: 25,
                onTap: () => {
                  FireauthService().signin(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                      context: context
                  )
                }
            ),

            const SizedBox(height: 25,),

            // don't have an account? Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    " Register here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25,),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text('Or continue with'),
                ),

                Expanded(
                  child: Divider(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25,),

            GestureDetector(
              onTap: () {
                FireauthService().googleSignin(context);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primary
                ),
                child: Image.asset(
                  'lib/icons/google.png',
                  width: 75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}