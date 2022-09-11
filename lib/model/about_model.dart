class AboutModel {
  String title;
  List<AboutRow> rows;

  AboutModel({required this.title, required this.rows});

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        title: json["title"],
        rows:
            List<AboutRow>.from(json["rows"].map((x) => AboutRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
      };
}

class AboutRow {
  AboutRow({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  String title, description, imageUrl;

  factory AboutRow.fromJson(Map<String, dynamic> json) => AboutRow(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        imageUrl: json["imageHref"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imageHref": imageUrl,
      };
}
