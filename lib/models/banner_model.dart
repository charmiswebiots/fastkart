/*

class BannerModel {
  BannerModel({
    required this.title,
    required this.description,
    required this.backgroundImage,
    required this.buttonTitle
  });

  final String title;
  final String description;
  final String backgroundImage;
  final String buttonTitle;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    backgroundImage:
    json["backgroundImage"] ?? "",
    buttonTitle: json["buttonTitle"] ?? ""
  );
}*/

class BannerModel {
  BannerModel(this.title, this.description, this.backgroundImage, this.buttonTitle);

  final String title;
  final String description;
  final String backgroundImage;
  final String buttonTitle;
}