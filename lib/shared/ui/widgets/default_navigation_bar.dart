// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:provider/provider.dart';

// import '../../../global_modules/global_modules.dart';
// import '../../shared.dart';

// class DefaultNavigationBar extends StatelessWidget {
//   final StatefulNavigationShell navigationShell;
//   const DefaultNavigationBar({super.key, required this.navigationShell});

//   final List<NavItem> allNavItems = const [
//     NavItem(label: 'Início', icon: LucideIcons.house, branchIndex: 0),
//     NavItem(label: 'Meus Eventos', icon: LucideIcons.star, branchIndex: 1),
//     NavItem(label: 'Buscar', icon: LucideIcons.search, branchIndex: 2),
//     NavItem(label: 'Credenciais', icon: LucideIcons.idCard, branchIndex: 3),
//     NavItem(
//       label: 'Validar',
//       icon: LucideIcons.scan,
//       branchIndex: 4,
//       allowedRoles: ['admin', 'staff'],
//     ),
//     NavItem(label: 'Ingressos', icon: LucideIcons.ticket, branchIndex: 5),
//     NavItem(label: 'Perfil', icon: LucideIcons.user, branchIndex: 6),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final userRoles = context.watch<UserStore>().getUser?.roles ?? [];
//     final List<NavItem> visibleItems = allNavItems.where((item) {
//       if (item.allowedRoles == null) {
//         if (item.label == 'Credenciais') {
//           final hasFiliation =
//               context.watch<UserStore>().getUser?.hasFiliation ?? false;
//           if (!hasFiliation) {
//             return false;
//           }
//         }
//         return true;
//       }
//       return item.allowedRoles!.any((role) => userRoles.contains(role));
//     }).toList();
//     final int currentIndex = visibleItems.indexWhere(
//       (item) => item.branchIndex == navigationShell.currentIndex,
//     );

//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 20,
//             decoration: BoxDecoration(color: context.primaryColor),
//           ),
//           BottomNavigationBar(
//             elevation: 0,
//             backgroundColor: context.backgroundColor,
//             selectedItemColor: context.primaryColor,
//             unselectedItemColor: context.colorScheme.inverseSurface,
//             selectedFontSize: 12,

//             selectedLabelStyle: context.textTheme.titleMedium?.copyWith(
//               fontSize: 12,
//             ),
//             unselectedLabelStyle: context.textTheme.bodyMedium?.copyWith(
//               fontSize: 12,
//             ),
//             showUnselectedLabels: true,
//             iconSize: 24,
//             type: BottomNavigationBarType.fixed,
//             currentIndex: currentIndex < 0 ? 0 : currentIndex,
//             onTap: (visualIndex) {
//               final int targetBranchIndex =
//                   visibleItems[visualIndex].branchIndex;
//               navigationShell.goBranch(targetBranchIndex);
//             },
//             items: visibleItems.map((item) {
//               return BottomNavigationBarItem(
//                 icon: Icon(item.icon),
//                 label: item.label,
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NavItem {
//   final String label;
//   final IconData icon;
//   final int branchIndex;
//   final List<String>? allowedRoles;

//   const NavItem({
//     required this.label,
//     required this.icon,
//     required this.branchIndex,
//     this.allowedRoles,
//   });
// }
