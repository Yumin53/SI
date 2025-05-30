import 'package:flutter/material.dart';
import 'package:si/components/my_button.dart';
import 'package:si/components/my_textfield.dart';
import 'package:si/services/fireauth.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({
    super.key,
    required this.onTap,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

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

            // Name textfield
            MyTextField(
              hintText: 'Name',
              obscureText: false,
              controller: _nameController,
            ),

            const SizedBox(height: 10,),

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

            // confirm password textfield
            MyTextField(
              hintText: 'Confrim Password',
              obscureText: true,
              controller: _confirmPwController,
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

            // sign up button
            MyButton(
              text: 'Signup',
              buttonSize: 25,
              onTap: () => {
                FireauthService().signup(
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                  confirmPw: _confirmPwController.text.trim(),
                  context: context,
                ),
              }
            ),

            const SizedBox(height: 25,),

            // already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    " Login here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}