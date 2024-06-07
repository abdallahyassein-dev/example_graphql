import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/graphQlConfig/graph_ql_config.dart';
import 'package:graphql_test/home_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GraphQL Flutter Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
