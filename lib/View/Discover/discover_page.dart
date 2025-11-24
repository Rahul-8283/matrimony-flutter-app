import 'package:bright_weddings/View/Profile/ProfileDetails/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/View/Dashboard/chat.dart';
import 'package:bright_weddings/View/Dashboard/dashboard_mob.dart';

import 'package:bright_weddings/View/Login/home.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _currentIndex = 2; 
  final List<Map<String, String>> profiles = [
    {
      "name": "Nandana",
      "bio":
          "I go crazy for beach vacations 🌊. I love long walks near the shore, sunsets, and peaceful moments by the sea.\n\n"
          "Apart from the beach, I’m a foodie and love trying out new cuisines. Cooking experiments at home are my stress-buster. "
          "Books are another big part of my life, especially novels and travel stories. Music is my daily therapy, and I enjoy "
          "singing whenever I get time.\n\n"
          "I believe in positivity, kindness, and building meaningful connections. Looking for someone who values family, "
          "respects individuality, and shares a love for adventure.\n\n"
          "Fun fact: I have a bucket list with over 50 destinations, and I’ve only completed 7 so far 😅.",
      "image": "assets/images/profile1.png",
    },
    {
      "name": "Arjun",
      "bio":
          "Adventure is my second name. Trekking, hiking, and exploring unexplored places give me a high 🏞️.\n\n"
          "Photography is my passion – nature, people, and candid shots are my favorite subjects. I also enjoy fitness and "
          "try to keep a balanced lifestyle with workouts and healthy food.\n\n"
          "Fun fact: I once did a 15-day Himalayan trek without network and it was the best detox ever 📵.",
      "image": "assets/images/profile2.png",
    },
    {
      "name": "Priya",
      "bio":
          "Bookworm 📚 and coffee lover ☕. You’ll often find me curled up with a novel or writing in my journal.\n\n"
          "I love cooking experimental dishes for my friends and family – food brings people together. "
          "Movies and music are my go-to relaxation, but I also enjoy weekend road trips whenever possible.\n\n"
          "Fun fact: I once read 10 books in a single week during college holidays 🤓.",
      "image": "assets/images/profile3.png",
    },
    {
      "name": "Rahul",
      "bio":
          "Tech geek 💻 and travel addict ✈️. By profession, I’m into software development, but outside work I love exploring "
          "new countries and cultures.\n\n"
          "I also like to spend time volunteering for social causes whenever possible.\n\n"
          "Fun fact: I once backpacked across 5 European countries in just 20 days 🎒.",
      "image": "assets/images/profile4.png",
    },
    {
      "name": "Sneha",
      "bio":
          "Creative soul 🎨 with a passion for painting, photography, and dance. I enjoy expressing myself through art "
          "and love visiting art galleries and cultural festivals.\n\n"
          "Fun fact: I once painted a mural that ended up being featured in a local magazine 🖌️.",
      "image": "assets/images/profile5.png",
    },
  ];

  int currentIndex = 0;

  void _nextProfile({required bool liked}) {
    final profile = profiles[currentIndex];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          liked ? "You liked ${profile['name']}" : "You skipped ${profile['name']}",
          style: TextStyle(fontSize: 16),
        ),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: liked ? Colors.green : Colors.red,
      ),
    );

    setState(() {
      if (currentIndex < profiles.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = profiles[currentIndex];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Discover Matches"),
        centerTitle: true,
        backgroundColor: Color(0xFFE8C468),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile card with rounded corners + shadow
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    Image.asset(
                      profile["image"]!,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black54,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        profile["name"]!,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 6,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Like/Dislike buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: "dislike",
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, size: 32),
                    onPressed: () => _nextProfile(liked: false),
                  ),
                  FloatingActionButton(
                    heroTag: "like",
                    backgroundColor: Colors.green,
                    child: Icon(Icons.favorite, size: 32),
                    onPressed: () => _nextProfile(liked: true),
                  ),
                ],
              ),
            ),

            // Bio card with rounded edges
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile["name"]!,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    profile["bio"]!,
                    style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                  ),
                ],
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
              Get.off(() => DiscoverPage()); // Replace with your Matches screen
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
            Colors.redAccent, // Set the color for the selected item
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
}
