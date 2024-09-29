import 'package:chat_app/Screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Controller/status_controller.dart';
import '../Models/status_model.dart';
import '../Widgets/loader.dart';

class StatusContactsScreen extends ConsumerWidget {
  const StatusContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Status>>(
      future: ref.read(statusControllerProvider).getStatus(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var statusData = snapshot.data![index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      StatusScreen.routeName,
                      arguments: statusData,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        style: Theme.of(context).textTheme.titleSmall,
                        statusData.username,
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          statusData.profilePic,
                        ),
                        radius: 30,
                      ),
                    ),
                  ),
                ),
                Divider(
                    color: Theme.of(context).colorScheme.tertiary, indent: 85),
              ],
            );
          },
        );
      },
    );
  }
}
