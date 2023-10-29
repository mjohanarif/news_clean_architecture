import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/presentation/presentation.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer();
    return Container(
      margin: const EdgeInsets.all(20).copyWith(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          debouncer.run(() {
            if (value.isNotEmpty) {
              context.read<NewsBloc>().add(
                    OnGetSearchNews(value),
                  );
            } else {
              context.read<NewsBloc>().add(
                    const OnGetNews(),
                  );
            }
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(
            15,
          ),
          hintText: 'Search News',
          hintStyle: const TextStyle(
            color: Color(
              0xffDDDADA,
            ),
            fontSize: 14,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class Debouncer {
  Debouncer({
    this.milliseconds = 500,
  });
  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
