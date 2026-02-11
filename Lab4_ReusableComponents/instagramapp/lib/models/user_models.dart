class AppUser {
	const AppUser({
		required this.id,
		required this.name,
		required this.username,
		required this.avatarUrl,
		this.isVerified = false,
	});

	final String id;
	final String name;
	final String username;
	final String avatarUrl;
	final bool isVerified;
}
