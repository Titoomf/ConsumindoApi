import 'package:consumindoapis/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// mudo meu estato ara stateFull

// para melhorar essa acao , iremos ultilizar uma injeção de dependencia, pra deixar melhora responsabilidade e deixar desaclopado
// flutter_modular: server para componentizar  as features com suas responsabilidade e suas rotas
// depois fazemos umas confiruçaão no projeto la na main, criando um arquivo app_module para configurar a injeção de dependencia
//
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Todos'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return ListTile(
                title: Text(todo.title),
              );
            },
          );
        },
      ),
    );
  }
}
