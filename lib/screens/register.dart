import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/components.dart';
import 'package:flutter_auth_ui/screens/login.dart';

class Register extends StatefulWidget {
  static final String route = '/Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;
  String? phone;
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmFocusNode = FocusNode();
  bool isSecurePassword = false;
  bool isSecureConfPassword = false;

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
                height: 15,
              ),
              Text(
                'Sign up and we will continue',
                style: TextStyle(fontSize: 18),
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 80, right: 15, left: 15),
                    child: Column(
                      children: [
                        Container(
                          child: DefaultTextField(
                            validate: (String? val) {
                              if (val!.isEmpty) return 'please enter your name';
                              return null;
                            },
                            onCompleted: () {
                              FocusScope.of(context)
                                  .requestFocus(emailFocusNode);
                            },
                            hText: 'Name',
                            textInputType: TextInputType.name,
                            onSave: (String? val) {
                              name = val;
                            },
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
                            focNode: emailFocusNode,
                            hText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            onSave: (String? val) {
                              email = val;
                            },
                            onCompleted: () {
                              FocusScope.of(context)
                                  .requestFocus(phoneFocusNode);
                            },
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: DefaultTextField(
                            validate: (String? val) {
                              if (val!.isEmpty)
                                return 'please enter your phone';
                              return null;
                            },
                            focNode: phoneFocusNode,
                            hText: 'Phone',
                            textInputType: TextInputType.phone,
                            onSave: (String? val) {
                              phone = val;
                            },
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
                          height: 15,
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
                            onSave: (String? val) {
                              password = val;
                            },
                            onCompleted: () {
                              FocusScope.of(context)
                                  .requestFocus(confirmFocusNode);
                            },
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: DefaultTextField(
                            focNode: confirmFocusNode,
                            sIcon: IconButton(
                              icon: Icon(isSecureConfPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isSecureConfPassword = !isSecureConfPassword;
                                });
                              },
                            ),
                            secureText: isSecureConfPassword,
                            validate: (String? val) {
                              if (val != password) {
                                return 'Password do not match!';
                              }
                              return null;
                            },
                            hText: 'Confirm Password',
                            textInputType: TextInputType.visiblePassword,
                            onSave: (String? val) {},
                            onCompleted: () {
                              //submit Function
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
                          child: Text('SING UP'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Do You Have Account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Login.route);
                                },
                                child: Text('Sign in'))
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
