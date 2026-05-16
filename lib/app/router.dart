import 'package:go_router/go_router.dart';

import '../features/cat/view/cat_profile_screen.dart';
import '../features/catbook/view/catbook_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/room/view/room_edit_screen.dart';
import '../features/shop/view/shop_screen.dart';

// タスク04で Riverpod プロバイダーに移行予定
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cat/:id',
      builder: (context, state) => CatProfileScreen(
        catId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/room/edit',
      builder: (context, state) => const RoomEditScreen(),
    ),
    GoRoute(
      path: '/catbook',
      builder: (context, state) => const CatbookScreen(),
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShopScreen(),
    ),
  ],
);
