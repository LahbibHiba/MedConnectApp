import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../theme/constants.dart';

class ForguetPasswordPage extends StatefulWidget {
  const ForguetPasswordPage({super.key});

  @override
  State<ForguetPasswordPage> createState() => _ForguetPasswordPageState();
}

class _ForguetPasswordPageState extends State<ForguetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> formkeyForguetPassword = GlobalKey<FormState>();

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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Form(
                key: formkeyForguetPassword,
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
                                      text: "Forguet your",
                                    ),
                                    TextSpan(
                                      text: " password",
                                      style: TextStyle(
                                        color: kBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Password reset",
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
                              if (formkeyForguetPassword.currentState!
                                  .validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'The password has been sent to your email.')),
                                );
                              }
                            },
                            child: Text(
                              "Send",
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
