
import 'package:flutter/material.dart';

class GiftDetailsPage extends StatelessWidget {
  final Map<String, dynamic> gift;
  final Function(Map<String, dynamic>) onSave;

  GiftDetailsPage({required this.gift, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: gift['name']);
    final TextEditingController descriptionController = TextEditingController(text: gift['description']);
    final TextEditingController categoryController = TextEditingController(text: gift['category']);
    final TextEditingController priceController = TextEditingController(text: gift['price'].toString());

    bool isPledged = gift['isPledged'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Gift Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Gift Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status:'),
                Switch(
                  value: isPledged,
                  onChanged: (value) {
                    // Prevent changing the status if it's already pledged
                    if (!isPledged) {
                      onSave({
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'category': categoryController.text,
                        'price': double.parse(priceController.text),
                        'isPledged': value,
                      });
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                onSave({
                  'name': nameController.text,
                  'description': descriptionController.text,
                  'category': categoryController.text,
                  'price': double.parse(priceController.text),
                  'isPledged': isPledged,
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
