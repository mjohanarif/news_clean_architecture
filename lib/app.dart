import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_clean_architecture/injection.dart';
import 'package:news_clean_architecture/presentation/presentation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (_) => locator<NewsBloc>()..add(const OnGetNews()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const NewsPage(),
      ),
    );
  }
}
