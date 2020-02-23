class UserDetails {
  final String name;
  final String company;
  final String avatar_url;

  final String location;
  final int followers;
  final int following;
  final String bio;
  final int public_repos;
  final int public_gists;
  final String updated_at;
  final String followers_url;
  final String following_url;

  UserDetails(
      {this.name,
      this.company,
      this.avatar_url,
      this.location,
      this.followers,
      this.following,
      this.bio,
      this.public_repos,
      this.public_gists,
      this.updated_at,
      this.followers_url,
      this.following_url});

  UserDetails.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        company = data['company'],
        avatar_url = data['avatar_url'],
        location = data['location'],
        followers = data['followers'],
        following = data['following'],
        bio = data['bio'],
        public_repos = data['public_repos'],
        public_gists = data['public_gists'],
        updated_at = data['updated_at'],
        followers_url = data['followers_url'],
        following_url = data['following_url'];
}
