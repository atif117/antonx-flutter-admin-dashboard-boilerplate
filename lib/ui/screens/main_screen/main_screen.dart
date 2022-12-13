import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/controllers/menu_controller.dart';
import 'package:flutter_antonx_boilerplate/responsive.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/side_menu.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
