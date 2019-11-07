import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Fortaleza', flag: 'brasil.jpg', url: 'America/Fortaleza'),
    WorldTime(location: 'Buenos Aires', flag: 'argentina.jpg', url: 'America/Argentina/Buenos_Aires'),
    WorldTime(location: 'Denver', flag:'usa.png', url: 'America/Denver'),
    WorldTime(location: 'Londres', flag:'uk.png', url: 'Europe/London')
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Escolha localização'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}')
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
