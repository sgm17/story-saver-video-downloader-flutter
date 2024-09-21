// Owner Class
class Owner {
  final String pk;
  final String username;
  final String profilePicUrl;

  Owner({
    required this.pk,
    required this.username,
    required this.profilePicUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      pk: json['pk'],
      username: json['username'],
      profilePicUrl: json['profile_pic_url'],
    );
  }
}
