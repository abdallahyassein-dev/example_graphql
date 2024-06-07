// To parse this JSON AllCountries, do
//
//     final allCountriesModel = allCountriesModelFromJson(jsonString);

class AllCountries {
  List<Country>? countries;

  AllCountries({
    this.countries,
  });

  factory AllCountries.fromJson(Map<String, dynamic> json) => AllCountries(
        countries: json["countries"] == null
            ? []
            : List<Country>.from(
                json["countries"]!.map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": countries == null
            ? []
            : List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class Country {
  String? code;
  String? name;
  String? emoji;

  Country({
    this.code,
    this.name,
    this.emoji,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        emoji: json["emoji"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "emoji": emoji,
      };
}
