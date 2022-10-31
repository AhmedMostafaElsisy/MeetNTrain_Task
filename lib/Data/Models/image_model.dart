List<ImagesModel> imageListFromJson(List str) =>
    List<ImagesModel>.from(str.map((x) => ImagesModel.fromJson(x)));

class ImagesModel {
  String? url;

  ImagesModel({required String url});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(url: json['url']);
  }
}
