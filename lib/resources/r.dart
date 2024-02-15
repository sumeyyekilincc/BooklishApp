import 'package:books/resources/drawable.dart';


class R {
  static void refreshClass() {
    _drawable = null;
  }

  static Drawable? _drawable;
  static Drawable get drawable => _drawable ??= Drawable();
   
   
}
