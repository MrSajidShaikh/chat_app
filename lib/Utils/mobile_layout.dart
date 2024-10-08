import 'dart:io';
import 'package:chat_app/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Controller/auth_controller.dart';
import '../Screens/confirm_status_screen.dart';
import '../Screens/create_group_screen.dart';
import '../Screens/search_screen.dart';
import '../Screens/select_contact_screen.dart';
import '../Screens/setting_screen.dart';
import '../Screens/status_contact_screen.dart';
import '../Widgets/contacts_list.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  String name = "";

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ContactsList(),
    StatusContactsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectedIndex==2?
        null:
        AppBar(
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            centerTitle: false,
            title: Text(
              'Chat App',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
            ),
            actions: switch (_selectedIndex) {
              0 => [
                IconButton(
                  icon: Icon(Icons.search,
                      color: Theme.of(context).colorScheme.onPrimary),
                  onPressed: () {
                    Navigator.pushNamed(context, SearchList.routeName);
                  },
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      child: const Text(
                        'Create Group',
                      ),
                      onTap: () => Future(
                            () => Navigator.pushNamed(
                            context, CreateGroupScreen.routeName),
                      ),
                    ),
                    PopupMenuItem(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        child: const Text(
                          'Settings',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SettingsScreen.routeName);
                        })
                  ],
                ),
              ],
              1 => [
                IconButton(
                  icon: Icon(Icons.add_a_photo_rounded,
                      color: Theme.of(context).colorScheme.onPrimary),
                  onPressed: () async {
                    File? pickedImage = await pickImageFromGallery(context);
                    if (pickedImage != null) {
                      if (!context.mounted) return;
                      Navigator.pushNamed(
                        context,
                        ConfirmStatusScreen.routeName,
                        arguments: pickedImage,
                      );
                    }
                  },
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        child: const Text(
                          'Settings',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SettingsScreen.routeName);
                        })
                  ],
                ),
              ],
              int() => null,
            }),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onItemTapped,
          indicatorColor: const Color.fromARGB(130, 255, 46, 99),
          selectedIndex: _selectedIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.chat),
              icon: Icon(Icons.chat_outlined),
              label: 'CHAT',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.auto_awesome_sharp),
              icon: Icon(Icons.auto_awesome_outlined),
              label: 'STATUS',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'SETTINGS',
            ),
          ],
        ),
        floatingActionButton: switch (_selectedIndex) {
          0 => FloatingActionButton(
            shape: Theme.of(context).floatingActionButtonTheme.shape,
            elevation: Theme.of(context).floatingActionButtonTheme.elevation,
            onPressed: () async {
              Navigator.pushNamed(context, SelectContactsScreen.routeName);
            },
            backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
            child: Icon(
              Icons.add_circle_outline_sharp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          1 => FloatingActionButton(
            shape: Theme.of(context).floatingActionButtonTheme.shape,
            elevation: Theme.of(context).floatingActionButtonTheme.elevation,
            onPressed: () async {
              File? pickedImage = await pickImageFromGallery(context);
              if (pickedImage != null) {
                if (!context.mounted) return;
                Navigator.pushNamed(
                  context,
                  ConfirmStatusScreen.routeName,
                  arguments: pickedImage,
                );
              }
            },
            backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          int() => null,
        });
  }
}
