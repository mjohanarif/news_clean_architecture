import 'package:news_clean_architecture/bootstrap.dart';
import 'package:news_clean_architecture/common/variable.dart';
import 'package:news_clean_architecture/presentation/presentation.dart';

void main() {
  bootstrap(
    () => const NewsPage(),
    Flavor.production,
  );
}
