class CustomAssets {
  /// singltone object to acces any object of crrent class
  factory CustomAssets() => CustomAssets._internal();

  //
  CustomAssets._internal();

  static const String imgBase = "assets/images/";

  static const String loginPage = "${imgBase}back.png";
  static const String imgUnavailable = "${imgBase}img_not_available.jpeg";
  static const String splash = "${imgBase}splash.png";
  static const String google = "${imgBase}google.png";
}
