import 'package:flutter/material.dart';
import '../main.dart'; // Import to access LoginPage

// HomePage widget - moved to separate file for better organization
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Default selected tab is Home (index 0)
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add top navigation bar with back button
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 63, 129, 1.0),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to Login page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        title: Text('Home'),
      ),
      // No body content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color.fromRGBO(32, 63, 129, 1.0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // Exactly 3 items as requested
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
