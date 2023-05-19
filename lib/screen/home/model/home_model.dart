class HomeModel {
    String name;

    HomeModel({
        required this.name,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}