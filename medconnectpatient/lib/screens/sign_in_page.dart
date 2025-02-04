import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:medconnectpatient/screens/forguet_password_page.dart';
import '../theme/constants.dart';
import 'home_pages.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  GlobalKey<FormState> formkeySignIn = GlobalKey<FormState>();

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
          screenWidth > 600
              ? Expanded(
                  child: Container(
                    color: kGreeyColor,
                    child: Center(
                        child: SvgPicture.asset("assets/splash_image.svg")),
                  ),
                )
              : Container(),
          Expanded(
            child: Form(
              key: formkeySignIn,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: "Welcome to the ",
                                  ),
                                  TextSpan(
                                    text: " Patient\n",
                                    style: TextStyle(
                                      color: kBlueColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Application ",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
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
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForguetPasswordPage()),
                                  );
                                },
                                child: Text(
                                  "Forgot your password?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: kBlueColor,
                          ),
                          onPressed: () async {
                            if (formkeySignIn.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePages()),
                              );
                            }
                          },
                          child: Text(
                            "Sign In",
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
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall!,
                          children: const <TextSpan>[
                            TextSpan(
                              text: "Are you new here ? ",
                            ),
                            TextSpan(
                              text: "Subscribe here",
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
        ],
      ),
    );
  }
}
