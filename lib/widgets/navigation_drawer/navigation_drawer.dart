import 'package:flutter/material.dart';
import 'package:hr_relocation/routing/route_names.dart';
import 'package:hr_relocation/widgets/navigation_drawer/drawer_item.dart';
import 'package:hr_relocation/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:300,
      decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            color:Colors.black12, blurRadius: 16),
          
        ],
      ),
      child: Column(children: [
        NavigationDrawerHeader(),
        DrawerItem('Home', Icons.home,HomeRoute),
        DrawerItem('Episode',Icons.videocam,EpisodeRoute),
        DrawerItem('Profile',Icons.person,ProfileRoute),
        
      ],),
    );
  }
}