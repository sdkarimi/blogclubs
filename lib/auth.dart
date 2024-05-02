import 'package:blogclubs/Home.dart';

import 'package:blogclubs/gen/assets.gen.dart';
import 'package:blogclubs/main.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signupTab = 1;
  static int selectedTab = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData temedata = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: temedata.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 18);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 32, top: 32),
                child: Assets.img.icons.logo.svg(width: 120)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: temedata.colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTab = loginTab;
                              });
                            },
                            child: Text(
                              "LOGIN",
                              style: tabTextStyle.apply(
                                  color: selectedTab == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTab = signupTab;
                              });
                            },
                            child: Text(
                              "SIGN UP",
                              style: tabTextStyle.apply(
                                  color: selectedTab == signupTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: temedata.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child: selectedTab == loginTab
                              ? _Login(temedata: temedata)
                              : _SignUp(temedata: temedata),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.temedata,
  });

  final ThemeData temedata;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameControl = TextEditingController();
    final TextEditingController passwordControl = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: temedata.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Sign in with your account",
          style: temedata.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: const InputDecoration(label: Text("Username")),
          controller: usernameControl,
        ),
        _passwordTextField(
          passwordControl: passwordControl,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(temedata.colorScheme.primary),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60))),
            onPressed: () {
              if (usernameControl.text.isNotEmpty &&
                  passwordControl.text.isNotEmpty) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ));
              }
            },
            child: Text("LOGIN",
                style: temedata.textTheme.titleLarge!
                    .copyWith(color: temedata.colorScheme.onPrimary))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot your password?"),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: const Text("Reset here"))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            "OR SIGN IN WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36)
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.temedata,
  });

  final ThemeData temedata;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameControl = TextEditingController();
    final TextEditingController passwordControl = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Blog Club",
          style: temedata.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Please enter your information",
          style: temedata.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: usernameControl,
          decoration: const InputDecoration(label: Text("Username")),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordControl,
          decoration: InputDecoration(label: Text("Password")),
        ),
        _passwordTextField(
          passwordControl: passwordControl,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(temedata.colorScheme.primary),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60))),
          onPressed: () {},
          child: Text("SIGN UP",
              style: temedata.textTheme.titleLarge!
                  .copyWith(color: temedata.colorScheme.onPrimary)),
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            "OR SIGN UP WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36)
          ],
        )
      ],
    );
  }
}

class _passwordTextField extends StatefulWidget {
  const _passwordTextField({
    super.key,
    required this.passwordControl,
  });

  final TextEditingController passwordControl;

  @override
  State<_passwordTextField> createState() => _passwordTextFieldState();
}

class _passwordTextFieldState extends State<_passwordTextField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordControl,
      enableSuggestions: false,
      autocorrect: false,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(
                obscureText ? "Show" : "Hide",
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.primary),
              )),
          label: const Text("Password")),
    );
  }
}
