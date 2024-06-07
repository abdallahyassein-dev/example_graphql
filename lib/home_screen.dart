import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/models/all_countries_model.dart';
import 'package:graphql_test/queries/queries.dart';
import 'package:graphql_test/widgets/country_item_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AllCountries? allCountriesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Countries GraphQL Flutter Example",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(allCountries),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                result.exception!.graphqlErrors[0].message.toString(),
                textAlign: TextAlign.center,
              )),
            );
          }

          if (result.data != null) {
            allCountriesModel = AllCountries.fromJson(result.data!);

            return ListView.builder(
                itemCount: allCountriesModel!.countries!.length,
                itemBuilder: (context, index) {
                  return CountryItemWidget(
                    country: allCountriesModel!.countries![index],
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
