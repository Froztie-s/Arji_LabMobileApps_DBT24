import 'user_models.dart';

class Post {
  const Post({
    required this.id,
    required this.user,
    required this.imageUrls,
    required this.caption,
    required this.likeCount,
    required this.timeAgo,
  });

  final String id;
  final AppUser user;
  final List<String> imageUrls;
  final String caption;
  final int likeCount;
  final String timeAgo;
}
