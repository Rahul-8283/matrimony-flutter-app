import 'package:bright_weddings/View/Dashboard/chat.dart';
import 'package:bright_weddings/View/Dashboard/dashboard_mob.dart';

import 'package:bright_weddings/View/Login/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import the EditProfileForm

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  int _currentIndex = 3; // Start with Profile screen as the default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Color(0xFFE8C468),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile avatar with edit button
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/images/loginCouple.png',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE8C468),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            const Text(
              "Kisuke",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "kisuke@gmail.com",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),

            // Contact Info
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFFE8C468)),
                title: const Text("9876543210"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Color(0xFFE8C468),
                ),
                title: const Text("Bangalore, India"),
              ),
            ),
            const SizedBox(height: 20),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard("Connected", "07"),
                _buildStatCard("Likes", "18"),
              ],
            ),
            const SizedBox(height: 20),

            // Settings + Logout
            Card(
              child: ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFFE8C468)),
                title: const Text("Settings"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Color(0xFFE8C468)),
                title: const Text("Logout"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginHome(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Track the selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          // Use Get.to() for navigation
          switch (index) {
            case 0: // Home
              Get.off(() =>
                  DashboardMob()); // Use Get.off to remove the current page from the stack
              break;
            case 1: // Matches
              Get.off(() = ()); // Replace with your Matches screen
              break;
            case 2: // New Button
              Get.off(() => Chat()); // Replace with your NewScreen
              break;
            case 3: // Profile
              Get.off(() => ProfileDetails()); // Navigates to ProfileDetails
              break;
          }
        },
        selectedItemColor:
            Color(0xFFE8C468), // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined), // New button
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      elevation: 2,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
