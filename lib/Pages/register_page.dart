import 'package:chat_app/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../Components/my_button.dart';
import '../Components/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final void Function() onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context ) {
    final auth = AuthService();
    if(passwordController.text == confirmPasswordController.text){
      try{
        auth.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
      }catch(e){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString(),),
          ),
        );
      }
    }
    else{
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match !"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
              hintText: 'Email',
              obSecureText: false,
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Password',
              obSecureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              obSecureText: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
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
