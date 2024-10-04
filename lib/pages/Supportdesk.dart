import 'package:flutter/material.dart';
import 'constants.dart';

class SupportDeskPage extends StatelessWidget {
  const SupportDeskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Support Desk',
          style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: chocolateColor, // chocolate color
        ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support Desk',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: chocolateColor,
              ),
            ),
            const SizedBox(height: 10),
            _buildSupportOption(
              icon: Icons.email_outlined,
              title: 'Email Support',
              description: 'For any inquiries, please reach us at support@gmail.com',
              onTap: () {
                // Handle email support action
              },
            ),
            const SizedBox(height: 10),
            _buildSupportOption(
              icon: Icons.phone_outlined,
              title: 'Phone Support',
              description: 'Call us directly at +255 758 105 575 for immediate assistance.',
              onTap: () {
                // Handle phone support action
              },
            ),
            const SizedBox(height: 10),
            _buildSupportOption(
              icon: Icons.chat_outlined,
              title: 'Real-time Support',
              description: 'Chat with our support agents in real-time for instant help.',
              onTap: () {
                // Handle real-time support chat action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
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
          onPressed: onTap, // Handle the support option action
        ),
      ),
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
