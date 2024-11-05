// // pages/home_page.dart
// import 'package:flutter/material.dart';
// import '../models/friend.dart';
// import 'friend_list.dart';
// import 'add_friend_dialog.dart';

// class GiftPage extends StatefulWidget {
//   @override
//   _GiftPageState createState() => _GiftPageState();
// }

// class _GiftPageState extends State<GiftPage> {
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

// import 'package:flutter/material.dart';

// class ButtonExample extends StatefulWidget {
//   @override
//   _ButtonExampleState createState() => _ButtonExampleState();
// }

// class _ButtonExampleState extends State<ButtonExample> {
//   bool _showButtons = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Toggle Button Visibility'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: Text('Main Content Here'), // Replace with your main content
//           ),
//           if (_showButtons)
//             Positioned(
//               right: 20,
//               bottom: 80, // Positioning the buttons above the main FAB
//               child: Column(
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       // Action for button 1
//                     },
//                     mini: true, // Makes the button smaller
//                     child: Icon(Icons.favorite), // Change the icon as needed
//                   ),
//                   SizedBox(height: 10),
//                   FloatingActionButton(
//                     onPressed: () {
//                       // Action for button 2
//                     },
//                     mini: true,
//                     child: Icon(Icons.share),
//                   ),
//                   SizedBox(height: 10),
//                   FloatingActionButton(
//                     onPressed: () {
//                       // Action for button 3
//                     },
//                     mini: true,
//                     child: Icon(Icons.message),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _showButtons = !_showButtons; // Toggle button visibility
//           });
//         },
//         child: Icon(_showButtons ? Icons.close : Icons.add),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ListViewExample extends StatefulWidget {
//   @override
//   _ListViewExampleState createState() => _ListViewExampleState();
// }

// class _ListViewExampleState extends State<ListViewExample> {
//   List<Map<String, dynamic>> items = [
//     {
//       'image': 'https://via.placeholder.com/150',
//       'name1': 'John Doe',
//       'name2': 'Developer',
//       'color': Colors.blueAccent,
//     },
//     {
//       'image': 'https://via.placeholder.com/150',
//       'name1': 'Jane Smith',
//       'name2': 'Designer',
//       'color': Colors.greenAccent,
//     },
//   ];

//   int? selectedIndex;

//   // Function to show the dialog for adding or editing
//   void showAddEditDialog({bool isEditing = false}) {
//     final TextEditingController name1Controller = TextEditingController();
//     final TextEditingController name2Controller = TextEditingController();
//     final TextEditingController imageController = TextEditingController();

//     if (isEditing && selectedIndex != null) {
//       name1Controller.text = items[selectedIndex!]['name1'];
//       name2Controller.text = items[selectedIndex!]['name2'];
//       imageController.text = items[selectedIndex!]['image'];
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(isEditing ? 'Edit Item' : 'Add Item'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: name1Controller,
//                 decoration: InputDecoration(labelText: 'First Name'),
//               ),
//               TextField(
//                 controller: name2Controller,
//                 decoration: InputDecoration(labelText: 'Second Name'),
//               ),
//               TextField(
//                 controller: imageController,
//                 decoration: InputDecoration(labelText: 'Image URL'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (isEditing && selectedIndex != null) {
//                   setState(() {
//                     items[selectedIndex!] = {
//                       'image': imageController.text,
//                       'name1': name1Controller.text,
//                       'name2': name2Controller.text,
//                       'color': items[selectedIndex!]['color'], // Keep the same color
//                     };
//                   });
//                 } else {
//                   setState(() {
//                     items.add({
//                       'image': imageController.text,
//                       'name1': name1Controller.text,
//                       'name2': name2Controller.text,
//                       'color': Colors.purpleAccent,
//                     });
//                   });
//                 }
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Function to delete the selected item
//   void deleteItem() {
//     if (selectedIndex != null) {
//       setState(() {
//         items.removeAt(selectedIndex!);
//         selectedIndex = null; // Reset the selection after deletion
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List with Action Buttons'),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index; // Set the selected item
//               });
//             },
//             child: Container(
//               color: selectedIndex == index
//                   ? Colors.grey.withOpacity(0.3)
//                   : item['color'], // Highlight selected item
//               child: ListTile(
//                 leading: Image.network(item['image']),
//                 title: Text(item['name1']),
//                 subtitle: Text(item['name2']),
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             onPressed: () => showAddEditDialog(), // Show add dialog
//             heroTag: 'add',
//             mini: true,
//             child: Icon(Icons.add),
//             tooltip: 'Add Item',
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: selectedIndex != null ? () => showAddEditDialog(isEditing: true) : null, // Show edit dialog
//             heroTag: 'edit',
//             mini: true,
//             child: Icon(Icons.edit),
//             tooltip: 'Edit Item',
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: deleteItem,
//             heroTag: 'delete',
//             mini: true,
//             child: Icon(Icons.delete),
//             tooltip: 'Delete Item',
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class GiftPage extends StatefulWidget {
//   @override
//   _GiftPageState createState() => _GiftPageState();
// }

// class _GiftPageState extends State<GiftPage> {
//   List<Map<String, dynamic>> gifts = [
//     {
//       'name': 'Smartwatch',
//       'category': 'Electronics',
//       'status': 'Not Pledged',
//       'isPledged': false,
//     },
//     {
//       'name': 'Book',
//       'category': 'Literature',
//       'status': 'Pledged',
//       'isPledged': true,
//     },
//   ];

//   String _sortBy = 'name';
//   int? selectedIndex;

//   // Sort gifts list by selected criteria
//   void _sortGifts(String sortBy) {
//     setState(() {
//       _sortBy = sortBy;
//       gifts.sort((a, b) => a[sortBy].compareTo(b[sortBy]));
//     });
//   }

//   // Show dialog to add or edit a gift
//   void _showGiftDialog({Map<String, dynamic>? gift, int? index}) {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController categoryController = TextEditingController();

//     if (gift != null) {
//       nameController.text = gift['name'];
//       categoryController.text = gift['category'];
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(gift == null ? 'Add Gift' : 'Edit Gift'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Gift Name'),
//               ),
//               TextField(
//                 controller: categoryController,
//                 decoration: InputDecoration(labelText: 'Category'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (gift == null) {
//                   // Add a new gift
//                   setState(() {
//                     gifts.add({
//                       'name': nameController.text,
//                       'category': categoryController.text,
//                       'status': 'Not Pledged',
//                       'isPledged': false,
//                     });
//                   });
//                 } else {
//                   // Edit an existing gift
//                   setState(() {
//                     gifts[index!] = {
//                       'name': nameController.text,
//                       'category': categoryController.text,
//                       'status': gift['status'],
//                       'isPledged': gift['isPledged'],
//                     };
//                   });
//                 }
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Function to delete the selected gift
//   void _deleteGift() {
//     if (selectedIndex != null) {
//       setState(() {
//         gifts.removeAt(selectedIndex!);
//         selectedIndex = null; // Reset after deletion
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gifts for Event'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _sortGifts,
//             itemBuilder: (context) => [
//               PopupMenuItem(value: 'name', child: Text('Sort by Name')),
//               PopupMenuItem(value: 'category', child: Text('Sort by Category')),
//               PopupMenuItem(value: 'status', child: Text('Sort by Status')),
//             ],
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: gifts.length,
//         itemBuilder: (context, index) {
//           final gift = gifts[index];
//           return ListTile(
//             title: Text(gift['name']),
//             subtitle: Text(gift['category']),
//             trailing: Text(gift['status']),
//             tileColor: gift['isPledged']
//                 ? Colors.greenAccent.withOpacity(0.3)
//                 : Colors.redAccent.withOpacity(0.3),
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             onLongPress: gift['isPledged']
//                 ? null // Disable editing if the gift is pledged
//                 : () => _showGiftDialog(gift: gift, index: index),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             onPressed: () => _showGiftDialog(),
//             heroTag: 'add',
//             mini: true,
//             child: Icon(Icons.add),
//             tooltip: 'Add Gift',
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: selectedIndex != null && !gifts[selectedIndex!]['isPledged']
//                 ? () => _showGiftDialog(gift: gifts[selectedIndex!], index: selectedIndex)
//                 : null, // Show edit dialog
//             heroTag: 'edit',
//             mini: true,
//             child: Icon(Icons.edit),
//             tooltip: 'Edit Gift',
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: selectedIndex != null ? _deleteGift : null,
//             heroTag: 'delete',
//             mini: true,
//             child: Icon(Icons.delete),
//             tooltip: 'Delete Gift',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class GiftPage extends StatefulWidget {
  @override
  _GiftPageState createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> gifts = [
    {
      'name': 'Smartwatch',
      'description': 'A fitness tracker and smartwatch',
      'category': 'Electronics',
      'price': 200,
      'status': 'Not Pledged',
      'isPledged': false,
      'image': null,
    },
    {
      'name': 'Book',
      'description': 'A novel by a famous author',
      'category': 'Literature',
      'price': 15,
      'status': 'Pledged',
      'isPledged': true,
      'image': null,
    },
  ];

  String _sortBy = 'name';
  int? selectedIndex;

  // Sort gifts list by selected criteria
  void _sortGifts(String sortBy) {
    setState(() {
      _sortBy = sortBy;
      gifts.sort((a, b) => a[sortBy].compareTo(b[sortBy]));
    });
  }

  // Show dialog to add or edit a gift
  void _showGiftDialog({Map<String, dynamic>? gift, int? index}) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    bool isPledged = gift?['isPledged'] ?? false;
    File? selectedImage = gift?['image'];

    if (gift != null) {
      nameController.text = gift['name'];
      descriptionController.text = gift['description'];
      categoryController.text = gift['category'];
      priceController.text = gift['price'].toString();
    }

    Future<void> _pickImage() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(gift == null ? 'Add Gift' : 'Edit Gift'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Gift Name'),
                  enabled: !isPledged,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  enabled: !isPledged,
                ),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(labelText: 'Category'),
                  enabled: !isPledged,
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  enabled: !isPledged,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Status: '),
                    Switch(
                      value: isPledged,
                      onChanged: !isPledged
                          ? (value) {
                              setState(() {
                                isPledged = value;
                              });
                            }
                          : null,
                    ),
                    Text(isPledged ? 'Pledged' : 'Available'),
                  ],
                ),
                if (selectedImage != null)
                  Image.file(selectedImage!, height: 100, width: 100, fit: BoxFit.cover),
                TextButton(
                  onPressed: !isPledged ? _pickImage : null,
                  child: Text('Upload Image'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (gift == null) {
                  // Add a new gift
                  setState(() {
                    gifts.add({
                      'name': nameController.text,
                      'description': descriptionController.text,
                      'category': categoryController.text,
                      'price': double.tryParse(priceController.text) ?? 0,
                      'status': isPledged ? 'Pledged' : 'Available',
                      'isPledged': isPledged,
                      'image': selectedImage,
                    });
                  });
                } else {
                  // Edit an existing gift
                  setState(() {
                    gifts[index!] = {
                      'name': nameController.text,
                      'description': descriptionController.text,
                      'category': categoryController.text,
                      'price': double.tryParse(priceController.text) ?? 0,
                      'status': isPledged ? 'Pledged' : 'Available',
                      'isPledged': isPledged,
                      'image': selectedImage,
                    };
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete the selected gift
  void _deleteGift() {
    if (selectedIndex != null) {
      setState(() {
        gifts.removeAt(selectedIndex!);
        selectedIndex = null; // Reset after deletion
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gifts for Event'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _sortGifts,
            itemBuilder: (context) => [
              PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              PopupMenuItem(value: 'category', child: Text('Sort by Category')),
              PopupMenuItem(value: 'status', child: Text('Sort by Status')),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: gifts.length,
        itemBuilder: (context, index) {
          final gift = gifts[index];
          return ListTile(
            leading: gift['image'] != null
                ? Image.file(gift['image'], width: 50, height: 50, fit: BoxFit.cover)
                : Icon(Icons.card_giftcard),
            title: Text(gift['name']),
            subtitle: Text('${gift['category']} - ${gift['description']}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${gift['price']}'),
                Text(gift['status']),
              ],
            ),
            tileColor: gift['isPledged']
                ? Colors.greenAccent.withOpacity(0.3)
                : Colors.redAccent.withOpacity(0.3),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            onLongPress: gift['isPledged']
                ? null // Disable editing if the gift is pledged
                : () => _showGiftDialog(gift: gift, index: index),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => _showGiftDialog(),
            heroTag: 'add',
            mini: true,
            child: Icon(Icons.add),
            tooltip: 'Add Gift',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: selectedIndex != null && !gifts[selectedIndex!]['isPledged']
                ? () => _showGiftDialog(gift: gifts[selectedIndex!], index: selectedIndex)
                : null,
            heroTag: 'edit',
            mini: true,
            child: Icon(Icons.edit),
            tooltip: 'Edit Gift',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: selectedIndex != null ? _deleteGift : null,
            heroTag: 'delete',
            mini: true,
            child: Icon(Icons.delete),
            tooltip: 'Delete Gift',
          ),
        ],
      ),
    );
  }
}
