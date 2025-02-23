import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qflow/Presentation/Home/home.dart';
import 'package:qflow/Presentation/Member/member.dart';
import 'package:qflow/Presentation/Profile/profile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final ValueNotifier<int> _selectedIndexNotifier =
      ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageContent(selectedIndexNotifier: _selectedIndexNotifier),
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: CustomNavBar(selectedIndexNotifier: _selectedIndexNotifier),
          ),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier;

  const PageContent({super.key, required this.selectedIndexNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, _) {
        return IndexedStack(
          index: selectedIndex,
          children:  [
            const HomeScreen(),
            MemberScreen(),
            const ProfileScreen(),
          ],
        );
      },
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier;

  const CustomNavBar({super.key, required this.selectedIndexNotifier});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 72.h,
        width: 280.w,
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
        decoration: BoxDecoration(
          color: const Color(0xFFC1C1C1),
          borderRadius: BorderRadius.circular(35),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.black26,
          //     blurRadius: 10,
          //     offset: Offset(0, 4),
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              imagePath: 'assets/icon/Vector.png',
              index: 0,
              notifier: selectedIndexNotifier,
            ),
            NavBarItem(
              imagePath: 'assets/icon/member.png',
              index: 1,
              notifier: selectedIndexNotifier,
            ),
            NavBarItem(
              imagePath: 'assets/icon/Group.png',
              index: 2,
              notifier: selectedIndexNotifier,
              isCenterIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String imagePath;
  final int index;
  final ValueNotifier<int> notifier;
  final bool isCenterIcon;

  const NavBarItem({
    super.key,
    required this.imagePath,
    required this.index,
    required this.notifier,
    this.isCenterIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: notifier,
      builder: (context, selectedIndex, _) {
        final bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => notifier.value = index,
          child: Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF2A2C29) : null,
              shape: isSelected ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: isSelected
                  ? const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: SizedBox(
                width: 35.w,
                height: 35.h,
                child: Image.asset(
                  imagePath,
                  color: isSelected ? Colors.white : Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
