import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  int index = 0; // index of selected navigation bar

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    // set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(

        //TO DO: figure out how to route with navigation bar
        bottomNavigationBar: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.egg_alt_rounded), label: 'Page1'),
            NavigationDestination(
                icon: Icon(Icons.egg_alt_rounded), label: 'Page2'),
            NavigationDestination(
                icon: Icon(Icons.egg_alt_rounded), label: 'Page3')
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(fontSize: 38, letterSpacing: 2),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text('Choose Location'),
                  // TO DO: figure out why is this like this
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text('Second Page'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second_page');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
