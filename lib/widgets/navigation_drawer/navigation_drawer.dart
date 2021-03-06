import 'package:flutter/material.dart';
import 'package:hr_relocation/routing/route_names.dart';
import 'package:hr_relocation/screens/sign_in_screen.dart';
import 'package:hr_relocation/widgets/navigation_drawer/drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: [
          DrawerItem('Home', Icons.home, HomeRoute),
          DrawerItem(
              currentUser.uid == hrUid || currentUser.uid == hmUid
                  ? 'Waiting Approve'
                  : 'MyPost',
              Icons.person,
              ProfileRoute),
              DrawerItem('Account', Icons.vpn_key_sharp, AccountSettingRoute),
        ],
      ),
    );
  }
}