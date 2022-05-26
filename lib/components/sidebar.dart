import 'package:boomerang_pos/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final User? user;

  const Sidebar({
    Key? key,
    required this.user,
  })  :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user?.displayName ?? "",
              style: const TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              user?.email ?? "",
              style: const TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: limeGreen,
              child: user?.photoURL != null
                  ? ClipOval(
                      child: Image.network(
                        user?.photoURL ?? "",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Text(
                      '${user?.displayName} - ${user?.email}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                          ),
                    ),
            ),
            decoration: BoxDecoration(
              color: darkBlue,
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
    );
  }
}
