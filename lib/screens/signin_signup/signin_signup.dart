import 'package:flutter/material.dart';

import '../../constants.dart';

class SigninOrSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 146,
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                padding: EdgeInsets.all(kDefaultPadding * 0.75),
                color: kPrimaryColor,
                minWidth: double.infinity,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              MaterialButton(
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                padding: EdgeInsets.all(kDefaultPadding * 0.75),
                minWidth: double.infinity,
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
