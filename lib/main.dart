import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = secondHandFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'second-hand',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'allchats': AllchatsWidget(),
      'Profile08': Profile08Widget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          desktop: false,
        ),
        child: FloatingNavbar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFF300F9),
          unselectedItemColor: FlutterFlowTheme.of(context).lineColor,
          selectedBackgroundColor: Color(0x00000000),
          borderRadius: 60.0,
          itemBorderRadius: 8.0,
          margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          width: MediaQuery.of(context).size.width * 0.9,
          elevation: 0.0,
          items: [
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? Color(0xFFF300F9)
                        : FlutterFlowTheme.of(context).lineColor,
                    size: 24.0,
                  ),
                  Text(
                    '  Inicio',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 0
                          ? Color(0xFFF300F9)
                          : FlutterFlowTheme.of(context).lineColor,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    currentIndex == 1
                        ? Icons.chat_bubble_rounded
                        : Icons.chat_bubble_outline,
                    color: currentIndex == 1
                        ? Color(0xFFF300F9)
                        : FlutterFlowTheme.of(context).lineColor,
                    size: 24.0,
                  ),
                  Text(
                    'Mensajes',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 1
                          ? Color(0xFFF300F9)
                          : FlutterFlowTheme.of(context).lineColor,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: currentIndex == 2
                        ? Color(0xFFF300F9)
                        : FlutterFlowTheme.of(context).lineColor,
                    size: 24.0,
                  ),
                  Text(
                    'Perfil',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 2
                          ? Color(0xFFF300F9)
                          : FlutterFlowTheme.of(context).lineColor,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
