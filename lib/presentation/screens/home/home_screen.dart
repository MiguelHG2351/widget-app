import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgtes/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets App'),
      ),
      body: const _HomeView(),
      drawer: const SideMenu(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menu = appMenuItems[index];
        return _CustomListTile(menu: menu);
      }
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menu,
  });

  final MenuItem menu;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      title: Text(menu.title),
      subtitle: Text(menu.subTitle),
      leading: Icon(menu.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios, color: colors.primary,),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen()
        //   )
        // );
        // context.pushNamed(ButtonsScreen.name);
        context.push(menu.link);
      },
    );
  }
}
