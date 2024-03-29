import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:flutter/material.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user.image,
              ),
            ),
            accountName: Text(user.firstName),
            accountEmail: Text(user.email),
          )
        ],
      ),
    );
  }
}
