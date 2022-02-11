import 'package:boomerang_pos/constants.dart';
import 'package:boomerang_pos/screens/auth/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInScreen()));
      } else {
        _user = user;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  _user?.displayName ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  _user?.email ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: _user?.photoURL != null
                      ? ClipOval(
                          child: Image.network(
                            _user?.photoURL ?? "",
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Text(_user?.displayName?.substring(0, 1) ?? ""),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: const NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.dstATop),
                  ),
                ),
              ),
              //Logout
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                title: const Text(
                  "Выйти",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Заказы',
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
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Container(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: const OrderItemCard(),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Container(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: const OrderItemCard(),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Container(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: const OrderItemCard(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
        ));
  }
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRaius),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: const Offset(1, 3),
              blurRadius: 4)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#123',
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF96F321),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Доставлен',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          const Text('Адрес: Манаса 9/4'),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('2022/01/08 14:30'),
              Text('250c', style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          )
        ],
      ),
    );
  }
}
