import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int myIndex = 0;
  int _selectedIndex = 0;
  List<Map<String, dynamic>> chats = [
    {
      'name': 'Syed Shahzaib Basir',
      'message': 'Hey, how are you?',
      'time': '10:30 AM',
      'avatar': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Syed Shahzaib Basir',
      'message': 'Hey, how are you?',
      'time': '10:30 AM',
      'avatar': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Syed Shahzaib Basir',
      'message': 'Hey, how are you?',
      'time': '10:30 AM',
      'avatar': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Syed Shahzaib Basir',
      'message': 'Hey, how are you?',
      'time': '10:30 AM',
      'avatar': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Syed Shahzaib Basir',
      'message': 'Hey, how are you?',
      'time': '10:30 AM',
      'avatar': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Syed Shahzaib Basir',
      'message': 'Hey, how are you?',
      'time': '10:30 AM',
      'avatar': 'https://via.placeholder.com/150',
    },
    // Add more chat data as needed
  ];

  void showNotificationSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('New notification received!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            // You can add actions here when the user dismisses the snackbar
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'WhatsApp',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon : Icon(
              CupertinoIcons.camera,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: (){},
              icon: Icon(CupertinoIcons.search, color: Colors.white)),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 4.0 , right: 4.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(chat['avatar']),
                ),

                title: Text(
                  chat['name'],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                subtitle: Text(
                  chat['message'],
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        chat['time'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Open chat screen when ListTile is tapped
                },
                onLongPress: () {
                  showModal(context);
                  // Open chat options dialog on long press
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        onTap: (index) {
          setState(() {
            myIndex = index;
            _selectedIndex = index;
            switch (index) {
              case 0:
              // Handle Chats
                break;
              case 1:
              // Handle Updates
                break;
              case 2:
              // Handle Communities
                break;
              case 3:
              // Handle Calls
                break;
              default:
            }
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_sharp,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey),
            label: 'Chats',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_sharp,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey),
            label: 'Updates',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey),
            label: 'Communities',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_sharp,
                color: _selectedIndex == 3 ? Colors.white : Colors.grey),
            label: 'Calls',
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showNotificationSnackbar(); // Call this method when new notification arrives
        },
        child: Icon(Icons.notifications,size: 28,),
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Do you want to delete chats'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
