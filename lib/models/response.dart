class ResponseModel {
  ResponseModel({
    this.data,
  });

  String? kind;
  ResponseModelData? data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: ResponseModelData.fromJson(json["data"]),
      );
}

class ResponseModelData {
  ResponseModelData({
    this.after,
    required this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  dynamic after;
  int dist;
  String? modhash;
  String? geoFilter;
  List<Child>? children;
  String? before;

  factory ResponseModelData.fromJson(Map<String, dynamic> json) =>
      ResponseModelData(
        after: json["after"],
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        before: json["before"],
      );
}

class Child {
  Child({
    this.data,
  });

  ChildData? data;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        data: ChildData.fromJson(json["data"]),
      );
}

class ChildData {
  ChildData({
    this.subreddit,
    this.title,
    this.name,
    this.category,
    this.score,
    this.thumbnail,
    this.likes,
    this.allAwardings,
    this.numComments,
  });

  String? subreddit;
  String? title;
  String? name;
  String? category;
  int? score;
  String? thumbnail;
  dynamic likes;
  List<AllAwarding>? allAwardings;
  int? numComments;

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
        subreddit: json["subreddit"],
        title: json["title"],
        name: json["name"],
        category: json["category"],
        score: json["score"],
        thumbnail: json["thumbnail"],
        likes: json["likes"],
        allAwardings: List<AllAwarding>.from(
            json["all_awardings"].map((x) => AllAwarding.fromJson(x))),
        numComments: json["num_comments"],
      );
}

class AllAwarding {
  AllAwarding({
    this.description,
  });

  String? description;

  factory AllAwarding.fromJson(Map<String, dynamic> json) => AllAwarding(
        description: json["description"],
      );
}
