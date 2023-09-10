import 'package:flutter/material.dart';
import 'package:wallie/utils/display_scaffold.dart';
import 'package:wallie/widgets/wallie.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: const Center(
              child: Wallie(),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: drawerListItemIcon(icon: Icons.settings_sharp),
            title: drawerListItemText(message: 'Settings'),
            onTap: () {
              Navigator.pop(context);
              DisplayScaffold(
                context: context,
                message: 'This feature will be added soon :)',
              );
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: drawerListItemIcon(icon: Icons.info_outline_rounded),
            title: drawerListItemText(message: 'About'),
            onTap: () {
              Navigator.pushNamed(context, "/about");
            },
          ),
          const Spacer(),
          const Text(
            'Made with ❤️ in India',
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget drawerListItemText({required String message}) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  Widget drawerListItemIcon({required IconData icon}) {
    return Icon(
      icon,
      color: Colors.black,
      size: 25,
    );
  }
}
