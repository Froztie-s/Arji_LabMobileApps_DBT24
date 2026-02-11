import '../models/chatthread_models.dart';
import '../models/message_models.dart';
import '../models/post_models.dart';
import '../models/story_models.dart';
import '../models/user_models.dart';

final List<AppUser> kUsers = [
	AppUser(
		id: 'u0',
		name: 'You',
		username: 'yourstory',
		avatarUrl: 'https://picsum.photos/id/1005/200/200',
	),
	AppUser(
		id: 'u1',
		name: 'Shane Martinez',
		username: 'shanem',
		avatarUrl: 'https://picsum.photos/id/1027/200/200',
		isVerified: true,
	),
	AppUser(
		id: 'u2',
		name: 'Katie Keller',
		username: 'kkeller',
		avatarUrl: 'https://picsum.photos/id/1011/200/200',
	),
	AppUser(
		id: 'u3',
		name: 'Stephen Mann',
		username: 'stephenm',
		avatarUrl: 'https://picsum.photos/id/1001/200/200',
	),
	AppUser(
		id: 'u4',
		name: 'Melvin Pratt',
		username: 'melvinp',
		avatarUrl: 'https://picsum.photos/id/1000/200/200',
	),
	AppUser(
		id: 'u5',
		name: 'Dio',
		username: 'dio',
		avatarUrl: 'https://picsum.photos/id/1012/200/200',
	),
	AppUser(
		id: 'u6',
		name: 'Victor',
		username: 'victor',
		avatarUrl: 'https://picsum.photos/id/1016/200/200',
	),
	AppUser(
		id: 'u7',
		name: 'Dempi',
		username: 'dempi',
		avatarUrl: 'https://picsum.photos/id/1018/200/200',
	),
	AppUser(
		id: 'u8',
		name: 'Serendi',
		username: 'serendi',
		avatarUrl: 'https://picsum.photos/id/1025/200/200',
	),
];

final List<Story> kStories = [
	Story(
		id: 's1',
		user: kUsers[0],
		imageUrl: 'https://picsum.photos/id/1031/900/1600',
	),
	Story(
		id: 's2',
		user: kUsers[1],
		imageUrl: 'https://picsum.photos/id/1032/900/1600',
	),
	Story(
		id: 's3',
		user: kUsers[2],
		imageUrl: 'https://picsum.photos/id/1033/900/1600',
	),
	Story(
		id: 's4',
		user: kUsers[3],
		imageUrl: 'https://picsum.photos/id/1035/900/1600',
	),
	Story(
		id: 's5',
		user: kUsers[4],
		imageUrl: 'https://picsum.photos/id/1036/900/1600',
	),
	Story(
		id: 's6',
		user: kUsers[5],
		imageUrl: 'https://picsum.photos/id/1037/900/1600',
	),
	Story(
		id: 's7',
		user: kUsers[6],
		imageUrl: 'https://picsum.photos/id/1038/900/1600',
	),
	Story(
		id: 's8',
		user: kUsers[7],
		imageUrl: 'https://picsum.photos/id/1039/900/1600',
	),
];

final List<Post> kPosts = [
	Post(
		id: 'p1',
		user: kUsers[0],
		imageUrls: [
			'https://picsum.photos/id/1050/1080/1080',
			'https://picsum.photos/id/1052/1080/1080',
			'https://picsum.photos/id/1053/1080/1080',
		],
		caption: 'Weekend light and strong coffee.',
		likeCount: 1204,
		timeAgo: '2h',
		location: 'Malibu, California',
	),
	Post(
		id: 'p2',
		user: kUsers[1],
		imageUrls: [
			'https://picsum.photos/id/1060/1080/1080',
			'https://picsum.photos/id/1062/1080/1080',
		],
		caption: 'City lines and late walks.',
		likeCount: 842,
		timeAgo: '5h',
	),
	Post(
		id: 'p3',
		user: kUsers[2],
		imageUrls: [
			'https://picsum.photos/id/1070/1080/1080',
			'https://picsum.photos/id/1074/1080/1080',
			'https://picsum.photos/id/1077/1080/1080',
		],
		caption: 'Gym day, no excuses.',
		likeCount: 2213,
		timeAgo: '1d',
	),
	Post(
		id: 'p4',
		user: kUsers[3],
		imageUrls: [
			'https://picsum.photos/id/1080/1080/1080',
			'https://picsum.photos/id/1084/1080/1080',
		],
		caption: 'Soft sunsets and loud music.',
		likeCount: 560,
		timeAgo: '2d',
	),
];

final List<ChatThread> kChatThreads = [
	ChatThread(
		id: 't1',
		participants: [kUsers[0], kUsers[5]],
		lastMessage: '4+ new messages',
		timeAgo: '19h',
		unreadCount: 4,
	),
	ChatThread(
		id: 't2',
		participants: [kUsers[0], kUsers[4]],
		lastMessage: 'Hehe',
		timeAgo: '4d',
	),
	ChatThread(
		id: 't3',
		participants: [kUsers[0], kUsers[7]],
		lastMessage: 'Sent a reel by sisi.biner',
		timeAgo: '1w',
		unreadCount: 1,
	),
	ChatThread(
		id: 't4',
		participants: [kUsers[0], kUsers[6]],
		lastMessage: 'Mentioned you in their story',
		timeAgo: '2w',
	),
	ChatThread(
		id: 't5',
		participants: [kUsers[0], kUsers[3]],
		lastMessage: '2 new messages',
		timeAgo: '2w',
		unreadCount: 2,
	),
];

final Map<String, List<Message>> kChatMessages = {
	kUsers[5].id: [
		Message(
			id: 'm1',
			sender: kUsers[5],
			text: 'Yo, are you free tonight?',
			sentAt: '19h',
		),
		Message(
			id: 'm2',
			sender: kUsers[0],
			text: 'Maybe after class. What\'s up?',
			sentAt: '19h',
			isMe: true,
		),
		Message(
			id: 'm3',
			sender: kUsers[5],
			text: 'Gym session? Same place.',
			sentAt: '18h',
		),
	],
	kUsers[4].id: [
		Message(
			id: 'm4',
			sender: kUsers[4],
			text: 'Hehe',
			sentAt: '4d',
		),
		Message(
			id: 'm5',
			sender: kUsers[0],
			text: 'Lmao',
			sentAt: '4d',
			isMe: true,
		),
	],
	kUsers[7].id: [
		Message(
			id: 'm6',
			sender: kUsers[7],
			text: 'Sent a reel by sisi.biner',
			sentAt: '1w',
		),
	],
	kUsers[6].id: [
		Message(
			id: 'm7',
			sender: kUsers[6],
			text: 'Mentioned you in their story',
			sentAt: '2w',
		),
	],
	kUsers[3].id: [
		Message(
			id: 'm8',
			sender: kUsers[3],
			text: 'Are you coming to the meetup?',
			sentAt: '2w',
		),
		Message(
			id: 'm9',
			sender: kUsers[0],
			text: 'I\'ll be late but I\'ll come.',
			sentAt: '2w',
			isMe: true,
		),
	],
};
