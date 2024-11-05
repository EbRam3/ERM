// // pages/home_page.dart
// import 'package:flutter/material.dart';
// import '../models/friend.dart';
// import 'friend_list.dart';
// import 'add_friend_dialog.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Friend> friends = [
//     Friend(name: 'Alice', profileImage: 'assets/alice.png', upcomingEvents: 1),
//     Friend(name: 'Bob', profileImage: 'assets/bob.png', upcomingEvents: 2),
//     Friend(
//         name: 'Charlie', profileImage: 'assets/charlie.png', upcomingEvents: 0),
//   ];

//   String searchQuery = '';
//   String sortOption = 'Upcoming Events';

//   Future<void> _refreshFriends() async {
//     // Here we might reload friends from a database or an API
//     await Future.delayed(Duration(seconds: 1));
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Friend> filteredFriends = friends
//         .where((friend) =>
//             friend.name.toLowerCase().contains(searchQuery.toLowerCase()))
//         .toList();

//     if (sortOption == 'Upcoming Events') {
//       filteredFriends
//           .sort((a, b) => b.upcomingEvents.compareTo(a.upcomingEvents));
//     } else if (sortOption == 'Alphabetically') {
//       filteredFriends.sort((a, b) => a.name.compareTo(b.name));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Home')),
//         actions: [
//           PopupMenuButton<String>(
//             icon: const Icon(Icons.sort_by_alpha),
//             onSelected: (value) {
//               setState(() {
//                 sortOption = value;
//               });
//             },
//             itemBuilder: (BuildContext context) {
//               return ['Upcoming Events', 'Alphabetically'].map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search friends...',
//                 prefixIcon: Icon(Icons.search),
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               onChanged: (query) {
//                 setState(() {
//                   searchQuery = query;
//                 });
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // TODO: Navigate to create event page
//               },
//               child: Text('Create Your Own Event/List'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromRGBO(218, 128, 156, 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: filteredFriends.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No friends found.',
//                       style: TextStyle(fontSize: 18, color: Colors.grey),
//                     ),
//                   )
//                 : RefreshIndicator(
//                     onRefresh: _refreshFriends,
//                     child: FriendList(friends: filteredFriends),
//                   ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => AddFriendDialog(),
//           );
//         },
//         child: Icon(Icons.person_add),
//       ),
//     );
//   }
// }

// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:trial15/test.dart';
import '../models/friend.dart';
import 'friend_list.dart';
import 'add_friend_dialog.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Friend> friends = [
    Friend(name: 'Alice', profileImage: 'assets/alice.png', upcomingEvents: 1),
    Friend(name: 'Bob', profileImage: 'assets/bob.png', upcomingEvents: 2),
    Friend(name: 'Charlie', profileImage: 'assets/charlie.png', upcomingEvents: 0),
  ];

  String searchQuery = '';
  String sortOption = 'Upcoming Events';

  Future<void> _refreshFriends() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Friend> filteredFriends = friends
        .where((friend) => friend.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    // Sorting logic
    if (sortOption == 'Upcoming Events') {
      filteredFriends.sort((a, b) => b.upcomingEvents.compareTo(a.upcomingEvents));
    } else if (sortOption == 'Alphabetically') {
      filteredFriends.sort((a, b) => a.name.compareTo(b.name));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort_by_alpha),
            onSelected: (value) {
              setState(() {
                sortOption = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return ['Upcoming Events', 'Alphabetically'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Button to create a new event or gift list
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigate to create event or gift list page
              },
              child: Text('Create Your Own Event/List'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(218, 128, 156, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Search field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search friends...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
          Expanded(
            child: filteredFriends.isEmpty
                ? Center(
                    child: Text(
                      'No friends found.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _refreshFriends,
                    child: ListView.builder(
                      itemCount: filteredFriends.length,
                      itemBuilder: (context, index) {
                        final friend = filteredFriends[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(friend.profileImage),
                          ),
                          title: Text(friend.name),
                          subtitle: Text(
                            friend.upcomingEvents > 0
                                ? 'Upcoming Events: ${friend.upcomingEvents}'
                                : 'No Upcoming Events',
                          ),
                          onTap: () {
                            // Navigate to the friend's gift list page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GiftPage(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddFriendDialog(),
          );
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}

// Add a simple GiftListPage for navigation
class GiftListPage extends StatelessWidget {
  final Friend friend;

  GiftListPage({required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${friend.name}\'s Gift List'),
      ),
      body: Center(
        child: Text('This is where ${friend.name}\'s gifts will be displayed.'),
      ),
    );
  }
}
