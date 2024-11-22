import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/helpers/helper_functions.dart';
import '../../../../constants/sizes.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ZohSizes.defaultSpace,
            vertical: ZohSizes.defaultSpace,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: ZohSizes.spaceBtwSections),
                child: Icon(
                  Icons.person,
                  size: ZohHelperFunctions.screenHeight() * .13,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: ZohSizes.spaceBtwSections,
              ),
              DrawerTile(
                title: 'H O M E',
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),
              DrawerTile(
                  title: 'P R O F I L E',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  }),
              DrawerTile(
                title: 'S E A R C H',
                icon: Icons.search,
                onTap: () {},
              ),
              DrawerTile(
                title: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () {},
              ),
              const Spacer(),
              DrawerTile(
                title: 'L O G O U T',
                icon: Icons.logout,
                onTap: () {
                  context.read<AuthCubit>().logOut();},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
