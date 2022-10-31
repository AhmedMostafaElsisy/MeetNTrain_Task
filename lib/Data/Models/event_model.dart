import 'package:meet_n_train_task/Data/Models/tag_model.dart';
import 'package:meet_n_train_task/Data/Models/user_base_model.dart';

import 'image_model.dart';

List<EventModel> eventListFromJson(List str) =>
    List<EventModel>.from(str.map((x) => EventModel.fromJson(x)));

class EventModel {
  int? id;
  String? title;
  String? description;
  int? spots;
  int? price;
  double? lat;
  double? lon;
  String? placeName;
  String? featuredImage;
  String? date;
  int? tagId;
  int? createdBy;
  int? communityId;
  List<ImagesModel>? images;
  String? finishDate;
  int? locationId;
  bool? isPrivate;
  String? paymentMethod;
  bool? receiveUpdates;
  String? state;
  bool? isCheckedIn;
  bool? isFeatured;
  int? viewersCount;
  List<UserModel>? users;
  // CommunityModel? community;
  TagModel? tag;
  bool? isWaiting;
  bool? isJoined;
  int? joinedUsersCount;
  int? checkedInCount;
  int? paidAmount;
  int? ownerEarnings;

  EventModel(
      {this.id,
      this.title,
      this.description,
      this.spots,
      this.price,
      this.lat,
      this.lon,
      this.placeName,
      this.featuredImage,
      this.date,
      this.tagId,
      this.createdBy,
      this.communityId,
      this.images,
      this.finishDate,
      this.locationId,
      this.isPrivate,
      this.paymentMethod,
      this.receiveUpdates,
      this.state,
      this.isCheckedIn,
      this.isFeatured,
      this.viewersCount,
      this.users,
      // this.community,
      this.tag,
      this.isWaiting,
      this.isJoined,
      this.joinedUsersCount,
      this.checkedInCount,
      this.paidAmount,
      this.ownerEarnings});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      spots: json['spots'],
      price: json['price'],
      lat: json['lat'],
      lon: json['lon'],
      placeName: json['placeName'],
      featuredImage: json['featuredImage'],
      date: json['date'],
      tagId: json['tagId'],
      createdBy: json['createdBy'],
      communityId: json['communityId'],
      images: imageListFromJson(json["images"]),
      finishDate: json['finish_date'] ?? DateTime.now().toString(),
      locationId: json['location_id'],
      isPrivate: json['is_private'],
      paymentMethod: json['paymentMethod'],
      receiveUpdates: json['receiveUpdates'],
      state: json['state'],
      isCheckedIn: json['isCheckedIn'],
      isFeatured: json['isFeatured'],
      viewersCount: json['viewersCount'],
      users: userListFromJson(json["users"]),
      // community: CommunityModel.fromJson(json['community']),
      tag: TagModel.fromJson(json['tag']),
      isWaiting: json['isWaiting'],
      isJoined: json['isJoined'],
      joinedUsersCount: json['joinedUsersCount'],
      checkedInCount: json['checkedInCount'],
      paidAmount: json['paidAmount'],
      ownerEarnings: json['ownerEarnings'],
    );
  }
}
