import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/appBar.dart';
import 'constants.dart';

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Personal Information'),
              _buildProfileDetail('Name', 'John Doe'),
              _buildProfileDetail('Email', 'john.doe@example.com'),
              _buildProfileDetail('Phone', '+123 456 7890'),
              const Divider(height: 40, color: chocolateColor),

              _buildSectionTitle('Account Details'),
              _buildProfileDetail('Account ID', '12345678'),
              _buildProfileDetail('Membership', 'Gold Member'),
              const Divider(height: 40, color: chocolateColor),

              _buildSectionTitle('Borrowing History'),
              _buildBorrowingHistory(),
              const Divider(height: 40, color: chocolateColor),

              _buildSectionTitle('Account Settings'),
              _buildSettingOption(
                context,
                icon: Icons.settings,
                title: 'Change Password',
                onTap: () {
                  // Handle Change Password
                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.lock,
                title: 'Privacy Settings',
                onTap: () {
                  // Handle Privacy Settings
                },
              ),
              const Divider(height: 40, color: chocolateColor),

              _buildSectionTitle('Reservations'),
              _buildReservationDetail('Reserved Book 1', 'Reservation Date: 01-09-2024'),
              _buildReservationDetail('Reserved Book 2', 'Reservation Date: 15-09-2024'),
              const Divider(height: 40, color: chocolateColor),

              _buildSectionTitle('Reading Preferences'),
              _buildSettingOption(
                context,
                icon: Icons.book,
                title: 'Preferred Genres',
                onTap: () {
                  // Handle Preferred Genres
                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.language,
                title: 'Language Preferences',
                onTap: () {
                  // Handle Language Preferences
                },
              ),
              const Divider(height: 40, color: chocolateColor),

              _buildSectionTitle('Notification Settings'),
              _buildSettingOption(
                context,
                icon: Icons.notifications,
                title: 'Email Notifications',
                onTap: () {
                  // Handle Email Notifications
                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.notifications_off,
                title: 'Push Notifications',
                onTap: () {
                  // Handle Push Notifications
                },
              ),
            ],
          ),
        ),
      ),
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

  Widget _buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: chocolateColor,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBorrowingHistory() {
    return Column(
      children: [
        _buildBorrowingItem('The Great Gatsby', 'Returned: 01-08-2024'),
        _buildBorrowingItem('1984', 'Returned: 15-08-2024'),
        _buildBorrowingItem('To Kill a Mockingbird', 'Returned: 30-08-2024'),
      ],
    );
  }

  Widget _buildBorrowingItem(String bookTitle, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.book, color: chocolateColor),
        title: Text(bookTitle, style: const TextStyle(fontSize: 16)),
        subtitle: Text(status, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: chocolateColor),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, color: chocolateColor),
      onTap: onTap,
    );
  }

  Widget _buildReservationDetail(String title, String date) {
    return ListTile(
      leading: const Icon(Icons.bookmark, color: chocolateColor),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(date, style: const TextStyle(color: Colors.grey)),
    );
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
