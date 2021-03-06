import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_management_app/application_layer/components/get_user_id.dart';
import 'package:time_management_app/application_layer/components/google_sign_in.dart';
import 'package:time_management_app/application_layer/loading_screen.dart/loading_screen.dart';
import 'package:time_management_app/service_layer/auth.dart';
import 'package:time_management_app/shared/constants.dart';

class LoginScreen extends StatefulWidget {
  final Function toogleView;
  LoginScreen({this.toogleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = "";

  // text field state
  String email = "";
  String password = "";

  //FirebaseAuth

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return loading
        ? LoadingScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                "Great Tracker",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              // actions: <Widget>[
              //   FlatButton.icon(
              //     icon: Icon(Icons.person),
              //     label: Text("Register"),
              //     onPressed: () => widget.toogleView(),
              //   )
              // ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                            height: height / 3,
                            child: Image(
                              image: AssetImage("assets/login_background.png"),
                            )),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: kTextFormFieldStyle,
                          decoration: kLoginScreenTextInputDecoration.copyWith(
                              hintText: "Email"),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Empty";
                            } else if (!EmailValidator.validate(val)) {
                              return "Email is not valid";
                            }
                          },
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: kTextFormFieldStyle,
                          decoration: kLoginScreenTextInputDecoration.copyWith(
                              hintText: "Password"),
                          validator: (val) => val.length < 6
                              ? "Enter a password 6+ chars long"
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          obscureText: true,
                        ),
                      ),

                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                      CupertinoButton(
                        child: Container(
                            width: width / 3,
                            height: height / 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.indigoAccent),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ))),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);

                            if (result == null) {
                              print("$email and $password");
                              setState(() {
                                error =
                                    "could not sign in with those credentials.";
                                loading = false;
                              });
                            }
                            getUserID();
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                          onTap: () => widget.toogleView(),
                          child: Text("Don't you have an account ? Register")),
                      SizedBox(height: 10),
                      //Sign in with Google
                      CupertinoButton(
                        child: Container(
                            width: width / 1.7,
                            height: height / 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/google_logo.png'),
                                        fit: BoxFit.contain),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ))),
                        onPressed: () => signInWithGoogle(),
                      ),
                      //Sign in with Apple
                      // CupertinoButton(
                      //   child: Container(
                      //       width: width / 1.7,
                      //       height: height / 18,
                      //       margin: EdgeInsets.only(top: 10),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(20),
                      //           color: Colors.black),
                      //       child: Center(
                      //           child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Container(
                      //             height: 25.0,
                      //             width: 25.0,
                      //             decoration: BoxDecoration(
                      //               image: DecorationImage(
                      //                   image:
                      //                       AssetImage('assets/apple_logo.png'),
                      //                   fit: BoxFit.contain),
                      //               shape: BoxShape.circle,
                      //             ),
                      //           ),
                      //           SizedBox(width: 15,),
                      //           Text(
                      //             'Sign in with Apple',
                      //             style: TextStyle(
                      //                 fontSize: 16.0,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.white),
                      //           ),
                      //         ],
                      //       ))),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
