import 'package:flutter/material.dart';

import '../models/chatthread_models.dart';
import '../models/user_models.dart';

class ChatListRow extends StatelessWidget {
  const ChatListRow({
    super.key,
    required this.thread,
    required this.user,
    required this.onTap,
  });

  final ChatThread thread;
  final AppUser user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${thread.lastMessage} · ${thread.timeAgo}',
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (thread.unreadCount > 0)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF4EA1FF),
                  shape: BoxShape.circle,
                ),
              ),
            const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
