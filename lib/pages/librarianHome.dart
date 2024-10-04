/*import 'package:flutter/material.dart';
import 'librarianDrawer.dart';
import 'constants.dart';
import 'appBar.dart';

class LibHomePage extends StatelessWidget {
  const LibHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const LibDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Transform.translate(
              offset: const Offset(0, -20),
              child: const Card(
                color: Colors.amber,
                child: SizedBox(
                  height: 30,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildStats(),
            const SizedBox(height: 20),
            _buildLog(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
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
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 75,
      backgroundImage: AssetImage('assets/nssf.png'),
    );
  }

  Widget _buildStats() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(paddingSize),
        child: Row(
          children: [
            _buildStatCard('Total Resources', '200', Icons.book_sharp),
            _buildStatCard('Active Users', '49', Icons.supervised_user_circle),
            _buildStatCard('Acquisitions', '20', Icons.book_sharp),
            _buildStatCard('Most accessed', '50', Icons.book_sharp),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Row(
      children: [
        const SizedBox(
          width: 7.5,
        ),
        SizedBox(
          width: 165,
          child: Card(
            elevation: 10,
            shadowColor: chocolateColor,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                    color: chocolateColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: chocolateColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 7.5),
      ],
    );
  }

  Widget _buildLog() {
    return Padding(
      padding: const EdgeInsets.all(paddingSize),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Library Log',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recent Entries',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2, color: chocolateColor),
              _buildLogEntry('Entry One', 'User 01 has Requested acquisition'),
              _buildLogEntry('Entry Two', 'User 01 has Requested deletion'),
              _buildLogEntry(
                  'Entry Three', 'User 01 has completed acquisition'),
              _buildLogEntry('Entry Four', 'User 02 has Requested acquisition'),
              _buildLogEntry('Entry Four', 'User 02 has Requested acquisition'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogEntry(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);

 */

import 'package:flutter/material.dart';
import 'librarianDrawer.dart';
import 'constants.dart';
import 'appBar.dart';

class LibHomePage extends StatelessWidget {
  const LibHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const LibDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Transform.translate(
              offset: const Offset(0, -20),
              child: const Card(
                color: Colors.amber,
                child: SizedBox(
                  height: 30,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildStats(),
            const SizedBox(height: 20),
            _buildLog(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
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
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 75,
      backgroundImage: AssetImage('assets/nssf.png'),
    );
  }

  Widget _buildStats() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(paddingSize),
        child: Row(
          children: [
            _buildStatCard('Total Resources', '200', Icons.book_sharp),
            _buildStatCard('Active Users', '49', Icons.supervised_user_circle),
            _buildStatCard('Acquisitions', '20', Icons.book_sharp),
            _buildStatCard('Most accessed', '50', Icons.book_sharp),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Row(
      children: [
        const SizedBox(
          width: 7.5,
        ),
        SizedBox(
          width: 165,
          child: Card(
            elevation: 10,
            shadowColor: chocolateColor,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                    color: chocolateColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: chocolateColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 7.5),
      ],
    );
  }

  Widget _buildLog() {
    return Padding(
      padding: const EdgeInsets.all(paddingSize),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Library Log',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recent Actions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2, color: chocolateColor),
              _buildLogEntry('New Acquisition', 'A new resource has been added'),
              _buildLogEntry('Resource Removal', 'A resource has been removed'),
              _buildLogEntry('Inventory Update', 'Inventory updated successfully'),
              _buildLogEntry('Request Processed', 'A request was completed'),
              _buildLogEntry('System Update', 'Library system was updated'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogEntry(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);




