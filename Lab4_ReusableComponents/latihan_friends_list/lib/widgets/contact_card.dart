import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ContactCard extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;

  const ContactCard({super.key, required this.user, this.onTap});

  String _formatLastSeen(DateTime lastSeen) {
    final Duration diff = DateTime.now().difference(lastSeen);
    if (diff.inMinutes < 1) {
      return 'Last seen just now';
    }
    if (diff.inMinutes < 60) {
      return 'Last seen ${diff.inMinutes}m ago';
    }
    if (diff.inHours < 24) {
      return 'Last seen ${diff.inHours}h ago';
    }
    return 'Last seen ${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(user.profilePic),
      ),
      title: Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        user.email,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        _formatLastSeen(user.lastSeen),
        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
      ),
      onTap: onTap,
    );
  }
}
