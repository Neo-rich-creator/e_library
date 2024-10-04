import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/Supportdesk.dart';
import 'constants.dart';
import 'documentCards.dart';
import 'appBar.dart';
import 'userdrawer.dart';
import 'userFooter.dart';
//import 'supportDeskPage.dart'; // Import the Support Desk Page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15.0),
                const Text(
                  'Browse For Documents',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: chocolateColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_circle_down_outlined,
                    size: 34.0,
                    color: chocolateColor,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(paddingSize),
              child: const AnimatedDocumentCardList(
                cards: [
                  DocumentCard(
                    assetImage: 'assets/barron.jpeg',
                    title: 'Barron',
                    author: 'John Doe',
                  ),
                  DocumentCard(
                    assetImage: 'assets/boys.jpeg',
                    title: 'Boys',
                    author: 'Jane Smith',
                  ),
                  DocumentCard(
                    assetImage: 'assets/finance.jpeg',
                    title: 'Finance',
                    author: 'Michael Johnson',
                  ),
                  DocumentCard(
                    assetImage: 'assets/flicker.jpeg',
                    title: 'Flicker',
                    author: 'Emily Davis',
                  ),
                  DocumentCard(
                    assetImage: 'assets/img1.jpeg',
                    title: 'Image 1',
                    author: 'David Green',
                  ),
                  DocumentCard(
                    assetImage: 'assets/img2.jpeg',
                    title: 'Image 2',
                    author: 'Sophia Lee',
                  ),
                  DocumentCard(
                    assetImage: 'assets/img3.jpeg',
                    title: 'Image 3',
                    author: 'Liam Brown',
                  ),
                  DocumentCard(
                    assetImage: 'assets/img4.jpeg',
                    title: 'Image 4',
                    author: 'Olivia Martinez',
                  ),
                  DocumentCard(
                    assetImage: 'assets/eco.jpeg',
                    title: 'Eco',
                    author: 'Ava Wilson',
                  ),
                  DocumentCard(
                    assetImage: 'assets/come.jpeg',
                    title: 'Come',
                    author: 'Ethan Moore',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSupportIcon(context), // Add support desk navigation icon
          ],
        ),
      ),
      bottomNavigationBar: const UserFooter(),
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 75,
      backgroundImage: AssetImage('assets/nssf.png'),
    );
  }

  Widget _buildSupportIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: chocolateColor, // Set the button color
            ),
            icon: const Icon(Icons.support_agent, size: 28, color: Colors.white),
            label: const Text(
              'Go to Support Desk',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigate to the Support Desk page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SupportDeskPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedDocumentCardList extends StatelessWidget {
  final List<DocumentCard> cards;

  const AnimatedDocumentCardList({required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Allows GridView to take the required height
      physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
      itemCount: cards.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two cards per row
        childAspectRatio: 0.7, // Adjusts card height
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1), // Animation duration
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: cards[index],
        );
      },
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
