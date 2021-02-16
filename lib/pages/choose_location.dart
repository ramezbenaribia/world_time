import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData () async {

  //   //simulate network request for a username
  //  String username =await Future.delayed(Duration(seconds: 3), (){
  //     return 'ramez' ;
  //   });
  //
  //   //simulate network request to get bio of the username
  //   String bio = await Future.delayed(Duration(seconds: 2), (){
  //     return ("the most creative and indepedent man in the world ") ;
  //   });
  //
  //
  //   print('$username - $bio ') ;
  //
  // }

  // int counter = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // print('initState function ran') ;
  //   getData();
  //   print('hey there') ;
  // }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updatTime(index) async {
    WorldTime instance = locations[index] ;
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context , {
      'location' : instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    }) ;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose Location '),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length ,
          itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                   updatTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
    }

      ),
      // body: RaisedButton(
      //   onPressed: (){
      //     setState(() {
      //       counter +=1 ;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      // ),
    );
  }
}
