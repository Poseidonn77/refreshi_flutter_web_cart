import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';
import '../../controller/sign_in_controller.dart';
import 'responsive.dart';

/// App-bar account control that always reflects the demo sign-in state.
///
/// - Signed out: "Sign in" (icon-only on mobile).
/// - Signed in: filled account icon with a check badge; menu with
///   My orders and Sign out.
class AccountButton extends StatelessWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = context.isMobile;
    return Obx(() {
      if (!SignInController.isSignedIn.value) {
        const icon = Icon(Icons.account_circle_outlined);
        return compact
            ? IconButton(
                key: const Key('sign-in'),
                tooltip: 'Sign in',
                icon: icon,
                onPressed: Nav.signIn,
              )
            : TextButton.icon(
                key: const Key('sign-in'),
                icon: icon,
                label: const Text('Sign in'),
                style: TextButton.styleFrom(
                  // Readable on the coloured app bar.
                  foregroundColor: IconTheme.of(context).color,
                ),
                onPressed: Nav.signIn,
              );
      }
      return PopupMenuButton<_Action>(
        key: const Key('account'),
        tooltip: 'Signed in',
        icon: Badge(
          backgroundColor: Colors.green.shade600,
          label: const Icon(Icons.check, size: 10, color: Colors.white),
          child: const Icon(Icons.account_circle),
        ),
        onSelected: (a) => switch (a) {
          _Action.orders => Nav.orders(),
          _Action.signOut => SignInController.signOut(),
        },
        itemBuilder: (_) => const [
          PopupMenuItem(enabled: false, child: Text('Signed in (demo)')),
          PopupMenuDivider(),
          PopupMenuItem(
            value: _Action.orders,
            child: ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text('My orders'),
            ),
          ),
          PopupMenuItem(
            value: _Action.signOut,
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
            ),
          ),
        ],
      );
    });
  }
}

enum _Action { orders, signOut }
