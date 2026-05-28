import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wiget1 extends StatelessWidget {
  const Wiget1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Formulario());
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();

  //Controladores
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  //Variables
  String rol = '...';
  DateTime? fecha;
  bool terminosyC = false;
  bool notificaciones = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro user'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.account_circle,
                size: 60,
                color: Color.fromARGB(255, 255, 145, 145),
              ),
              const Text(
                'Registro user',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              TextFormField(
                controller: nombreController,

                decoration: InputDecoration(
                  labelText: "Nombre user",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                //Debe retornar algo siempre
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe poner su nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                //Debe retornar algo siempre
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe poner su correo';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Use un formato de correo valido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Telefono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                //Debe retornar algo siempre
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe poner su telefono';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: passController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                //Debe retornar algo siempre
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe poner su contra';
                  } else if (value.length < 6) {
                    return 'La contra debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              DropdownButtonFormField(
                value: rol,

                decoration: const InputDecoration(
                  labelText: 'Rol',
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(value: '...', child: Text('...')),
                  DropdownMenuItem(value: 'Usuario', child: Text('Usuario')),
                  DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                  DropdownMenuItem(value: 'Cliente', child: Text('Cliente')),
                ],
                onChanged: (value) {
                  setState(() {
                    rol = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              //Contenedor vacio sizedbox
              SizedBox(
                //Tomar el ancho que necesite, no demas
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.date_range),
                  label: Text(
                    fecha == null
                        ? 'Seleccionar fecha'
                        : 'Fecha: ${fecha!.day}/${fecha!.month}/${fecha!.year}',
                  ),

                  onPressed: () async {
                    DateTime? pickdate = await showDatePicker(
                      context: context,
                      //F inicial
                      initialDate: DateTime.now(),
                      //F maxima hacia atras
                      firstDate: DateTime(1950),
                      //F maxima hacia adelante
                      lastDate: DateTime(2027),
                    );

                    if (fecha != null) {
                      setState(() {
                        fecha = pickdate;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('TyC'),
                value: terminosyC,
                onChanged: (value) {
                  setState(() {
                    terminosyC = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              SwitchListTile(
                title: const Text('Recibir notificaciones'),
                value: notificaciones,

                onChanged: (value) {
                  setState(() {
                    notificaciones = value;
                  });
                },
              ),

              const SizedBox(height:  20,),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && terminosyC) {
                      //Logica registro
                      print('Formulario valido.');
                    } else {
                      print('Debe aceptar TyC');
                    }
                  },
                  child: const Text('Registrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
