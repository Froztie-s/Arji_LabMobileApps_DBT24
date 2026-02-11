import 'package:flutter/material.dart';

import '../models/message_models.dart';
import '../models/user_models.dart';

class ChatScreen extends StatelessWidget {
	const ChatScreen({
		super.key,
		required this.user,
		required this.messages,
	});

	final AppUser user;
	final List<Message> messages;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: AppBar(
				backgroundColor: Colors.black,
				elevation: 0,
				titleSpacing: 0,
				title: Row(
					children: [
						CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
						const SizedBox(width: 10),
						Expanded(
							child: Text(
								user.name,
								style: const TextStyle(
									color: Colors.white,
									fontWeight: FontWeight.w600,
								),
							),
						),
					],
				),
				actions: const [
					Padding(
						padding: EdgeInsets.only(right: 16),
						child: Icon(Icons.call, color: Colors.white),
					),
					Padding(
						padding: EdgeInsets.only(right: 16),
						child: Icon(Icons.videocam, color: Colors.white),
					),
					Padding(
						padding: EdgeInsets.only(right: 12),
						child: Icon(Icons.info_outline, color: Colors.white),
					),
				],
			),
			body: Column(
				children: [
					Expanded(
						child: ListView.builder(
							padding: const EdgeInsets.all(16),
							itemCount: messages.length,
							itemBuilder: (context, index) {
								final message = messages[index];
								final isMe = message.isMe;
								return Align(
									alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
									child: Container(
										margin: const EdgeInsets.only(bottom: 10),
										padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
										constraints: BoxConstraints(
											maxWidth: MediaQuery.of(context).size.width * 0.72,
										),
										decoration: BoxDecoration(
											color: isMe ? const Color(0xFF4A4A4A) : const Color(0xFF1E1E1E),
											borderRadius: BorderRadius.circular(18),
										),
										child: Text(
											message.text,
											style: const TextStyle(color: Colors.white),
										),
									),
								);
							},
						),
					),
					const SizedBox(height: 8),
					SafeArea(
						top: false,
						child: Padding(
							padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
							child: Container(
								padding: const EdgeInsets.symmetric(horizontal: 12),
								height: 46,
								decoration: BoxDecoration(
									color: const Color(0xFF1E1E1E),
									borderRadius: BorderRadius.circular(24),
								),
								child: Row(
									children: const [
										Icon(Icons.camera_alt_outlined, color: Colors.white70, size: 20),
										SizedBox(width: 10),
										Expanded(
											child: Text(
												'Message...',
												style: TextStyle(color: Colors.white54),
											),
										),
										Icon(Icons.mic_none, color: Colors.white70, size: 20),
									],
								),
							),
						),
					),
				],
			),
		);
	}
}
