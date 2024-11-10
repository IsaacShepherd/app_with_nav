import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  String time = ''; // time in needed location
  String flag; // url to icon asset
  String url; // location url for API endpoint
  bool isDaytime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String symbol = data['utc_offset'].substring(0, 1);
      String offset = data['utc_offset'].substring(1, 3);
      // print('datetime' ' $datetime');
      // print('datetime' ' $data[utc_offset]');
      // print(symbol);
      // print('offset' ' $offset');

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      //need to check do we subtract or add offset
      now = symbol == '-'
          ? now.subtract(Duration(hours: int.parse(offset)))
          : now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      //set time property
      time = DateFormat.Hm().format(now);
    } catch (e) {
      // print('caught ERRROR: $e');
      time = 'Cant get time data!';
    }
  }
}
