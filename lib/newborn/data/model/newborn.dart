import 'dart:convert';

NewBorn topLevelFromJson(String str) => NewBorn.fromJson(json.decode(str));

String topLevelToJson(NewBorn data) => json.encode(data.toJson());

class NewBorn {
  NewBorn({
    required this.data,
    required this.meta,
    required this.links,
  });

  List<Datum> data;
  Meta meta;
  NewBornLinks links;

  factory NewBorn.fromJson(Map<String, dynamic> json) => NewBorn(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
    links: NewBornLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
    "links": links.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.links,
    required this.attributes,
  });

  String? id;
  String? type;
  DatumLinks? links;
  Attributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    links: DatumLinks.fromJson(json["links"]),
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "links": links?.toJson(),
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  Attributes({
    this.gender,
    this.gestation,
    this.firstCryPushDate,
    this.name,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  String? gender;
  DateTime? gestation;
  dynamic firstCryPushDate;
  String? name;
  int userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    gender: json["gender"],
   // gestation: DateTime.parse(json["gestation"]),
    firstCryPushDate: json["first_cry_push_date"],
    name: json["name"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "gestation": gestation?.toIso8601String(),
    "first_cry_push_date": firstCryPushDate,
    "name": name,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class DatumLinks {
  DatumLinks({
    required this.self,
  });

  String self;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
  };
}

class NewBornLinks {
  NewBornLinks({
    required this.first,
    required this.last,
  });

  String first;
  String last;

  factory NewBornLinks.fromJson(Map<String, dynamic> json) => NewBornLinks(
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
  };
}

class Meta {
  Meta({
    required this.recordCount,
  });

  int recordCount;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    recordCount: json["record_count"],
  );

  Map<String, dynamic> toJson() => {
    "record_count": recordCount,
  };
}
