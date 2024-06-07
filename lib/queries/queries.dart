const String allCountries = r'''
{
  countries {
    code
    name
    emoji
  }
}
''';

String getCountryQuery(String code) {
  return '''
query GetCountry {
  country(code: "$code") {
    name
    capital
    emoji
    currency
    languages {
      code
    }
  }
}
''';
}
