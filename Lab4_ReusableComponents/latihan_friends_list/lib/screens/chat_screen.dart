import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../models/user_model.dart';

class ChatScreen extends StatelessWidget {
  final User contact;

  const ChatScreen({super.key, required this.contact});

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = mockUsers.first.id;
    final messages = mockMessages.where((message) {
      final isFromCurrentToContact =
          message.senderId == currentUserId && message.receiverId == contact.id;
      final isFromContactToCurrent =
          message.senderId == contact.id && message.receiverId == currentUserId;
      return isFromCurrentToContact || isFromContactToCurrent;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(contact.profilePic)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: messages.isEmpty
                  ? const Center(child: Text('No messages yet.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isMe = message.senderId == currentUserId;
                        return Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            constraints: const BoxConstraints(maxWidth: 300),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                                bottomLeft:
                                    Radius.circular(isMe ? 16 : 4),
                                bottomRight:
                                    Radius.circular(isMe ? 4 : 16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(message.content),
                                const SizedBox(height: 6),
                                Text(
                                  _formatTime(message.timestamp),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
