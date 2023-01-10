import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nitnotes/models/palleteColor.dart';
import 'package:nitnotes/routes/appRoute.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
          unselectedWidgetColor: Colors.white,
          indicatorColor: PrimaryColor().racingGreen,
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: PrimaryColor().mustard),
          scaffoldBackgroundColor: PrimaryColor().racingGreen,
          brightness: Brightness.light,
          splashColor: PrimaryColor().softGreen,
          textTheme: GoogleFonts.montserratTextTheme()
              .copyWith(bodyText2: TextStyle(color: Colors.white)),
          hintColor: PrimaryColor().softGreen,
          inputDecorationTheme: InputDecorationTheme(border: InputBorder.none)),

      // darkTheme: ThemeData(
      //     indicatorColor: PrimaryColor().racingGreen,
      //     iconTheme: Theme.of(context).iconTheme.copyWith(
      //           color: PrimaryColor().sweetRed,
      //         ),
      //     scaffoldBackgroundColor: PrimaryColor().racingGreen,
      //     splashColor: SecondaryColor().sweetRed,
      //     textTheme: GoogleFonts.montserratTextTheme().copyWith(
      //         bodyText2: TextStyle(color: SecondaryColor().sweetRed))),
      initialRoute: AppPages.initialPage,
      getPages: AppPages.routes,
    );
  }
}
