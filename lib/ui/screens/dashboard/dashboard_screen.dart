import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/responsive.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/header.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/my_files.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/recent_files.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
