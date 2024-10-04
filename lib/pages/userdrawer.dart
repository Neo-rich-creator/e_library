import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/Acquisition.dart';
import 'package:naomi_elibrary/pages/User_Notifications.dart';
import 'package:naomi_elibrary/pages/catalog.dart';
import 'package:naomi_elibrary/pages/userdashboard.dart';
//import 'catalog.dart';
//import 'constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  get redAccent => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          _buildLogo(),
          const SizedBox(height: 30),

          // 1st option
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                   Icon(Icons.dashboard_customize),
                   SizedBox(width: 10.0),
                Text(
                  'User Dashboard',
                  style: TextStyle(
                    color:  Colors.redAccent,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserDashboardPage()),
              );
            },
          ),
          // 2nd option
          ListTile(
            title:  const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Icon(Icons.view_list),
                   SizedBox(width: 10.0),
                Text(
                  'Library Catalogue',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LibraryCataloguePage()),
              );
            },
          ),
          // 3rd option
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Icon(Icons.inventory),
                  SizedBox(width: 10.0),
                Text(
                  'Suggest Acquisition',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuggestForAcquisitionPage()),
              );
            },
          ),
          // 4th option
          ListTile(
            title:  const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Icon(Icons.notifications),
                  SizedBox(width: 10.0),
                Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
          // 5th option

        ],
      ),
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage('assets/nssf2.png'),
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color(0xFF3E2723);
