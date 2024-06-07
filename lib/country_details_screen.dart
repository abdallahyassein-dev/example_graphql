import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/models/all_countries_model.dart';
import 'package:graphql_test/models/country_model_data.dart';
import 'package:graphql_test/queries/queries.dart';

class CountryDetailsScreen extends StatefulWidget {
  final Country country;
  const CountryDetailsScreen({super.key, required this.country});
  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  CountryData? countryDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          widget.country.name!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getCountryQuery(widget.country.code!)),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }

          if (result.data != null) {
            log(result.data.toString());
            countryDetails = CountryData.fromJson(result.data!);
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(countryDetails!.country!.emoji ?? "",
                      style: const TextStyle(fontSize: 150)),
                  const SizedBox(width: 10),
                  SizedBox(
                      child: Text(countryDetails!.country!.name ?? "",
                          style: const TextStyle(fontSize: 20))),
                  const SizedBox(width: 10),
                  SizedBox(
                      child: Text(
                          "Capital: ${countryDetails!.country!.capital ?? ""}",
                          style: const TextStyle(fontSize: 20))),
                  const SizedBox(width: 10),
                  SizedBox(
                      child: Text(
                          "Currency: ${countryDetails!.country!.currency ?? ""}",
                          style: const TextStyle(fontSize: 20))),
                ],
              ),
            );
            //allCountriesModel = AllCountries.fromJson(result.data!);
          }

          return Container();
        },
      ),
    );
  }
}
