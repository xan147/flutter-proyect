import 'package:flutter/material.dart';

class Ejemplo extends StatelessWidget {
  const Ejemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarjeta info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Tarjeta')),
        
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 167, 167),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.white, size: 100),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Juan',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.mail, size: 20),
                        Text(' juan@gmail.com', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 20),
                        Text(' 123456789', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20),
                        Text(' Bogota', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
