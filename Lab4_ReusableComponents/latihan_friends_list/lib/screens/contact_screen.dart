import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../screens/chat_screen.dart';
import '../widgets/contact_card.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    final segments = ['All', 'Starred'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ToggleButtons(
                    isSelected: [
                      _selectedSegment == 0,
                      _selectedSegment == 1,
                    ],
                    onPressed: (index) {
                      setState(() => _selectedSegment = index);
                    },
                    borderRadius: BorderRadius.circular(12),
                    constraints: const BoxConstraints(minWidth: 56, minHeight: 36),
                    children: segments
                        .map((label) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(label),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _sectionHeader('INVITE'),
            ListTile(
              leading: const Icon(Icons.wifi_tethering),
              title: const Text('Add People Nearby'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Invite Friends'),
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _sectionHeader('CONTACTS'),
            ...mockUsers.map((user) {
              return ContactCard(
                user: user,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(contact: user),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
