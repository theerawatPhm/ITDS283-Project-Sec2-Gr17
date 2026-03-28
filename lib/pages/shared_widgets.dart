import 'package:flutter/material.dart';

final Color primaryDark = const Color(0xFF4A3B52);
final Color primaryOrange = const Color.fromARGB(232, 202, 86, 44);
final Color bgColor = const Color(0xFFF8F8F8);

class CustomSearchBar extends StatelessWidget {

  final String hintText;
  const CustomSearchBar({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: primaryDark, width: 1.5),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 8, top: 5, bottom: 5),
            child: Icon(Icons.search, color: Color(0xFF4A3B52), size: 45),
            ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Color(0xFF4A3B52), fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
            child: const Text('Enter', style: TextStyle(color: Colors.white),),),),
        ],
      ),
    );
  }
}

class ProcessingBanner extends StatelessWidget {

  final int orderCount;
  final int progressPercent;

  const ProcessingBanner({super.key, required this.orderCount, required this.progressPercent});

  @override
  Widget build(BuildContext context) {
    const double maxBarWidth = 150;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: primaryOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$orderCount order is processing', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 65,),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4)
                      ),
                    ),
                    Container( //หลอด % สีขาว
                      height: 8,
                      width: maxBarWidth * (progressPercent / 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Positioned(
                      top: -35,
                      //have to make it movable
                      left: (maxBarWidth * (progressPercent / 100 )) - 25,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('$progressPercent%', style: TextStyle(color: primaryOrange, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Image.asset('assets/icons/constructionTwo.png',
              width: 80,
              height: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}