import 'package:flutter/material.dart';
import 'constants.dart';
import 'appBar.dart';
import 'userdrawer.dart';
import 'userFooter.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const DrawerWidget(),
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
                    'Notifications',
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
                    _buildSectionTitle('Due Date Reminders'),
                    _buildNotificationCard(
                      icon: Icons.calendar_today,
                      title: 'Your borrowed book is due soon!',
                      description:
                      'The book "The Modern Mind" is due on 5th September 2024. Please return it on time to avoid any fines.',
                      onTap: () {
                        // Handle due date reminder action
                      },
                    ),
                    _buildSectionTitle('Overdue Notices'),
                    _buildNotificationCard(
                      icon: Icons.warning,
                      title: 'Overdue Book Notice',
                      description:
                      'The book "Economics One Lesson" is overdue. Please return it as soon as possible to avoid further fines.',
                      onTap: () {
                        // Handle overdue book action
                      },
                    ),
                    _buildSectionTitle('New Arrivals'),
                    _buildNotificationCard(
                      icon: Icons.new_releases,
                      title: 'New Books Available!',
                      description:
                      'New books have arrived in the "Fiction" category. Check out the latest titles and start reading today!',
                      onTap: () {
                        // Navigate to the New Arrivals page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewArrivalsPage(),
                          ),
                        );
                      },
                    ),
                    _buildSectionTitle('Account Updates'),
                    _buildNotificationCard(
                      icon: Icons.account_circle,
                      title: 'Account Information Updated',
                      description:
                      'Your account details have been successfully updated. Review your account information to ensure everything is correct.',
                      onTap: () {
                        // Navigate to Account Info page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountInfoPage(),
                          ),
                        );
                      },
                    ),
                    _buildSectionTitle('Personalized Recommendations'),
                    _buildNotificationCard(
                      icon: Icons.thumb_up,
                      title: 'Books You May Like',
                      description:
                      'Based on your reading history, we recommend these titles: "The Power of Now", "Sapiens", "Atomic Habits", "The Alchemist", and "Educated". Explore these today!',
                      onTap: () {
                        // Navigate to Personalized Recommendations page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const PersonalizedRecommendationsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar:  const UserFooter(),
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

// Dummy NewArrivalsPage class with 5 new books
class NewArrivalsPage extends StatelessWidget {
  const NewArrivalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Arrivals")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ListTile(
            leading: Icon(Icons.book),
            title: Text("The Silent Patient"),
            subtitle: Text("By Alex Michaelides"),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Where the Crawdads Sing"),
            subtitle: Text("By Delia Owens"),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("The Midnight Library"),
            subtitle: Text("By Matt Haig"),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("The Vanishing Half"),
            subtitle: Text("By Brit Bennett"),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Klara and the Sun"),
            subtitle: Text("By Kazuo Ishiguro"),
          ),
        ],
      ),
    );
  }
}

// Dummy AccountInfoPage class
class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Information")),
      body: const Center(child: Text("User Account Information")),
    );
  }
}

// Dummy PersonalizedRecommendationsPage class with 5 book recommendations
class PersonalizedRecommendationsPage extends StatelessWidget {
  const PersonalizedRecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recommended Books")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("The Power of Now"),
            subtitle: Text("By Eckhart Tolle"),
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("Sapiens"),
            subtitle: Text("By Yuval Noah Harari"),
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("Atomic Habits"),
            subtitle: Text("By James Clear"),
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("The Alchemist"),
            subtitle: Text("By Paulo Coelho"),
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("Educated"),
            subtitle: Text("By Tara Westover"),
          ),
        ],
      ),
    );
  }
}
