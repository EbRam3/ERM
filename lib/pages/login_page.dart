import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            // isLoading? Center(child: CircularProgressIndicator(),):
            SafeArea(
          child: ListView(
            children: [
              // Container(
              //     alignment: Alignment.topLeft,
              //     child: Image.asset('images/shape.png')),
              const Center(
                child: Text(
                  'Welcome Back !',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                'images/welavater.png',
                width: 278,
                height: 246,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          controller: emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            labelText: 'Enter Email',
                            hintText: 'email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            labelText: 'Enter password',
                            hintText: 'email',
                            prefixIcon: const Icon(Icons.password),
                            counterText: 'counter',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () async {
                                if (emailController == null ||
                                    emailController.text.isEmpty) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: 'Please inter your email',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  ).show();
                                }
                                //else {
                                //   try {
                                //     await FirebaseAuth.instance
                                //         .sendPasswordResetEmail(
                                //             email: emailController.text);
                                //     AwesomeDialog(
                                //       context: context,
                                //       dialogType: DialogType.success,
                                //       animType: AnimType.rightSlide,
                                //       title: 'Info',
                                //       desc:
                                //           'Please check your email we have sent you a link to change your password',
                                //       btnCancelOnPress: () {},
                                //       btnOkOnPress: () {},
                                //     ).show();
                                //   } catch (e) {
                                //     AwesomeDialog(
                                //       context: context,
                                //       dialogType: DialogType.error,
                                //       animType: AnimType.rightSlide,
                                //       title: 'Error',
                                //       desc:
                                //           'This email did not found in the app',
                                //       btnCancelOnPress: () {},
                                //       btnOkOnPress: () {},
                                //     ).show();
                                //   }
                                // }
                              },
                              child: const Text('Forget Password'))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(327, 80),
                              backgroundColor:
                                  const Color.fromRGBO(21, 135, 112, 1),
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () async {
                            // try {
                            //   isLoading = true;
                            //   setState(() {});
                            //   final credential = await FirebaseAuth.instance
                            //       .signInWithEmailAndPassword(
                            //     email: emailController.text.trim(),
                            //     password: passwordController.text.trim(),
                            //   );

                            //   isLoading = false;
                            //   setState(() {});

                            //   Navigator.of(context)
                            //       .pushReplacementNamed('parentHome');
                            // } on FirebaseAuthException catch (e) {
                            //   if (e.code == 'user-not-found') {
                            //     print('No user found for that email.');
                            //   } else if (e.code == 'wrong-password') {
                            //     print('Wrong password provided for that user.');
                            //   }
                            // }
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.5),
                          )),
                    ],
                  ))
            ],
          ),
        ));
  }
}
