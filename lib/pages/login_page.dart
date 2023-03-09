import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_in_flutter_blog/pages/all_todos_page.dart';

import '../key_constants.dart';
import '../notifiers/login_notifier.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(loginNotifierProvider);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Text(
                    'Login Screen',
                    key: loginScreenTextKey,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: emailTextFormKey,
                    validator: (value) {
                      const pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                      final regex = RegExp(pattern);

                      return (value != null && !regex.hasMatch(value))
                          ? kEmailErrorText
                          : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: passwordTextFormKey,
                    validator: (value) {
                      if (value != null && value.length <= 6) {
                        return kPasswordErrorText;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      key: loginButtonKey,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await loginProvider.login().then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AllTodoPage(),
                              ),
                            );
                          });
                        }
                      },
                      child: loginProvider.isLoading
                          ? const CircularProgressIndicator(
                              key: loginCircularProgressKey,
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              key: loginButtonTextKey,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
