import 'package:flutter/material.dart';
import '../../theme/constants.dart';
import '../sign_in_page.dart';

class NavProfilePage extends StatefulWidget {
  const NavProfilePage({super.key});

  @override
  State<NavProfilePage> createState() => _NavProfilePageState();
}

class _NavProfilePageState extends State<NavProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Donna Troy",
                        style: Theme.of(context).textTheme.headlineSmall!,
                        //.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/photo_doctor_image.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Spacer(),
            SizedBox(
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: Text(
                  "Settings and privacy",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  "Disconnect",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
