// User Class
class User {
  final String pk;
  final String username;
  final String profilePicUrl;
  final bool isPrivate;

  User({
    required this.pk,
    required this.username,
    required this.profilePicUrl,
    required this.isPrivate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      pk: json['pk'],
      username: json['username'],
      profilePicUrl: json['profile_pic_url'],
      isPrivate: json['is_private'],
    );
  }
}
