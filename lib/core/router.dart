import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/splash/splash_screen.dart';
import '../features/home/home_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/hadith/hadith_detail_screen.dart';
import '../features/hadith/hadith_list_screen.dart';
import '../features/search/search_screen.dart';
import '../features/bookmarks/bookmarks_screen.dart';
import '../features/collections/collections_screen.dart';
import '../features/collections/collection_detail_screen.dart';
import '../features/notes/notes_screen.dart';
import '../features/about/about_screen.dart';
import '../features/more_apps/more_apps_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/onboarding/language_select_screen.dart';
import '../widgets/banner_ad_widget.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: child,
      // Persistent Adaptive Banner: Remains mounted across all app shell routes.
      // 1. Zero flicker/delay when switching screens.
      // 2. High Viewability & High eCPM (Continuous impression time counted by AdMob).
      // 3. AdMob automatically rotates fresh ads smoothly in place according to AdMob Console refresh interval.
      // 4. Zero space occupied if no ad is filled (SizedBox.shrink).
      bottomNavigationBar: const BannerAdWidget(),
    );
  }
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/language-select',
      builder: (context, state) => const LanguageSelectScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: 'search',
              builder: (context, state) => const SearchScreen(),
            ),
            GoRoute(
              path: 'bookmarks',
              builder: (context, state) => const BookmarksScreen(),
            ),
            GoRoute(
              path: 'collections',
              builder: (context, state) => const CollectionsScreen(),
            ),
            GoRoute(
              path: 'notes',
              builder: (context, state) => const NotesScreen(),
            ),
            GoRoute(
              path: 'collections/:id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id']!);
                return CollectionDetailScreen(collectionId: id);
              },
            ),
            GoRoute(
              path: 'about',
              builder: (context, state) => const AboutScreen(),
            ),
            GoRoute(
              path: 'more-apps',
              builder: (context, state) => const MoreAppsScreen(),
            ),
            GoRoute(
              path: 'chapterList/:chapterId',
              builder: (context, state) {
                final chapterId = int.parse(state.pathParameters['chapterId']!);
                return HadithListScreen(chapterId: chapterId);
              },
            ),
            GoRoute(
              path: 'chapter/:chapterId',
              builder: (context, state) {
                final chapterId = int.parse(state.pathParameters['chapterId']!);
                final startIndex =
                    int.tryParse(state.uri.queryParameters['startIndex'] ?? '0') ??
                    0;
                return HadithDetailScreen(
                  chapterId: chapterId,
                  startIndex: startIndex,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
