import 'user_models.dart';

class Story {
	const Story({
		required this.id,
		required this.user,
		required this.imageUrl,
		this.isSeen = false,
	});

	final String id;
	final AppUser user;
	final String imageUrl;
	final bool isSeen;
}
