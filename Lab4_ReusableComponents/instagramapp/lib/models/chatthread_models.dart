import 'user_models.dart';

class ChatThread {
	const ChatThread({
		required this.id,
		required this.participants,
		required this.lastMessage,
		required this.timeAgo,
		this.unreadCount = 0,
	});

	final String id;
	final List<AppUser> participants;
	final String lastMessage;
	final String timeAgo;
	final int unreadCount;
}
