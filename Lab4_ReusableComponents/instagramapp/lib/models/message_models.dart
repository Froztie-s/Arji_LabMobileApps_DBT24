import 'user_models.dart';

enum MessageType { text, image }

class Message {
	const Message({
		required this.id,
		required this.sender,
		required this.text,
		required this.sentAt,
		this.type = MessageType.text,
		this.isMe = false,
	});

	final String id;
	final AppUser sender;
	final String text;
	final String sentAt;
	final MessageType type;
	final bool isMe;
}
