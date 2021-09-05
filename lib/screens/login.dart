import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/screens/register.dart';

import '../components.dart';

class Login extends StatefulWidget {
  static final String route = '/Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();
  bool isSecurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Back !',
                style: TextStyle(fontSize: 30),
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 70, right: 15, left: 15),
                    child: Column(
                      children: [
                        Container(
                          child: DefaultTextField(
                            validate: (String? val) {
                              if (val!.isEmpty)
                                return 'please enter your email';
                              if (!val.contains('@'))
                                return 'the email should contains @';
                              if (!val.endsWith('.com'))
                                return 'the email should ends with .com';
                              return null;
                            },
                            hText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            onSave: (String? val) {},
                            onCompleted: () {
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            },
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: DefaultTextField(
                            secureText: isSecurePassword,
                            focNode: passwordFocusNode,
                            sIcon: IconButton(
                              icon: Icon(isSecurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isSecurePassword = !isSecurePassword;
                                });
                              },
                            ),
                            validate: (String? val) {
                              if (val!.isEmpty)
                                return 'please enter your password';
                              if (val.length < 5)
                                return 'Password is too short!';
                              return null;
                            },
                            hText: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            onSave: (String? val) {},
                            onCompleted: () {
                              //submit function
                            },
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 50))),
                          onPressed: () {},
                          child: Text('SIGN IN'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t Have Account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Register.route);
                                },
                                child: Text('Sign Up'))
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
