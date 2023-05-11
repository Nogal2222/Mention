import 'package:app/api/notice_model.dart';
import 'package:flutter/material.dart';

class NoticeMention extends StatelessWidget {
  const NoticeMention({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.name,
    required this.isRead,
    required this.created,
    required this.id,
    required this.sender,
    required this.title,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String name;
  final int id;
  final String title;
  final bool isRead;
  final DateTime created;
  final Sender? sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xffa3b3f9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("누군가 $name님에게 멘션을 보냈어요."),
                  Text(created.toString()),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                    ),
                    child: Container(
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0xffd1d9fc),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 5),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("icon"),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              Text("$id"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (!isRead)
            Positioned(
              top: -screenWidth * 0.02,
              right: -screenWidth * 0.02,
              child: Container(
                width: screenWidth * 0.05,
                height: screenWidth * 0.05,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 5),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
