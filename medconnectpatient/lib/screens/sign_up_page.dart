import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../theme/constants.dart';
import 'home_pages.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _cinController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isChecked = false;

  GlobalKey<FormState> formkeySignUp = GlobalKey<FormState>();

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Image.asset(
            "assets/appbar_image.png",
            height: 40,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formkeySignUp,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Register now",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _nomController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Enter your first and last name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon:
                                    const Icon(Icons.person_outline_rounded),
                              ),
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Enter your e-mail address",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.email_outlined),
                              ),
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                      errorText:
                                          "* Please enter an e-mail address"),
                                  EmailValidator(
                                      errorText:
                                          "Please enter a valid e-mail address"),
                                ],
                              ).call,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _passwordController,
                              maxLines: 1,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                hintText: "Enter your password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                                MinLengthValidator(6,
                                    errorText:
                                        "Password must contain at least 6 characters"),
                                MaxLengthValidator(15,
                                    errorText:
                                        "The password must not contain more than 15 characters.")
                              ]).call,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _cinController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Enter your CIN",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.grid_3x3_outlined),
                              ),
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _phoneController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Enter your phone number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.phone_rounded),
                              ),
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headlineSmall!,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: "I agree with ",
                                ),
                                TextSpan(
                                  text: "Terms of use ",
                                  style: TextStyle(
                                    color: kBlueColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "and ",
                                ),
                                TextSpan(
                                  text: "Privacy policy ",
                                  style: TextStyle(
                                    color: kBlueColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "of medConnect.",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor:
                                _isChecked ? kBlueColor : kGreeyColor,
                          ),
                          onPressed: _isChecked
                              ? () async {
                                  if (formkeySignUp.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePages()),
                                    );
                                  }
                                }
                              : null,
                          child: Text(
                            "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall!,
                          //.copyWith(fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                              text: "Already registered ? ",
                            ),
                            TextSpan(
                              text: "Login here",
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          screenWidth > 600
              ? Expanded(
                  child: Container(
                    color: kGreeyColor,
                    child: Center(
                        child: SvgPicture.asset("assets/splash_image.svg")),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
