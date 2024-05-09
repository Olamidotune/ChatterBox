import 'package:chatterbox/astractions/color_gate.dart';
import 'package:chatterbox/config/colors.dart';
import 'package:chatterbox/config/styles.dart';
import 'package:chatterbox/config/text_styles.dart';
import 'package:chatterbox/presentations/screens/auth/sign_up.dart';
import 'package:chatterbox/presentations/widgets/button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "sign_in";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  String email = '';
  String password = '';
  bool _obscurePassword = true;

  final bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [THEME, THEME_2],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.elliptical(MediaQuery.of(context).size.width, 150),
                    bottomRight:
                        Radius.elliptical(MediaQuery.of(context).size.width, 150),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Hi there!",
                        style: smallHeading().copyWith(fontSize: 21),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Sign In!",
                        style: heading(),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Material(
                        shadowColor: THEME,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          height: MediaQuery.of(context).size.height / 2.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (EmailValidator.validate(
                                        value?.trim() ?? "")) {
                                      return null;
                                    }
                                    return "Please provide a valid email address";
                                  },
                                  autofillHints: [AutofillHints.email],
                                  style: TextStyle(
                                      color: ColorGate(
                                    context: context,
                                  ).color),
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: titleTextStyle.copyWith(
                                        color: ColorGate(
                                      context: context,
                                      defaultColor: THEME,
                                    ).color),
                                    hintText: "Enter your email",
                                    hintStyle: TextStyle(color: GREY),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                          color: ColorGate(
                                        context: context,
                                        defaultColor: THEME,
                                      ).color!),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.go,
                                  focusNode: _passwordFocusNode,
                                  onFieldSubmitted: (value) {},
                                  obscureText: _obscurePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please provide a password.";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: ColorGate(
                                    context: context,
                                  ).color),
                                  autofillHints: [AutofillHints.password],
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: titleTextStyle.copyWith(
                                        color: ColorGate(
                                      context: context,
                                      defaultColor: THEME,
                                    ).color),
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(color: GREY),
                                    suffix: GestureDetector(
                                      onTap: () => setState(() =>
                                          _obscurePassword = !_obscurePassword),
                                      child: Icon(
                                        _obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: GREY,
                                        size: 17,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                          color: ColorGate(
                                        context: context,
                                        defaultColor: THEME,
                                      ).color!),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Forgot password?",
                                        style: normalText().copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                                SizedBox(
                                  height: 50,
                                ),
                                Button(busy: _busy, "Sign in"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .popAndPushNamed(SignUpScreen.routeName),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: normalText().copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorGate(
                                context: context,
                                defaultColor: BLACK,
                              ).color,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: "Click here",
                                style: TextStyle(
                                  color: ColorGate(
                                    context: context,
                                    defaultColor: THEME,
                                  ).color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
