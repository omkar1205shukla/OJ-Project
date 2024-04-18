class UserProfile {
  final String email;
  UserProfile({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json['email'] as String,
    );
  }
}
