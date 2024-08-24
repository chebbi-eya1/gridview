import 'package:flutter/material.dart';

import 'car.dart';
import 'carslist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Luxury cars gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Car> _cars =cars;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: GridView.builder(
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //body: ListView.separated(
        // separatorBuilder: (context, index) => const Divider(color: Colors.cyan,),// il 5at de separation
          itemCount: _cars.length,
          itemBuilder: (context, index){
            Car car =_cars[index];
            return Card(
              color: Colors.cyan,
           child:Container(
             padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Expanded(child: car.image),
                 const Divider(color : Colors.white),
                 Text(
                   car.model,
                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),
                   textAlign: TextAlign.start,
                 ),
                 Text(
                   car.brand,
                   style: const TextStyle(color: Colors.white) ,
                 )
               ],
             ),
           )

            );
          }

      ),

    );
  }
}
