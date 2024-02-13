import 'package:news_clean_architecture/app.dart';
import 'package:news_clean_architecture/bootstrap.dart';
import 'package:news_clean_architecture/common/variable.dart';

void main() {
  bootstrap(
    () => const App(),
    Flavor.development,
  );
}
