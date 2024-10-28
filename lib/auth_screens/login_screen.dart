import 'dart:io';

import 'package:cropsense/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/decorated_text_field.dart';
import '../utils/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isExiting = false;

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authProvider);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // if user clicked on back button once make snack bar to ask if he wants to exit , then if he clicks it again exit the app

        if (!isExiting) {
          setState(() {
            isExiting = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit'),
              duration: Duration(seconds: 2),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isExiting = false;
            });
          });
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: contrastColor),
          backgroundColor: Colors.white,
          // leading: const Icon(Icons.arrow_back_ios),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Center(
                    child: Text('Log In', style: TextStyle(fontSize: 30))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                DecoratedTextField(
                    label: 'Email Address',
                    hint: 'SomeOne@email.com',
                    isObsecure: false,
                    controller: emailController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter a valid email' : null),
                DecoratedTextField(
                    label: 'Password',
                    hint: '********',
                    isObsecure: true,
                    controller: passwordController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter a password' : null),
                const SizedBox(height: 10),
                // ColoredTextButton(text: 'Forgot Password?', onPressed: () {}),
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                ColoredButton(
                    color: auth.isLoading ? Colors.grey : mainColor,
                    text: auth.isLoading ? 'Loading...' : 'Log in',
                    onPressed: auth.isLoading
                        ? () {}
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              await auth
                                  .login(emailController.text,
                                      passwordController.text)
                                  .then((value) {
                                // nothing to do here
                              });
                            }
                          }),
                const SizedBox(height: 10),
                // ColoredButton(
                //     color: contrastColor,
                //     text: 'Log in with Face ID',
                //     onPressed: () {}),
                // const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
