import 'dart:async';

import 'package:boomerang_pos/components/sign_in_form.dart';
import 'package:boomerang_pos/components/text_field_container.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rive/rive.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuthService _authService = GetIt.I<FirebaseAuthService>();
  late StreamSubscription _userSubscription;

  SMIInput<bool>? _isTeddyHandsUp;
  SMIInput<bool>? _isTeddyLooking;
  SMIInput<bool>? _isTeddyHappy;
  SMIInput<bool>? _isTeddySad;
  SMIInput<double>? _teddyLookingDirection;

  Artboard? _teddyArtboard;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _userSubscription = _authService.onAuthStateChanged.listen((user) {
      if (user != null) {
        _happyTeddy();
        // delay 1 second and then navigate to home screen
        Future.delayed(const Duration(seconds: 4)).then((_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        });
      }
    });

    rootBundle.load('assets/animations/teddy.riv').then((value) {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      var teddyController = StateMachineController.fromArtboard(
        artboard,
        'State Machine 1',
      );
      if (teddyController != null) {
        artboard.addController(teddyController);
        _isTeddyHandsUp = teddyController.findInput<bool>('hands_up');
        _isTeddyLooking = teddyController.findInput<bool>('Check');
        _isTeddyHappy = teddyController.findInput<bool>('success');
        _isTeddySad = teddyController.findInput<bool>('fail');
        _teddyLookingDirection = teddyController.findInput<double>('Look');
      }
      setState(() {
        _teddyArtboard = artboard;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userSubscription.cancel();
  }

  Future<void> _signInWithGoogle() async {
    // setState(() {
    //   _loading = true;
    // });
    User? user = await _authService.signInWithGoogle();
    if (user != null) return;
    // setState(() {
    //   _loading = false;
    // });
  }

  Future<void> _signInWithEmailAndPassword(
      String email, String password) async {
    // setState(() {
    //   _loading = true;
    // });
    User? user = await _authService.signInWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) return;
    // Alert with error message
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Ошибка'),
              content: const Text(
                  'Вы ввели неправильный пароль или email.\n\nПопробуйте еще раз.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Продолжить'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
    _sadTeddy();
    // setState(() {
    //   _loading = false;
    // });
  }

  void _downTeddysHands() {
    _isTeddyHandsUp?.change(false);
  }

  void _upTeddysHands() {
    _isTeddyHandsUp?.change(true);
  }

  void _onEmailChange(String email) {
    _isTeddyLooking?.change(email.isNotEmpty);
    _teddyLookingDirection?.change(email.length / 30 * 100);
  }

  void _sadTeddy() {
    _isTeddySad?.change(true);
  }

  void _happyTeddy() {
    _isTeddyHappy?.change(true);
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
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.black,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
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
                // child: Image.asset(
                //   'assets/images/login.png',
                //   width: double.infinity,
                // ),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    child: ClipOval(
                      child: _teddyArtboard == null
                          ? Container()
                          : Rive(
                              artboard: _teddyArtboard!,
                              fit: BoxFit.fitHeight,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Text('Войдите в свой аккаунт',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 24,
                      )),
              const SizedBox(height: defaultPadding),
              SignInForm(
                onSubmit: _signInWithEmailAndPassword,
                onEmailInputEnd: () {
                  _isTeddyLooking?.change(false);
                },
                onPasswordInputStart: _upTeddysHands,
                onPasswordInputEnd: _downTeddysHands,
                onEmailChange: _onEmailChange,
                onFail: _sadTeddy,
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
