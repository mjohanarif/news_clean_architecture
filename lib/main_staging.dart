import 'package:mason_very_good/bootstrap.dart';
import 'package:mason_very_good/common/variable.dart';
import 'package:mason_very_good/presentation/presentation.dart';

void main() {
  bootstrap(
    () => const NewsPage(),
    Flavor.staging,
  );
}
