import 'package:flutter/material.dart';

import '../models/story_models.dart';

class StoryBubble extends StatelessWidget {
  const StoryBubble({
    super.key,
    required this.story,
    required this.onTap,
  });

  final Story story;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ringColors = story.isSeen
        ? [Colors.grey.shade300, Colors.grey.shade300]
        : [const Color(0xFFED4C67), const Color(0xFFF7B731)];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: ringColors),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(story.user.avatarUrl),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 70,
            child: Text(
              story.user.username,
              style: const TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
