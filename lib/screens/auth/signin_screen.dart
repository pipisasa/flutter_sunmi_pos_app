import 'dart:async';

import 'package:boomerang_pos/components/sign_in_form.dart';
import 'package:boomerang_pos/components/text_field_container.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuthService _firebaseAuthService =
      GetIt.I<FirebaseAuthService>();
  StreamSubscription? _userSubscription;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _userSubscription = _firebaseAuthService.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userSubscription?.cancel();
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _loading = true;
    });
    User? user = await _firebaseAuthService.signInWithGoogle();
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      return;
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _signInWithEmailAndPassword(
      String email, String password) async {
    setState(() {
      _loading = true;
    });
    User? user = await _firebaseAuthService.signInWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      return;
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Loader
    if (_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Добро пожаловать',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 18,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding, 0, defaultPadding, defaultPadding),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Image.asset(
                  'assets/images/login.png',
                  width: double.infinity,
                ),
              ),
              Text('Войдите в свой аккаунт',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 24,
                      )),
              const SizedBox(height: defaultPadding),
              SignInForm(
                onSubmit: _signInWithEmailAndPassword,
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                'Или',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: defaultPadding / 2),
              TextFieldContainer(
                child: TextButton(
                  child: Text(
                    'Войти через Google',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: darkBlue.shade500, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _signInWithGoogle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
