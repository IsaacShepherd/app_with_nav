import "package:app_with_nav/services/world_time.dart";
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Chicago', flag: 'germany.png', url: 'America/Chicago');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200],
        body: const Center(
            child: SpinKitSpinningLines(
          color: Colors.white,
          size: 70.0,
        )));
  }
}
