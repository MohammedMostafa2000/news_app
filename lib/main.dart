import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme_manager.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/provider/sources_view_provider.dart';
import 'package:news_app/provider/tav_view_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabViewProvider()),
        ChangeNotifierProvider(create: (context) => SourcesViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.mainLayout,
        onGenerateRoute: RoutesManager.router,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.light,
        locale: const Locale('en'),
      ),
    );
  }
}

extension ContextEx on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
