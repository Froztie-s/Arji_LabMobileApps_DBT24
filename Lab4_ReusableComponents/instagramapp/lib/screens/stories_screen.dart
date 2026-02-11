import 'package:flutter/material.dart';

import '../data/dummydata.dart';

class StoriesScreen extends StatefulWidget {
	const StoriesScreen({super.key, this.initialIndex = 0});

	final int initialIndex;

	@override
	State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
	late final PageController _pageController;
	int _currentIndex = 0;

	@override
	void initState() {
		super.initState();
		_currentIndex = widget.initialIndex;
		_pageController = PageController(initialPage: widget.initialIndex);
	}

	@override
	void dispose() {
		_pageController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			body: SafeArea(
				child: Stack(
					children: [
						PageView.builder(
							controller: _pageController,
							onPageChanged: (index) => setState(() => _currentIndex = index),
							itemCount: kStories.length,
							itemBuilder: (context, index) {
								final story = kStories[index];
								return Stack(
									fit: StackFit.expand,
									children: [
										Image.network(
											story.imageUrl,
											fit: BoxFit.cover,
										),
										Container(
											decoration: BoxDecoration(
												gradient: LinearGradient(
													colors: [
														Colors.black.withValues(alpha: 0.55),
														Colors.transparent,
														Colors.black.withValues(alpha: 0.25),
													],
													begin: Alignment.topCenter,
													end: Alignment.bottomCenter,
												),
											),
										),
										Positioned(
											left: 16,
											right: 16,
											top: 12,
											child: Row(
												children: [
													CircleAvatar(
														radius: 18,
														backgroundImage: NetworkImage(story.user.avatarUrl),
													),
													const SizedBox(width: 10),
													Expanded(
														child: Text(
															story.user.username,
															style: const TextStyle(
																color: Colors.white,
																fontWeight: FontWeight.w600,
															),
														),
													),
													IconButton(
														onPressed: () => Navigator.of(context).pop(),
														icon: const Icon(Icons.close, color: Colors.white),
													),
												],
											),
										),
									],
								);
							},
						),
						Positioned(
							left: 0,
							right: 0,
							top: 4,
							child: Row(
								children: List.generate(kStories.length, (index) {
									final isActive = index == _currentIndex;
									return Expanded(
										child: Container(
											height: 2.5,
											margin: const EdgeInsets.symmetric(horizontal: 3),
											decoration: BoxDecoration(
												color: isActive ? Colors.white : Colors.white54,
												borderRadius: BorderRadius.circular(2),
											),
										),
									);
								}),
							),
						),
					],
				),
			),
		);
	}
}
