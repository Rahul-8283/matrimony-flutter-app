import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/View/Discover/discover_page.dart';
import 'package:bright_weddings/View/Profile/ProfileDetails/profile_details.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'profile',
      home: ChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  int _currentIndex = 0; // Track the index of the selected item
  final List<Map<String, dynamic>> groups = [
    {
      "title": "group1",
      "time": "23 min ago",
      "members": 320,
      "highlight": true,
    },
    {
      "title": "group2",
      "time": "12 min ago",
      "members": 180,
      "highlight": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Messages"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
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
              // Already on home, no need to navigate
              break;
            case 1: // Matches
              Get.to(() => DiscoverPage()); // 👈 Add this
              break;
            case 2: // Messages
              Get.to(() => Chat());
              break;
            case 3: // Profile
              Get.to(() => ProfileDetails());
              break;
            case 4: // Discover
              Get.to(() => DiscoverPage());
              break;
          }
        },
        selectedItemColor:
            Colors.redAccent, // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
        type: BottomNavigationBarType.fixed, // This allows more than 3 items
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
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Conversation Section
            Text(
              "Conversation",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/avatar.png"),
              ),
              title: Text("Seb"),
              subtitle:
                  Text("That’s wonderful. I feel the same way as well. 😊"),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatDetailScreen()),
                );
              },
            ),
            SizedBox(height: 10),

            //

            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/avatar.png"),
              ),
              title: Text("Seb"),
              subtitle:
                  Text("That’s wonderful. I feel the same way as well. 😊"),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatDetailScreen()),
                );
              },
            ),
            SizedBox(height: 10),

            //

            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/avatar.png"),
              ),
              title: Text("Seb"),
              subtitle:
                  Text("That’s wonderful. I feel the same way as well. 😊"),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xFFE8C468),
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatDetailScreen()),
                );
              },
            ),
            SizedBox(height: 20),

            /// Groups Section
            Text(
              "community groups",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            SizedBox(height: 9),
            Expanded(
              child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  var group = groups[index];
                  return Card(
                    color: group["highlight"] ? Colors.blue[50] : Colors.white,
                    child: ListTile(
                      title: Text(
                        group["title"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: group["highlight"]
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(group["time"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.group, size: 28),
                          SizedBox(width: 9),
                          Text("${group["members"]}+"),
                          if (group["highlight"])
                            Icon(Icons.star, color: Colors.amber, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// --------------------
/// Chat Detail Page
/// --------------------
class ChatDetailScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      "isMe": false,
      "text": "Hi, I saw your profile on the matrimony app. How are you?",
      "time": "09:30",
    },
    {
      "isMe": true,
      "text": "Hello! I'm doing good, thank you. How about you?",
      "time": "09:32",
    },
    {
      "isMe": false,
      "text":
          "I’m good too. I noticed we share similar interests in travel and cooking.",
      "time": "09:35",
    },
    {
      "isMe": true,
      "text":
          "Yes, I enjoy exploring new places and trying new recipes. That’s great!",
      "time": "09:37",
    },
    {
      "isMe": false,
      "text": "What are you looking for in a life partner?",
      "time": "09:40",
    },
    {
      "isMe": true,
      "text":
          "I value honesty, mutual respect, and someone who shares family values.",
      "time": "09:42",
    },
    {
      "isMe": false,
      "text": "That’s wonderful. I feel the same way as well. 😊",
      "time": "09:45",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/avatar.png")),
            SizedBox(width: 10),
            Text("Seb"),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                return Align(
                  alignment: msg["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      color: msg["isMe"] ? Color(0xFFD1B671) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      msg["text"],
                      style: TextStyle(
                        color: msg["isMe"] ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Color(0xFFE8C468)),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFFE8C468)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
