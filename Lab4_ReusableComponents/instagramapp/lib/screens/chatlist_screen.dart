import 'package:flutter/material.dart';

import '../data/dummydata.dart';
import '../screens/chat_screen.dart';
import '../screens/homepage_screen.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/chat_list_row.dart';

class ChatListScreen extends StatelessWidget {
	const ChatListScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: AppBar(
				backgroundColor: Colors.black,
				elevation: 0,
				centerTitle: true,
				title: Row(
					mainAxisSize: MainAxisSize.min,
					children: const [
						Text(
							'arji.na',
							style: TextStyle(
								color: Colors.white,
								fontWeight: FontWeight.w600,
							),
						),
						SizedBox(width: 6),
						Icon(Icons.keyboard_arrow_down, color: Colors.white),
						SizedBox(width: 6),
						CircleAvatar(radius: 3, backgroundColor: Colors.redAccent),
					],
				),
				actions: const [
					Padding(
						padding: EdgeInsets.only(right: 16),
						child: Icon(Icons.edit, color: Colors.white),
					),
				],
			),
			body: CustomScrollView(
				slivers: [
					SliverToBoxAdapter(
						child: Padding(
							padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
							child: const AppSearchBar(
								hintText: 'Search or ask Meta AI',
							),
						),
					),
					const SliverToBoxAdapter(
						child: SizedBox(height: 10),
					),
					SliverToBoxAdapter(
						child: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 16),
							child: Row(
								children: const [
									Text(
										'Messages',
										style: TextStyle(
											color: Colors.white,
											fontWeight: FontWeight.w600,
										),
									),
									Spacer(),
									Text(
										'Requests',
										style: TextStyle(color: Color(0xFF4EA1FF)),
									),
								],
							),
						),
					),
					SliverList(
						delegate: SliverChildBuilderDelegate(
							(context, index) {
								final thread = kChatThreads[index];
								final user = thread.participants.last;
								final messages = kChatMessages[user.id] ?? [];
								return ChatListRow(
									thread: thread,
									user: user,
									onTap: () {
										Navigator.of(context).push(
											MaterialPageRoute(
												builder: (_) => ChatScreen(
													user: user,
													messages: messages,
												),
											),
										);
									},
								);
							},
							childCount: kChatThreads.length,
						),
					),
				],
			),
			bottomNavigationBar: BottomNavBar(
				currentIndex: 2,
				onTap: (index) {
					if (index == 0) {
						Navigator.of(context).pushReplacement(
							MaterialPageRoute(builder: (_) => const HomePageScreen()),
						);
					}
				},
			),
		);
	}
}
