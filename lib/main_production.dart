import 'package:news_clean_architecture/app.dart';
import 'package:news_clean_architecture/bootstrap.dart';
import 'package:news_clean_architecture/common/common.dart';

void main() {
  Config.flavor = Flavor.production;
  bootstrap(
    () => const App(),
    Flavor.production,
  );
}
