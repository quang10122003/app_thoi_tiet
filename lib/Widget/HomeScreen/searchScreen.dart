import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              'Searching location',
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
            height: 20,
            width: size.width,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
                height: 40,
              ),
              Container(
                width: 270,
                height: 40,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, color: Color(0xFF112D4E)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Search location...'),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xFFDBE2EF),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'images/bar/search-location.svg',
                    width: 25,
                    height: 25,
                  )),
            ],
          ),
          SizedBox(
            width: size.width,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Suggestion locations',
              style: TextStyle(
                color: Color(0xFF112D4E),
                fontSize: 20,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Container(
              width: size.width - 40,
              height: 80,
              decoration: ShapeDecoration(
                color: Color(0xFFDBE2EF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'California',
                        style: TextStyle(
                          color: Color(0xFF112D4E),
                          fontSize: 24,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '22°C',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF112D4E),
                      fontSize: 24,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xFFDBE2EF),
                    ),
                    onPressed: (){},
                    child: SvgPicture.asset(
                      'images/bar/circle-heart.svg',
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Container(
              width: size.width - 40,
              height: 80,
              decoration: ShapeDecoration(
                color: Color(0xFFDBE2EF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New York',
                        style: TextStyle(
                          color: Color(0xFF112D4E),
                          fontSize: 24,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '22°C',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF112D4E),
                      fontSize: 24,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xFFDBE2EF),
                    ),
                    onPressed: (){},
                    child: SvgPicture.asset(
                      'images/bar/liked.svg',
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
