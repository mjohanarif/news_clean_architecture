import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/presentation/presentation.dart';
import 'package:news_clean_architecture/presentation/ui/section/section.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchField(),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: state.result.articles![index],
                        );
                      },
                      itemCount: state.result.articles?.length ?? 0,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
