import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var contatos = [
    Contato("Diego Martins", "dmartins@email.com"),
    Contato("João Silva", "silva@email.com"),
    Contato("Maria Aparecida", "maria@email.com"),
    Contato("Ana Paula", "anap@email.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de contatos")),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (_, index) {
          return ContatoItem(contato: contatos[index], onPressed: (){
            setState(() {
              contatos[index].favorito = !contatos[index].favorito;
            });
          });
        },
      ),
    );
  }
}

class Contato {
  String nomeCompleto;
  String email;
  bool favorito = false;

  Contato(this.nomeCompleto, this.email);
}

class ContatoItem extends StatelessWidget {
  const ContatoItem({super.key, required this.contato, required this.onPressed});

  final Contato contato;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(contato.nomeCompleto[0])),
      title: Text(contato.nomeCompleto),
      subtitle: Text(contato.email),
      trailing: IconButton(
        onPressed: (){
          onPressed();
        }, 
        icon: Icon(Icons.favorite, color: contato.favorito ? Colors.red : Colors.black)),
    );
  }
}
