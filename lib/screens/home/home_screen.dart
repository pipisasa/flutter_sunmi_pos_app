import 'dart:async';

import 'package:boomerang_pos/components/order_cards_list.dart';
import 'package:boomerang_pos/components/section_title.dart';
import 'package:boomerang_pos/components/sidebar.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:boomerang_pos/screens/auth/signin_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuthService _authService = GetIt.I<FirebaseAuthService>();
  User? _user;
  StreamSubscription? _userSubscription;

  @override
  void initState() {
    super.initState();
    _userSubscription = _authService.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      } else {
        setState(() {
          _user = user;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(user: _user),
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
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              // Open Drawer
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              width: 25,
            ),
          );
        }),
        title: Text(
          'Wok Lagman',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 18,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/bell.svg',
              width: 25,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Главная',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
            ),
            const Text(
              'Выберите операцию',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: defaultPadding),
            const SectionTitle(),
            const OrderCardsList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Меню',
                  style: Theme.of(context).textTheme.headline6,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Показать все',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
