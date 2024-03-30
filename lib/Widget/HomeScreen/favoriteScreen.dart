import 'package:bai_cuoi_ky/firebase/fire_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatefulWidget {
  String email='';
  FavoriteScreen(this.email);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> city_love=[];
  void listlooding(String email)async{
    List<String> cities = await firebaseService().getAllCitiesByEmail(email);
    setState(() {
      city_love = cities;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listlooding(widget.email);

  }
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
            child: ListView.builder(
              itemCount: city_love.length, // Số lượng phần tử trong danh sách, trong trường hợp này là 1
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
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
                            city_love[index],
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
                          onPressed: () async {

                            await firebaseService().removeFavoriteCity(city_love[index], widget.email);
                            listlooding(widget.email);

                            },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Color(0xFFDBE2EF),
                          ),
                          child: SvgPicture.asset('images/bar/delete.svg'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}
