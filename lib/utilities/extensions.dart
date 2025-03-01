import 'package:flutteristas/app/app.dart';
import 'package:flutteristas/app/data_fetcher.dart';
import 'package:jaspr/jaspr.dart';

extension DataFetcherBuildContextExtension on BuildContext {
  DataFetcher get dataFetcher => App.dataFetcherOf(this);
}
