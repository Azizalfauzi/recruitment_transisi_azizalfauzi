part of 'shared.dart';

const double defaultMargin = 18.0;
const double defaultRadius = 18.0;

class MyUtility {
  BuildContext context;

  MyUtility(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
