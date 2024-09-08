import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/features/account/presentation/screens/my_account.dart';
import 'package:kidbank/features/account/wallet/presentation/screens/wallet.dart';
import 'package:kidbank/features/account/wallet/top_up/top_up.dart';
import 'package:kidbank/features/add_child/presentation/add_child_code.dart';
import 'package:kidbank/features/add_child/presentation/add_child_nickname.dart';
import 'package:kidbank/features/add_toy_category/data/add_toy_category_riverpod.dart';
import 'package:kidbank/features/add_toys_color/presentation/screens/set_toy_colors.dart';
import 'package:kidbank/features/add_toys_condition/presentation/screens/add_conditions.dart';
import 'package:kidbank/features/add_toys_material/presentation/screens/set_toy_material.dart';
import 'package:kidbank/features/add_toy/presentation/screens/add_toy_age.dart';
import 'package:kidbank/features/add_toy/presentation/screens/add_toy_category.dart';
import 'package:kidbank/features/add_toy/presentation/screens/add_toy_fill_details.dart';
import 'package:kidbank/features/auth/presentation/screens/auth.dart';
import 'package:kidbank/features/auth/presentation/screens/child_auth.dart';
import 'package:kidbank/features/auth/presentation/screens/child_auth_count.dart';
import 'package:kidbank/features/onboarding/presentation/onboarding_profile.dart';
import 'package:kidbank/features/sign_up/presentation/screens/id_checker_for_page.dart';
import 'package:kidbank/features/sign_up/presentation/screens/id_checker_third_page.dart';
import 'package:kidbank/features/sign_up/presentation/screens/id_cheker_first_page.dart';
import 'package:kidbank/features/sign_up/presentation/screens/id_cheker_second_page.dart';
import 'package:kidbank/features/sign_up/presentation/screens/improve_page.dart';
import 'package:kidbank/features/sign_up/presentation/screens/notification_page.dart';
import 'package:kidbank/features/sign_up/presentation/screens/sign_up.dart';

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
      builder: (context, state) =>  const SelectToyCategory(),
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
                  path: "sign_up",
                builder:(context,state)=> const SignUp()
              ),
              GoRoute(
                  path: "improve",
                  builder:(context,state)=> const ImprovePage()
              ),
              GoRoute(
                  path: "id_check_select_document_page",
                  builder:(context,state)=> const FirstIdCheckerPage()
              ),
              GoRoute(
                  path: "id_check_enter_id_data_page",
                  builder:(context,state)=> const SecondIdCheckerPage()
              ),
              GoRoute(
                  path: "id_check_upload_photo_page",
                  builder:(context,state)=> const ThirdIdCheckerPage()
              ),
              GoRoute(
                  path: "id_check_success_page",
                  builder:(context,state)=> const SuccessIdCheckerPage()
              ),
              GoRoute(
                  path: "notification_page",
                  builder:(context,state)=> const NotificationPage()
              ),
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
        ),

        //Add toy
        GoRoute(
            path: 'add_toy',
          name: 'add_toy',
          builder: (context,state)=>const AddToyCategoryScreen(),
          routes: <RouteBase>[
            GoRoute(path: 'age',name: 'age',builder: (context,state)=>const AddToyAgeScreen()),
            GoRoute(path: 'fill_details',name: 'fill_details',builder: (context,state)=> const AddToyFillDetailsScreen()),
          ],
        ),
        GoRoute(
            path: 'account',
            builder: (context,state)=>const MyAccount(),
          routes: <RouteBase>[
            GoRoute(path: 'wallet',builder: (context,state)=>const AccountWalletScreen(),
            routes: <RouteBase>[
              GoRoute(path: 'top_up',builder: (context,state)=>const TopUpScreen())
            ])
          ]
        ),
        GoRoute(
            path: 'account',
            builder: (context,state)=>const MyAccount(),
          routes: <RouteBase>[
            GoRoute(path: 'wallet',builder: (context,state)=>const AccountWalletScreen(),
            routes: <RouteBase>[
              GoRoute(path: 'top_up',builder: (context,state)=>const TopUpScreen())
            ])
          ]
        )
      ],
    ),
  ],
);