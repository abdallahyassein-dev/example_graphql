class CountryData {
  CountryDetails? country;

  CountryData({
    this.country,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        country: json["country"] == null
            ? null
            : CountryDetails.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
      };
}

class CountryDetails {
  String? name;
  String? capital;
  String? emoji;
  String? currency;
  List<Language>? languages;

  CountryDetails({
    this.name,
    this.capital,
    this.emoji,
    this.currency,
    this.languages,
  });

  factory CountryDetails.fromJson(Map<String, dynamic> json) => CountryDetails(
        name: json["name"],
        capital: json["capital"],
        emoji: json["emoji"],
        currency: json["currency"],
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capital": capital,
        "emoji": emoji,
        "currency": currency,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
      };
}

class Language {
  String? code;

  Language({
    this.code,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
