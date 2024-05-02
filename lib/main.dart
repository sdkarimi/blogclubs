import 'package:blogclubs/Home.dart';
import 'package:blogclubs/Profile.dart';
import 'package:blogclubs/articles.dart';
import 'package:blogclubs/gen/fonts.gen.dart';
import 'package:blogclubs/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const defultFontFamily = 'Avenir';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
    return MaterialApp(
      title: 'blog club',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w400,
          )))),
          appBarTheme: const AppBarTheme(
            titleSpacing: 32,
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: defultFontFamily,
                color: secondaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w200),
            titleLarge: TextStyle(
                fontFamily: defultFontFamily,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
                fontSize: 18),
            titleSmall: TextStyle(
                fontFamily: defultFontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryTextColor),
            bodyMedium: TextStyle(
                fontFamily: defultFontFamily,
                color: secondaryTextColor,
                fontSize: 12),
            headlineSmall: TextStyle(
                fontFamily: defultFontFamily,
                fontSize: 18,
                color: primaryTextColor,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontFamily: defultFontFamily,
                fontSize: 24,
                color: primaryTextColor,
                fontWeight: FontWeight.w700),
            bodySmall: TextStyle(
                fontFamily: defultFontFamily,
                fontWeight: FontWeight.w700,
                color: secondaryTextColor,
                fontSize: 12),
            bodyLarge: TextStyle(
                fontFamily: defultFontFamily,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontSize: 14),
          ),
          colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              background: Color(0xffFBFCFF),
              surface: Colors.white,
              onBackground: primaryTextColor),
          snackBarTheme: const SnackBarThemeData(backgroundColor: primaryColor),
          useMaterial3: false),
      // home: Stack(children: [
      //   const Positioned.fill(child: HomeScreen()),
      //   Positioned(bottom: 0, left: 0, right: 0, child: _BottomNavigation())
      // ]),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const homeIndex = 0;
const articleIndex = 1;
const searchIndex = 2;
const profileIndex = 3;
const double bottomNavigationHeghit = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();
  List<int> _history = [];
  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _profileKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(children: [
          Positioned.fill(
            bottom: bottomNavigationHeghit,
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                // HomeScreen(),
                // ArticleScreen(),
                // SearchScreen(),
                // ProfileScreen(),
                _navigator(_homeKey,homeIndex,const HomeScreen()),
                _navigator(_articleKey,articleIndex,const ArticleScreen()),
                _navigator(_searchKey,searchIndex,const SearchScreen()),
                _navigator(_profileKey,profileIndex,const ProfileScreen()),

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomNavigation(
              onTab: (int index) {
                setState(() {
                  _history.remove(selectedScreenIndex);
                  _history.add(selectedScreenIndex);
                  selectedScreenIndex = index;
                });
              },
              selectedIndex: selectedScreenIndex,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _navigator(GlobalKey key,int index,Widget child) {
    return key.currentState==null && selectedScreenIndex!=index ?  Container() : Navigator(
                  key: key,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Offstage(
                            offstage: selectedScreenIndex != index,
                            child:  child),
                      ));
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Search Screen",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTab;
  final int selectedIndex;

  const _BottomNavigation(
      {super.key, required this.onTab, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 65,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9b8487).withOpacity(0.3))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavigationItem(
                  iconFileName: 'Home.png',
                  activeIconFileName: 'Home.png',
                  title: 'Home',
                  onTap: () {
                    onTab(homeIndex);
                  },
                  isActive: selectedIndex == homeIndex,
                ),
                BottomNavigationItem(
                  iconFileName: 'Articles.png',
                  activeIconFileName: 'Articles.png',
                  title: 'Article',
                  onTap: () {
                    onTab(articleIndex);
                  },
                  isActive: selectedIndex == articleIndex,
                ),
                Expanded(child: Container()),
                BottomNavigationItem(
                  iconFileName: 'Search.png',
                  activeIconFileName: 'Search.png',
                  title: 'Search',
                  onTap: () {
                    onTab(searchIndex);
                  },
                  isActive: selectedIndex == searchIndex,
                ),
                BottomNavigationItem(
                  iconFileName: 'Menu.png',
                  activeIconFileName: 'Menu.png',
                  title: 'Menu',
                  onTap: () {
                    onTab(profileIndex);
                  },
                  isActive: selectedIndex == profileIndex,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 65,
            height: 85,
            alignment: Alignment.topCenter,
            child: Container(
                height: bottomNavigationHeghit,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(color: Colors.white, width: 4)
                    // color: Colors.lightBlue,
                    ),
                child: Image.asset('assets/img/icons/plus.png')),
          ),
        )
      ]),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.bodySmall!.color),
            )
          ],
        ),
      ),
    );
  }
}
