import 'package:flutter/material.dart';
import 'package:hotelbooking/admin/admin_dashbaord_complete_screen.dart';
import 'package:hotelbooking/admin/admin_dashbaord_message_screen.dart';
import 'package:hotelbooking/admin/admin_dashbaord_screen.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';
import '../component/side_menu.dart';
import '../controller/MenuAppController.dart';
import '../route/routes.dart';
import 'dashboard_screen.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuAppController = Provider.of<MenuAppController>(context);
    Widget screen;
    switch (menuAppController.selectedIndex) {
      case Routes.DASHBOARD_ROUTE:
        screen = AdminDashboardScreen();
        break;
      case Routes.PENDING_MESSAGES:
        screen = AdminDashboardMessageScreen();
        break;

      case Routes.COMPLETE_MESSAGE:
        screen = AdminDashboardCompleteScreen();
        break;


      default:
        screen = DashboardScreen();
        break;
    }
    return Scaffold(
      extendBody: true,
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2,
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 8,
              child: screen,
            ),
          ],
        ),
      ),
    );
  }
}
