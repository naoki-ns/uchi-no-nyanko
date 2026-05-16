import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/cat/view/cat_profile_screen.dart';
import '../features/catbook/view/catbook_detail_screen.dart';
import '../features/catbook/view/catbook_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/room/view/room_edit_screen.dart';
import '../features/settings/view/settings_screen.dart';
import '../features/shop/view/shop_screen.dart';
import '../shared/widgets/main_shell.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catbook',
                builder: (context, state) => const CatbookScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) => CatbookDetailScreen(
                      catId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/shop',
                builder: (context, state) => const ShopScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/cat/:id',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: CatProfileScreen(catId: state.pathParameters['id']!),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeOut)),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/room/edit',
        builder: (context, state) => const RoomEditScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
