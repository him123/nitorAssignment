class User {
  final int id;
  final String avatar_url;
  final String login;
  final double score;
  final String name;
  final String company;
  final String location;
  final int followers;
  final int following;
  final String bio;
  final int public_repos;
  final String public_gists;
  final String updated_at;

  User(
      {this.id,
      this.avatar_url,
      this.login,
      this.score,
      this.name,
      this.company,
      this.location,
      this.followers,
      this.following,
      this.bio,
      this.public_repos,
      this.public_gists,
      this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      id: json['id'],
      avatar_url: json['avatar_url'],
      login: json['login'],
      score: json['score'],
    );
  }

  factory User.userDetailsFromJson(Map json) {
    return new User(
      name: json['name'],
      company: json['company'],
//      location: json['location'],
//      followers: json['followers'],
//      following: json['following'],
//      bio: json['bio'],
//      public_repos: json['public_repos'],
//      public_gists: json['public_gists'],
//      updated_at: json['updated_at'],
    );
  }
}
