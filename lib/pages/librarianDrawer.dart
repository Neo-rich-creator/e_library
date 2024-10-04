import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/LIbrarian_Notifications.dart';
import 'package:naomi_elibrary/pages/Reports.dart';
import 'package:naomi_elibrary/pages/dashboard.dart';
import 'package:naomi_elibrary/pages/inventory.dart';
import 'UserLogin.dart';

class LibDrawerWidget extends StatelessWidget {
  const LibDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(10),
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
                  'Library Dashboard',
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
                    builder: (context) => const MyDashboardPage()),
              );
            },
          ),

          // 2nd option
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.add_shopping_cart_sharp),
                SizedBox(width: 10.0),
                Text(
                  'Inventory Management',
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
                    builder: (context) => const LibraryInventoryPage()),
              );
            },
          ),

          // 3rd option (Removed const keyword to avoid "Invalid Constant Value" error)
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.analytics_outlined),
                SizedBox(width: 10.0),
                Text(
                  'Reports & Analytics',
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
                    builder: (context) => const ReportsAnalyticsPage()),
              );
            },
          ),

          // 4th option
          ListTile(
            title: const Row(
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
                    builder: (context) => const LibrarianNotificationsPage()),
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
      radius: 75,
      backgroundImage: AssetImage('assets/nssf2.png'),
    );
  }
}

