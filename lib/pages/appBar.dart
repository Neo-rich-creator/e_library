import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/Perosonalinfo.dart';
import 'package:naomi_elibrary/pages/UserLogin.dart';
import 'constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 35.0,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const Text('Personal Information'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonalInformationPage()),
                );
              },
            ),

            PopupMenuItem(
              child: const Text('Logout'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Logout Confirmation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2.0,
                          color: chocolateColor,
                        ),
                      ),
                      content: const Text(
                        'Are you sure you want to logout?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.0,
                          color: chocolateColor,
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
      title: const Center(
        child: Text(
          'E-LIBRARY',
          style: TextStyle(
              letterSpacing: 2.0, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      foregroundColor: chocolateColor,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);

