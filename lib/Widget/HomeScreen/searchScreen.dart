import 'package:bai_cuoi_ky/Models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:async/async.dart';

class SearchScreen extends StatefulWidget {
  String email='';
  SearchScreen(this.email);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // timer global
  CancelableOperation<void>? _debounceTimer;

// Hàm delay request
  void debounce(void Function() action, Duration duration) {
    _debounceTimer?.cancel();
    _debounceTimer = CancelableOperation.fromFuture(Future.delayed(duration))
      ..value.then((_) {
        action();
      });
  }

  List<String> list_city = City().city.keys.toList();

  String searchQuery = '';
// Hàm để loại bỏ dấu từ một chuỗi Unicode và chuyển đổi các ký tự có dấu sang các ký tự không dấu
  String removeDiacritics(String input) {
    final Map<String, String> diacriticsMap = {
      'á': 'a',
      'à': 'a',
      'ả': 'a',
      'ã': 'a',
      'ạ': 'a',
      'ă': 'a',
      'ắ': 'a',
      'ằ': 'a',
      'ẳ': 'a',
      'ẵ': 'a',
      'ặ': 'a',
      'â': 'a',
      'ấ': 'a',
      'ầ': 'a',
      'ẩ': 'a',
      'ẫ': 'a',
      'ậ': 'a',
      'đ': 'd',
      'é': 'e',
      'è': 'e',
      'ẻ': 'e',
      'ẽ': 'e',
      'ẹ': 'e',
      'ê': 'e',
      'ế': 'e',
      'ề': 'e',
      'ể': 'e',
      'ễ': 'e',
      'ệ': 'e',
      'í': 'i',
      'ì': 'i',
      'ỉ': 'i',
      'ĩ': 'i',
      'ị': 'i',
      'ó': 'o',
      'ò': 'o',
      'ỏ': 'o',
      'õ': 'o',
      'ọ': 'o',
      'ô': 'o',
      'ố': 'o',
      'ồ': 'o',
      'ổ': 'o',
      'ỗ': 'o',
      'ộ': 'o',
      'ơ': 'o',
      'ớ': 'o',
      'ờ': 'o',
      'ở': 'o',
      'ỡ': 'o',
      'ợ': 'o',
      'ú': 'u',
      'ù': 'u',
      'ủ': 'u',
      'ũ': 'u',
      'ụ': 'u',
      'ư': 'u',
      'ứ': 'u',
      'ừ': 'u',
      'ử': 'u',
      'ữ': 'u',
      'ự': 'u',
      'ý': 'y',
      'ỳ': 'y',
      'ỷ': 'y',
      'ỹ': 'y',
      'ỵ': 'y',
    };

    return input
        .replaceAllMapped(
          RegExp(r'[^\u0000-\u007F]+'),
          (match) => match
              .group(0)!
              .split('')
              .map((char) => diacriticsMap[char] ?? char)
              .join(),
        )
        .toLowerCase();
  }

  List<String> removeDiacriticsFromList(List<String> inputList) {
    return inputList.map((string) => removeDiacritics(string)).toList();
  }

  List<String> timKiem(String tuKhoa, List<String> danhSach) {
    // Tạo một danh sách mới chứa các phiên bản không dấu của các phần tử ban đầu
    tuKhoa = removeDiacritics(
        tuKhoa.toLowerCase()); // Loại bỏ dấu và chuyển đổi thành chữ thường

    // Sử dụng danh sách mới để tìm kiếm
    return danhSach
        .where((thanhPho) =>
            removeDiacritics(thanhPho.toLowerCase()).contains(tuKhoa))
        .toList();
  }

  void main() {
    List<String> danhSach = ["Hà Nội", "Hải Phòng", "Đà Nẵng"];
    String tuKhoa = "ha";

    List<String> ketQua = timKiem(tuKhoa, danhSach);
    print(ketQua); // Output: ["Hà Nội"]
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height - 80,
      decoration: BoxDecoration(color: Color(0xFFF9F7F7)),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Căn hàng theo trục ngang
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
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Căn hàng theo trục ngang
            children: [
              SizedBox(
                width: 20,
                height: 40,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Color(0xFF112D4E)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Search location...'),
                    onChanged: (value) {
                      debounce(() {
                        setState(() {
                          searchQuery = value;
                        });
                      }, Duration(milliseconds: 300));
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Color(0xFFDBE2EF),
                ),
                child: SvgPicture.asset(
                  'images/bar/search-location.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Suggestion locations',
              style: TextStyle(
                color: Color(0xFF112D4E),
                fontSize: 20,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: searchQuery.isEmpty
                  ? list_city.length
                  : timKiem(searchQuery, list_city).length,
              itemBuilder: (BuildContext context, int index) {
                final cityName;
                if (searchQuery.isEmpty) {
                  cityName = list_city[index];
                } else {
                  cityName = timKiem(searchQuery, list_city)[index];
                }
                var islike = false;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              cityName,
                              style: TextStyle(
                                color: Color(0xFF112D4E),
                                fontSize: 24,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w400,
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
                          child: islike
                              ? SvgPicture.asset(
                                  'images/bar/circle-heart.svg',
                                  width: 20,
                                  height: 20,
                                )
                              : SvgPicture.asset(
                                  'images/bar/circle-heart.svg',
                                  width: 20,
                                  height: 20,
                                ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
