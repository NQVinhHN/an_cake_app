import 'package:an_cake_app/models/notification_state.dart';
import 'package:an_cake_app/theme/theme_constants.dart';
import 'package:an_cake_app/theme/theme_manager.dart';
import 'package:an_cake_app/translations/codegen_loader.g.dart';
import 'package:an_cake_app/views/cart_screen/widget/cart_state.dart';
import 'package:an_cake_app/views/login_screen/components/ls_provider.dart';
import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/image_gallery_provider.dart';
import 'package:an_cake_app/views/main_screen/components/trending_screen/components/add_product_image_provider.dart';
import 'package:an_cake_app/views/main_screen/main_bottom_nav_bar.dart';
import 'package:an_cake_app/views/user_detail_screen/components/lower_half_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/login_using_sms_provider.dart';
import 'image_avatar_provider.dart';
import 'models/cake_list_gridviews.dart';
import 'models/trending_screen_list_gridviews_product.dart';
import 'my_custom_scroll_behavior.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en'),
      saveLocale: false,
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LowerHalfProvider>(
          create: (context) => LowerHalfProvider(),
        ),
        ChangeNotifierProvider<NotificationState>(
          create: (context) => NotificationState(),
        ),
        ChangeNotifierProvider<LoginScreenProvider>(
          create: (context) => LoginScreenProvider(),
        ),
        ChangeNotifierProvider<LoginUsingSMSProvider>(
          create: (context) => LoginUsingSMSProvider(),
        ),
        ChangeNotifierProvider<CartState>(
          create: (context) => CartState(),
        ),
        ChangeNotifierProvider<ImageAvatarProvider>(
          create: (context) => ImageAvatarProvider(),
        ),
        ChangeNotifierProvider<CakeListGridView>(
          create: (context) => CakeListGridView(),
        ),
        ChangeNotifierProvider<ImageGalleryProvider>(
          create: (context) => ImageGalleryProvider(),
        ),
        ChangeNotifierProvider<ProductList>(
          create: (context) => ProductList(),
        ),
        ChangeNotifierProvider<AddProductImageProvider>(
          create: (context) => AddProductImageProvider(),
        ),
        ChangeNotifierProvider<ThemeManager>(
          create: (context) => ThemeManager(),
        ),
      ],
      child: Consumer<ThemeManager>(builder: (context, value, child) {
        return MaterialApp(
          theme: value.themeDark ? darkTheme : lightTheme,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          home: const MainBottomNavBar(),
        );
      }),
    );
  }
}

// supportedLocales: const [
//   Locale('en'),
//   Locale('ar'),
//   Locale('es'),
//   Locale('el'),
//   Locale('nb'),
//   Locale('nn'),
//   Locale('pl'),
//   Locale('pt'),
//   Locale('ru'),
//   Locale('hi'),
//   Locale('ne'),
//   Locale('uk'),
//   Locale('hr'),
//   Locale('tr'),
//   Locale.fromSubtags(
//       languageCode: 'zh',
//       scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
//   Locale.fromSubtags(
//       languageCode: 'zh',
//       scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
// ],
// localizationsDelegates: const [
//   CountryLocalizations.delegate,
//   GlobalMaterialLocalizations.delegate,
//   GlobalCupertinoLocalizations.delegate,
//   GlobalWidgetsLocalizations.delegate,
// ],
