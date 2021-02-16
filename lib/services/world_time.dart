import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime {

  String location ; //location name for the UI
  String time ; //the time in that location
  String flag ; // url to asset flag icon
  String url; //location url for api endpoint
  bool isDaytime; //true or false if daytime or not

  WorldTime({this.location,this.flag , this.url }) ;

  Future<void> getTime() async {


//get some data from the Net
//     Response response = await get('https://jsonplaceholder.typicode.com/todos/1') ;
//     Map data = jsonDecode(response.body) ;
//     print(data) ;
//     print(data['title']) ;

try {
  //make the request
  Response response = await get ('http://worldtimeapi.org/api/timezone/$url');
  Map data = jsonDecode(response.body) ;
  // print(data);

  // get properties from data
  String datetime  = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  // print(datetime);
  // print(offset);

  //create DateTime object
  DateTime now = DateTime.parse(datetime) ;
  now = now.add(Duration(hours: int.parse(offset))) ;

  // set the time proprety
  // time = now.toString();
  isDaytime = (now.hour> 6 && now.hour < 20)  ? true : false ;
  time =DateFormat.jm().format(now);



}
catch (e) {
  print('caught an error : $e') ;
  time='could not get the time data ';
}


  }

}
