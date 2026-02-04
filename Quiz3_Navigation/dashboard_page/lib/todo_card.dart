import 'package:flutter/material.dart';

Widget buildAssignmentCard(
  String title,
  String subject,
  String dueDate,
  int comments,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF00376A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Assignment',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(subject, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 6),
            Text(
              dueDate,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            const SizedBox(width: 24),
            Icon(Icons.comment_outlined, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 6),
            Text(
              '$comments comments',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    ),
  );
}
