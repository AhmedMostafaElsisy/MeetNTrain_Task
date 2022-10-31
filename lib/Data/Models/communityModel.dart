class CommunityModel {
  int? id;
  String? title;
  String? image;
  String? bio;
  int? points;
  int? ratingCount;
  int? connectionCount;
  int? eventCount;
  String? profilePicture;
  String? state;

  CommunityModel(
      {this.id,
      this.title,
      this.image,
      this.bio,
      this.points,
      this.ratingCount,
      this.connectionCount,
      this.eventCount,
      this.profilePicture,
      this.state});

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      bio: json['bio'],
      points: json['points'],
      ratingCount: json['rating_count'],
      connectionCount: json['connection_count'],
      eventCount: json['event_count'],
      profilePicture: json['profile_picture'],
      state: json['state'],
    );
  }
}
