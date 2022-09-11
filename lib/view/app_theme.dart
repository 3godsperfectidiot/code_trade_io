import 'package:flutter/material.dart';

const Map<int, Color> mainColorMap = {
  50: Color(0xE40B5A47),
  100: Color(0xCC0B5A47),
  300: Color(0x990B5A47),
  200: Color(0x660B5A47),
  400: Color(0x330B5A47),
  500: Color(0xFF0B5A47),
  600: Color(0x180B5A47),
  700: Color(0x330B5A47),
  800: Color(0x4B0B5A47),
  900: Color(0x660B5A47),
};

const mainColor = Color(0XFF0B5A47);

final mainColorSwatch = MaterialColor(mainColor.value, mainColorMap);

ThemeData appTheme() => ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: mainColorSwatch,
      ).copyWith(secondary: Colors.orange),
      scaffoldBackgroundColor: const Color(0XFFF6F5F7),
      splashColor: Colors.white,
      primaryColor: mainColor,
      primarySwatch: mainColorSwatch,
      iconTheme: const IconThemeData(color: Color(0XFFB1B7C3)),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: mainColor,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(mainColor),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 48)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        labelStyle: const TextStyle(fontSize: 18, color: Color(0XFFD5D5D5)),
        hintStyle: const TextStyle(fontSize: 18, color: Color(0XFFD5D5D5)),
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0XFFB1B7C3), width: 0.25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0XFFB1B7C3), width: 0.25),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0XFFB1B7C3), width: 0.25),
        ),
        suffixIconColor: const Color(0xffD5D5D5),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(mainColor),
          side: MaterialStateProperty.all(
            const BorderSide(color: mainColor, width: 1),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(double.infinity, 48),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.orange),
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.orange, fontSize: 18),
          ),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        headline2: TextStyle(color: mainColor, fontSize: 20),
        headline3: TextStyle(color: Colors.black, fontSize: 14),
        headline4: TextStyle(color: Color(0XFF345251), fontSize: 14),
        headline5: TextStyle(
            color: mainColor, fontWeight: FontWeight.bold, fontSize: 18),
        headline6: TextStyle(color: Color(0XFF345251), fontSize: 16),
        bodyText1: TextStyle(color: Color(0XFF345251), fontSize: 16),
        bodyText2: TextStyle(color: Color(0XFF345251), fontSize: 16),
        caption: TextStyle(color: Colors.black87, fontSize: 16),
        subtitle1: TextStyle(
            color: mainColor, fontSize: 16, fontWeight: FontWeight.bold),
        subtitle2: TextStyle(color: Colors.grey, fontSize: 14),
        button: TextStyle(fontSize: 18, color: Colors.white),
        labelMedium: TextStyle(color: Color(0XFF345251), fontSize: 14),
        overline: TextStyle(color: Color(0XFF345251), fontSize: 14),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: mainColor,
        selectedLabelStyle: TextStyle(color: Color(0XFF345251), fontSize: 14),
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
      ),
      popupMenuTheme: const PopupMenuThemeData(
        textStyle: TextStyle(color: Colors.black, fontSize: 12),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(const Color(0XFFB1B7C3)),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(Colors.orange),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.all(mainColor),
      ),
      sliderTheme: const SliderThemeData(
        valueIndicatorTextStyle: TextStyle(fontSize: 12),
      ),
    );
