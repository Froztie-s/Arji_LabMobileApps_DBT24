import 'package:flutter/material.dart';

import '../data/dummydata.dart';
import '../screens/stories_screen.dart';
import '../screens/chatlist_screen.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/post_card.dart';
import '../widgets/story_bubble.dart';

class HomePageScreen extends StatelessWidget {
	const HomePageScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: AppBar(
				backgroundColor: Colors.black,
				elevation: 0,
				centerTitle: true,
				leading: const Icon(Icons.add, color: Colors.white),
				title: const Text(
					'Instagram',
					style: TextStyle(
						fontWeight: FontWeight.w700,
						color: Colors.white,
					),
				),
				actions: const [
					Padding(
						padding: EdgeInsets.only(right: 16),
						child: Icon(Icons.favorite_border, color: Colors.white),
					),
				],
			),
			body: CustomScrollView(
				slivers: [
					SliverToBoxAdapter(
						child: SizedBox(
							height: 112,
							child: ListView.separated(
								padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
								scrollDirection: Axis.horizontal,
								itemBuilder: (context, index) {
									final story = kStories[index];
									return StoryBubble(
										story: story,
										labelOverride: index == 0 ? 'Your story' : null,
										showAddBadge: index == 0,
										onTap: () {
											Navigator.of(context).push(
												MaterialPageRoute(
													builder: (_) => StoriesScreen(initialIndex: index),
												),
											);
										},
									);
								},
								separatorBuilder: (_, __) => const SizedBox(width: 12),
								itemCount: kStories.length,
							),
						),
					),
					SliverToBoxAdapter(
						child: Divider(color: Colors.grey.shade900, height: 0),
					),
					SliverList(
						delegate: SliverChildBuilderDelegate(
							(context, index) {
								return PostCard(post: kPosts[index]);
							},
							childCount: kPosts.length,
						),
					),
				],
			),
			bottomNavigationBar: BottomNavBar(
				currentIndex: 0,
				onTap: (index) {
					if (index == 2) {
						Navigator.of(context).push(
							MaterialPageRoute(builder: (_) => const ChatListScreen()),
						);
					}
				},
			),
		);
	}
}
