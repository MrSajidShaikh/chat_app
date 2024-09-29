import 'package:flutter/material.dart';
import 'dart:io';

import '../Models/status_model.dart';
import '../Screens/chat_screen.dart';
import '../Screens/confirm_status_screen.dart';
import '../Screens/create_group_screen.dart';
import '../Screens/login_screen.dart';
import '../Screens/otp_screen.dart';
import '../Screens/search_screen.dart';
import '../Screens/select_contact_screen.dart';
import '../Screens/setting_screen.dart';
import '../Screens/status_screen.dart';
import '../Screens/user_info_screen.dart';
import '../Widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );
    case SearchList.routeName:
      return MaterialPageRoute(
        builder: (context) => const SearchList(),
      );
    case ChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final isGroupChat = arguments['isGroupChat'];
      final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
        builder: (context) => ChatScreen(
          name: name,
          uid: uid,
          isGroupChat: isGroupChat,
          profilePic: profilePic,
        ),
      );
    case ConfirmStatusScreen.routeName:
      final file = settings.arguments as File;
      return MaterialPageRoute(
        builder: (context) => ConfirmStatusScreen(
          file: file,
        ),
      );
    case StatusScreen.routeName:
      final status = settings.arguments as Status;
      return MaterialPageRoute(
        builder: (context) => StatusScreen(
          status: status,
        ),
      );
    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateGroupScreen(),
      );
    case SettingsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
