import 'package:flutter/material.dart';

class principal extends StatelessWidget {
  const principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Titulo'),
        ),
        body: Center(
          child: Container(
            //Tamaño container
            width: 300,
            height: 300,
            //Contenido interno
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 219, 185, 61),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Hijo 1
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text('Persona')
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Hijo 1
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text('Telefono')
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}