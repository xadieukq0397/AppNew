final String tableProvinces = 'provinces';

class ProvinceField {
  static final List<String> values = [provinceId, name, slug, type];
  static final String provinceId = 'provinceId';
  static final String name = 'name';
  static final String slug = 'slug';
  static final String type = 'type';
}

class Province {
  Province({
    required this.name,
    required this.slug,
    required this.type,
    required this.provinceId,
  });
  final String? name;
  final String? slug;
  final String? type;
  final String? provinceId;

  static Province fromJson(Map<String, dynamic> json) => Province(
        name: json["name"],
        slug: json["slug"],
        type: typeValues.map[json["type"]]!,
        provinceId: json["code"] ?? json["provinceId"],
      );

  Map<String, dynamic> toJson() => {
        ProvinceField.name: name,
        ProvinceField.slug: slug,
        ProvinceField.type: typeValues.reverse[type],
        ProvinceField.provinceId: provinceId,
      };
}

Map<String, dynamic> typeProvinces = {
  "thanh-pho": "Thành Phố",
  "tinh": "Tỉnh",
};

final typeValues = EnumValues(
    {"thanh-pho": typeProvinces['thanh-pho'], "tinh": typeProvinces['tinh']});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
