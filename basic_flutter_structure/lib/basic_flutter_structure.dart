import 'dart:io';

class FlutterProjectGenerator {
  static createBaseStructure(String path) {
    final baseDir = Directory(path);

    // Create the base directory if it doesn't exist
    if (!baseDir.existsSync()) {
      baseDir.createSync(recursive: true);
    }

    final projectName = path.split('/').last.toString();

    // Create the necessary directories for the project
    Directory("$path/lib/common").createSync(recursive: true);
    Directory("$path/lib/data").createSync(recursive: true);
    Directory("$path/lib/view").createSync(recursive: true);
    Directory("$path/lib/view/interfaces/onboarding")
        .createSync(recursive: true);
    Directory("$path/lib/view/widgets").createSync(recursive: true);

    // Create the necessary files for the project
    File("$path/lib/common/helper.dart").createSync(recursive: true);
    File("$path/lib/common/theme.dart").createSync(recursive: true);
    File("$path/lib/common/variable_globale.dart").createSync(recursive: true);
    File("$path/lib/data/api.dart").createSync(recursive: true);
    File("$path/lib/data/shared_preferences.dart").createSync(recursive: true);
    File("$path/lib/view/manage.dart").createSync(recursive: true);
    File("$path/lib/view/start.dart").createSync(recursive: true);
    File("$path/lib/view/interfaces/onboarding/onboarding_1.dart")
        .createSync(recursive: true);
    File("$path/lib/view/interfaces/onboarding/onboarding_2.dart")
        .createSync(recursive: true);
    File("$path/lib/view/interfaces/onboarding/onboarding_3.dart")
        .createSync(recursive: true);
    File("$path/lib/view/interfaces/onboarding/onboarding.dart")
        .createSync(recursive: true);
    File("$path/lib/view/interfaces/splash_screen.dart")
        .createSync(recursive: true);
    File("$path/lib/view/widgets/widget_navigation.dart")
        .createSync(recursive: true);

    // Write content to shared_preferences.dart
    File("$path/lib/data/shared_preferences.dart").writeAsStringSync("""
import 'package:shared_preferences/shared_preferences.dart';

// set string
Future<void> setString(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

// get string
Future<String?> getString(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

// set bool
Future<void> setBool(String key, bool value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

// get bool
Future<bool?> getBool(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}

// set double
Future<void> setDouble(String key, double value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble(key, value);
}

// get double
Future<double?> getDouble(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(key);
}

// set int
Future<void> setInt(String key, int value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}

// get int
Future<int?> getInt(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

// remove
Future<bool> removeShared(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove(key);
}
""");

    // Write content to manage.dart
    File("$path/lib/view/manage.dart").writeAsStringSync("""
import "package:$projectName/common/theme_app.dart";
import "package:$projectName/view/widget/widget_navigation.dart";
import "package:$projectName/view/widget/widget_text.dart";
import "package:$projectName/view/start.dart";
import "package:flutter/material.dart";

class Manage extends StatefulWidget {
  const Manage({super.key});

  @override
  ManageState createState() => ManageState();
}

class ManageState extends State<Manage> {
  int index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index == 0) {
          bool shouldExit = await _showExitConfirmationDialog(context);
          return shouldExit;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Start(),
            ),
          );
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Start(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                alignment: Alignment.bottomRight,
                child: ClipOval(
                  child: Image.asset(
                    "assets/image/appstore.png",
                    width: 38.0,
                  ),
                ),
              ),
            ),
            title: WidgetText.text(
              "App Title",
              size: 18.0,
            ),
            centerTitle: true,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: [
                    Center(),
                    Center(),
                    Center(),
                    Center(),
                  ][index],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 19.0,
                    horizontal: 33.0 / 2,
                  ),
                  decoration: BoxDecoration(
                      color: ThemeApp.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(99.0))),
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          decoration: BoxDecoration(
                              color:
                                  (index == 0) ? ThemeApp.secondaryColor : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(99.0))),
                          width: (MediaQuery.of(context).size.width - 33.0) / 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/navigation/home.png",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.contain,
                              ),
                              WidgetText.text(
                                "Accueil",
                                size: 8.0,
                                color: Colors.white,
                                fontWeightBold: false,
                                center: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          decoration: BoxDecoration(
                              color:
                                  (index == 1) ? ThemeApp.secondaryColor : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(99.0))),
                          width: (MediaQuery.of(context).size.width - 33.0) / 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/navigation/gift.png",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.contain,
                              ),
                              WidgetText.text(
                                "Tourisme",
                                size: 8.0,
                                color: Colors.white,
                                fontWeightBold: false,
                                center: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          decoration: BoxDecoration(
                              color:
                                  (index == 2) ? ThemeApp.secondaryColor : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(99.0))),
                          width: (MediaQuery.of(context).size.width - 33.0) / 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/navigation/maps-square.png",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.contain,
                              ),
                              WidgetText.text(
                                "Carte",
                                size: 8.0,
                                color: Colors.white,
                                fontWeightBold: false,
                                center: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          decoration: BoxDecoration(
                              color:
                                  (index == 3) ? ThemeApp.secondaryColor : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(99.0))),
                          width: (MediaQuery.of(context).size.width - 33.0) / 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/navigation/user.png",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.contain,
                              ),
                              WidgetText.text(
                                "Mon espace",
                                size: 8.0,
                                color: Colors.white,
                                fontWeightBold: false,
                                center: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ThemeApp.primaryColor.shade50,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    margin: const EdgeInsets.only(right: 10.0),
                    alignment: Alignment.bottomRight,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/logo.png",
                        width: 38.0,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: WidgetText.text(
                      "Voulez-vous sortir de l'application ?",
                      size: 16.0,
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const WidgetText.text(
                    "Non",
                    color: ThemeApp.primaryColor,
                    size: 14.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeApp.primaryColor,
                  ),
                  child: const WidgetText.text(
                    "Oui",
                    color: Colors.white,
                    size: 14.0,
                  ),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
""");

    // Write content to start.dart
    File("$path/lib/view/start.dart").writeAsStringSync("""
import "package:flutter/material.dart";
import 'package:$projectName/data/shared_preferences.dart';
import 'package:$projectName/view/manage.dart';
import 'package:$projectName/view/interfaces/onboarding/onboarding.dart';

class Start extends StatefulWidget {
  final int? index;
  const Start({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  StartState createState() => StartState();
}

class StartState extends State<Start> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    getBool("login").then((value) {
      if (value != null) {
        setState(() {
          isLogin = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? const Manage() : const Onboarding();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
""");

    // Write content to widget_navigation.dart
    File("$path/lib/view/widgets/widget_navigation.dart").writeAsStringSync("""
import "package:flutter/material.dart";

class WidgetNavigation {
  // Navigate to a new page with a custom animation
  static void navigateToNewPage(
      BuildContext context, Offset start, Offset end, Widget page,
      {bool replace = false}) {
    if (replace) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: start, end: end);
            var curvedAnimation =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            var offsetAnimation = tween.animate(curvedAnimation);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    } else {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: start, end: end);
            var curvedAnimation =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            var offsetAnimation = tween.animate(curvedAnimation);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    }
  }
}
""");

    // Write content to widget_text.dart
    File("$path/lib/view/widgets/widget_text.dart").writeAsStringSync("""
import "package:$projectName/common/theme_app.dart";
import "package:flutter/material.dart";
import "package:fontresoft/fontresoft.dart";

class WidgetText {
  static Widget text(
    String message, {
    bool fontWeightBold = false,
    Color? color,
    double size = 14.0,
    bool overflow = false,
    int maxLine = 1,
    bool center = false,
  }) {
    return Text(
      message,
      style: Font.poppins().copyWith(
        fontWeight: fontWeightBold ? FontWeight.bold : FontWeight.normal,
        color: color ?? ThemeApp.textColor,
        fontSize: size,
      ),
      overflow: overflow ? TextOverflow.ellipsis : null,
      maxLines: overflow ? maxLine : null,
      textAlign: center ? TextAlign.center : null,
    );
  }
}
""");

    // Write content to main.dart
    File("$path/main.dart").writeAsStringSync("""
import 'package:$projectName/common/theme_app.dart';
import 'package:$projectName/common/variable_globale.dart';
import 'package:$projectName/view/interfaces/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: VariableGlobale.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeApp.primaryColor),
        useMaterial3: true,
        fontFamily: FontResoft.poppins,
        package: FontResoft.package,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
""");
  }
}
