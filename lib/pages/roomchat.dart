import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Room',
      theme: ThemeData(
        primaryColor: Color(0xFF1D7ED1),
      ),
      home: ChatRoom(),
    );
  }
}

class ChatRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'images/dokterlily.png'), // Replace with actual image URL
            ),
            SizedBox(width: 8),
            Text(
              'Dr. Lily Luthfiah',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.black),
            onPressed: () {
              // Handle call button press
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.black),
            onPressed: () {
              // Handle video call button press
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more button press
            },
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8), // Added SizedBox for spacing
          Expanded(
            child: ListView(
              children: [
                ChatMessage(
                  message: 'Apakah ada yang bisa saya bantu?',
                  isDoctor: true,
                  imageUrl:
                      'images/dokterlily.png', // Replace with actual image URL
                ),
              ],
            ),
          ),
          const SizedBox(height: 16), // Added SizedBox for spacing
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {
                    // Handle attach file button press
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ceritakan keluhanmu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.grey),
                  onPressed: () {
                    // Handle send button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isDoctor;
  final String imageUrl;

  ChatMessage(
      {required this.message, required this.isDoctor, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (isDoctor) ...[
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Lily Luthfiah',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(message),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
