import 'package:emi_calculator/core/bloc/app_bloc.dart';
import 'package:emi_calculator/core/enum/app_enum.dart';
import 'package:emi_calculator/core/styles/app_theme.dart';
import 'package:emi_calculator/di/di.dart';
import 'package:emi_calculator/i18n/strings.g.dart';
import 'package:emi_calculator/routers/app_router.dart';
import 'package:emi_calculator/routers/app_routes_observers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BuildContext? globalContext;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = getIt<AppRouter>();
  final appBloc = getIt<AppBloc>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    appBloc.setAppTheme(AppThemMode.system);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => appBloc,
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.appThemMode != current.appThemMode,
        builder: (context, state) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(360, 800),
            builder: (_, child) => MaterialApp.router(
              locale: TranslationProvider.of(context).flutterLocale,
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocaleUtils.supportedLocales,
              themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              routerConfig: _appRouter.config(
                navigatorObservers: () => [AppRouteObserver()],
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                globalContext = context;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  getIt<AppBloc>().initial();
                });
                return child!;
              },
            ),
          );
        },
      ),
    );
  }
}
