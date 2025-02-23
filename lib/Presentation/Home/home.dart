import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qflow/constants/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // PageController to handle swiping
    final PageController pageController = PageController();
    // ValueNotifier to track the current page index
    final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: EdgeInsets.only(
          left: 30.w,
          top: 81.h,
          right: 10.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Nidhin',
                  style: TextStyle(
                    fontSize: 21.45.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            kheight10,
            kheight20,

            // Sliding Carousel
            SizedBox(
              height: 184.h,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  currentPageNotifier.value = index;
                },
                children: [
                  _buildCard("You haven't\nBooked any Slot"),
                  _buildCard("Upcoming Event:\nTech Meetup"),
                  _buildCard("Reminder:\nComplete your profile"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Page Indicator using ValueListenableBuilder
            Center(
              child: ValueListenableBuilder<int>(
                valueListenable: currentPageNotifier,
                builder: (context, currentPage, _) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: currentPage == index ? 50 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? const Color(0xFF8ADAF8)
                              // ignore: deprecated_member_use
                              : Colors.lightBlueAccent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Card Builder for Carousel
  Widget _buildCard(String text) {
    return Container(
      width: 350.w,
      height: 184.h,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          image: AssetImage("assets/icon/back.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight10,
              kheight10,
              Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Action for booking slot
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(288.w, 49.h),
                  //  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: const Text(
                  "Book your slot +",
                  style: TextStyle(
                    color: Color(0xFF8ADAF8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
