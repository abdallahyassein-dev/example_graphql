import 'package:flutter/material.dart';
import 'package:graphql_test/country_details_screen.dart';
import 'package:graphql_test/models/all_countries_model.dart';

class CountryItemWidget extends StatelessWidget {
  final Country country;
  const CountryItemWidget({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CountryDetailsScreen(country: country);
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
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
        child: Row(
          children: [
            Text(country.emoji ?? "", style: const TextStyle(fontSize: 30)),
            const SizedBox(width: 10),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(country.name ?? "",
                    style: const TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
