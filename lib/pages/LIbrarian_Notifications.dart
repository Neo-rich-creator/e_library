import 'package:flutter/material.dart';
import 'constants.dart';
import 'appBar.dart';
import 'librarianDrawer.dart'; // Assume a librarian-specific drawer
//import 'librarianFooter.dart'; // Assume a librarian-specific footer

class LibrarianNotificationsPage extends StatelessWidget {
  const LibrarianNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const LibDrawerWidget(), // Assuming a specific drawer for the librarian
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: appBarHeight,
              width: double.infinity,
              padding: const EdgeInsets.all(paddingSize),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  const SizedBox(height: 20),
                  const Text(
                    'Librarian Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: chocolateColor,
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Overdue Book Alerts'),
                    _buildNotificationCard(
                      icon: Icons.warning_amber,
                      title: 'Overdue Book Alert',
                      description:
                      'The book "The Great Gatsby" is overdue. Please follow up with the user to ensure it is returned.',
                      onTap: () {
                        // Handle overdue alert
                      },
                    ),
                    _buildSectionTitle('User Requests'),
                    _buildNotificationCard(
                      icon: Icons.library_books,
                      title: 'Book Reservation Request',
                      description:
                      'User has requested to reserve "Pride and Prejudice". Please approve or decline the reservation.',
                      onTap: () {
                        // Handle book reservation action
                      },
                    ),
                    _buildNotificationCard(
                      icon: Icons.update,
                      title: 'Book Renewal Request',
                      description:
                      'User has requested to renew "The Catcher in the Rye". Please approve or decline the renewal.',
                      onTap: () {
                        // Handle renewal request action
                      },
                    ),
                    _buildNotificationCard(
                      icon: Icons.person_add_alt_1,
                      title: 'New Membership Application',
                      description:
                      'A new membership application has been submitted. Please review the application and follow up with the user.',
                      onTap: () {
                        // Handle new membership application
                      },
                    ),
                    _buildSectionTitle('Inventory Alerts'),
                    _buildNotificationCard(
                      icon: Icons.inventory,
                      title: 'Low Stock Alert',
                      description:
                      'The book "To Kill a Mockingbird" is running low on stock. Please consider ordering more copies.',
                      onTap: () {
                        // Handle low stock action
                      },
                    ),
                    _buildNotificationCard(
                      icon: Icons.error_outline,
                      title: 'Missing Item Alert',
                      description:
                      'The book "1984" is missing from the inventory. Please investigate the issue.',
                      onTap: () {
                        // Handle missing item action
                      },
                    ),
                    _buildSectionTitle('User Feedback'),
                    _buildNotificationCard(
                      icon: Icons.feedback,
                      title: 'New User Feedback',
                      description:
                      'A user has submitted feedback regarding the new arrivals section. Please review the feedback and take appropriate actions.',
                      onTap: () {
                        // Handle feedback action
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
     // bottomNavigationBar: const LibrarianFooter(), // Assuming a librarian-specific footer
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('assets/nssf.png'),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: chocolateColor,
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap, // Added onTap to handle the card tap
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, color: chocolateColor),
          onPressed: onTap, // Pass onTap to handle card press action
        ),
      ),
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
