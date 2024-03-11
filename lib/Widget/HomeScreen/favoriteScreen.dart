import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height - 80,
      decoration: BoxDecoration(color: Color(0xFFF9F7F7)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Color(0xFFDBE2EF)),
            height: 110,
            width: size.width,
            child: Text(
              'Favorite location',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF112D4E),
                fontSize: 24,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Container(
                    width: size.width - 40,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Color(0xFFDBE2EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tokyo',
                            style: TextStyle(
                              color: Color(0xFF112D4E),
                              fontSize: 24,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Color(0xFFDBE2EF),
                            ),
                            child: SvgPicture.asset('images/bar/delete.svg')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Container(
                    width: size.width - 40,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Color(0xFFDBE2EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'New York',
                            style: TextStyle(
                              color: Color(0xFF112D4E),
                              fontSize: 24,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Color(0xFFDBE2EF),
                            ),
                            child: SvgPicture.asset('images/bar/delete.svg')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Container(
                    width: size.width - 40,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Color(0xFFDBE2EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'London',
                            style: TextStyle(
                              color: Color(0xFF112D4E),
                              fontSize: 24,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Color(0xFFDBE2EF),
                            ),
                            child: SvgPicture.asset('images/bar/delete.svg')),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
