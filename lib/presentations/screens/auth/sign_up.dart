import 'package:chatterbox/astractions/color_gate.dart';
import 'package:chatterbox/config/colors.dart';
import 'package:chatterbox/config/styles.dart';
import 'package:chatterbox/config/text_styles.dart';
import 'package:chatterbox/presentations/screens/auth/sign_in.dart';
import 'package:chatterbox/presentations/widgets/button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
    final FocusNode _passwordFocusNode2 = FocusNode();
  String email = '';
  String password = '';
  String name = '';
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
                    bottomLeft: Radius.elliptical(
                        MediaQuery.of(context).size.width, 150),
                    bottomRight: Radius.elliptical(
                        MediaQuery.of(context).size.width, 150),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Welcome to ChatterBox",
                        style: smallHeading().copyWith(fontSize: 21),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Sign Up!",
                        style: heading(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Material(
                        shadowColor: THEME,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: MediaQuery.of(context).size.height / 2.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _nameController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please provide a name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    autofillHints: [AutofillHints.name],
                                    style: TextStyle(
                                        color: ColorGate(
                                      context: context,
                                    ).color),
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                      labelStyle: titleTextStyle.copyWith(
                                          color: ColorGate(
                                        context: context,
                                        defaultColor: THEME,
                                      ).color),
                                      hintText: "Enter your name",
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
                                    controller: _emailController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
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
                                    textInputAction: TextInputAction.next,
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
                                            _obscurePassword =
                                                !_obscurePassword),
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
                                  SizedBox(height: 30,),
                                     TextFormField(
                                    controller: _passwordController2,
                                    textInputAction: TextInputAction.go,
                                    focusNode: _passwordFocusNode2,
                                    onFieldSubmitted: (value) {},
                                    obscureText: _obscurePassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please provide a password.";
                                      }
                                      if(_passwordController != _passwordController2){
                                        return "Passowrds don't match";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: ColorGate(
                                      context: context,
                                    ).color),
                                    autofillHints: [AutofillHints.password],
                                    decoration: InputDecoration(
                                      labelText: "Confirm password",
                                      labelStyle: titleTextStyle.copyWith(
                                          color: ColorGate(
                                        context: context,
                                        defaultColor: THEME,
                                      ).color),
                                      hintText: "Confirm password",
                                      hintStyle: TextStyle(color: GREY),
                                      suffix: GestureDetector(
                                        onTap: () => setState(() =>
                                            _obscurePassword =
                                                !_obscurePassword),
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
                                    height: 50,
                                  ),
                                  Button(busy: _busy, "Sign up"),
                                ],
                              ),
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
                          .popAndPushNamed(SignInScreen.routeName),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account?",
                            style: normalText().copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorGate(
                                context: context,
                                defaultColor: BLACK,
                              ).color,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: " Click here",
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
