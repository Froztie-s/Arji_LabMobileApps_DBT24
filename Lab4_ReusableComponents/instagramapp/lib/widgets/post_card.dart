import 'package:flutter/material.dart';

import '../models/post_models.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(post.user.avatarUrl)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  post.user.username,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: post.imageUrls.length,
                onPageChanged: (index) => setState(() => _pageIndex = index),
                itemBuilder: (context, index) {
                  return Image.network(
                    post.imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${_pageIndex + 1}/${post.imageUrls.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.favorite_border),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined),
              const Spacer(),
              const Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                '${post.likeCount} likes',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  post.caption,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            post.timeAgo,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
