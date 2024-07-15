import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/features/add_child/presentation/add_child_code.dart';
import 'package:kidbank/features/add_child/presentation/add_child_nickname.dart';
import 'package:kidbank/features/auth/presentation/screens/child_auth.dart';
import 'package:kidbank/features/auth/presentation/screens/child_auth_count.dart';
import 'package:kidbank/features/onboarding/presentation/onboarding_profile.dart';
import 'package:kidbank/features/registration/presentation/screens/auth.dart';

import '../features/add_child/presentation/add_child_finish.dart';
import '../features/chose_role/presentation/screens/role_selection.dart';
import '../features/onboarding/presentation/onboarding_currency.dart';
import '../features/onboarding/presentation/onboarding_explore.dart';
import '../features/onboarding/presentation/onboarding_start.dart';
import '../features/onboarding/presentation/onboarding_toy.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      //TODO home page
      builder: (context, state) => const RoleSelectionScreen(),
      routes: <RouteBase>[
        GoRoute(
            path: 'role',
            name: 'role',
            builder: (context,state)=>const RoleSelectionScreen()
        ),
        GoRoute(
            path: 'auth',
            name: 'auth',
            builder: (context,state)=>const AuthScreen(),
            routes: <RouteBase>[
              GoRoute(
                  path: "sign_in",
                builder:(context,state)=> const Placeholder()
              )
            ]
        ),
        //Child auth
        GoRoute(
          path: 'auth_child',
          name: 'auth_child',
          builder: (context, state) => const ChildAuthScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'count',
              name: 'count',
              builder: (context, state) => const ChildAuthCountScreen(),
            ),
          ]
        ),

        //Add child
        GoRoute(
          path: 'add_child',
          //TODO base add_child page
          builder: (context, state) => const CupertinoPageScaffold(child: Placeholder()),
          routes: <RouteBase>[
            GoRoute(
              path: 'code',
              name: 'code',
              builder: (context, state){
                Map<String,int?> extra=state.extra as Map<String,int?>;
                int count=extra['count']??1;
                int currentIndex=extra['currentIndex']??0;
                return AddChildCodeScreen(count: count, currentIndex: currentIndex);
              },
            ),
            GoRoute(
              path: 'nickname',
              name: 'nickname',
              builder: (context, state){
                Map<String,int?> extra=state.extra as Map<String,int?>;
                int count=extra['count']??1;
                int currentIndex=extra['currentIndex']??0;
                return AddChildNicknameScreen(count: count, currentIndex: currentIndex);
              },
            ),
            GoRoute(
              path: 'finish',
              name: 'finish',
              builder: (context, state){
                Map<String,int?> extra=state.extra as Map<String,int?>;
                int count=extra['count']??1;
                return AddChildFinishScreen(count: count);
              },
            ),
          ]
        ),

        //Onboarding
        GoRoute(
            path: 'onboarding',
          name: 'onboarding',
          builder: (context,state)=>const OnboardingStartScreen(),
          routes: <RouteBase>[
            GoRoute(path: 'profile',builder: (context,state)=>const OnboardingProfileScreen()),
            GoRoute(path: 'toy',builder: (context,state)=>const OnboardingToyScreen()),
            GoRoute(path: 'explore',builder: (context,state)=>const OnboardingExploreScreen()),
            GoRoute(path: 'currency',builder: (context,state)=>const OnboardingCurrencyScreen()),
          ]
        )
      ],
    ),
  ],
);