import 'package:consumindoapis/controllers/home_controller.dart';
import 'package:consumindoapis/models/todo_model.dart';
import 'package:consumindoapis/services/json_placeholder_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// entao eu faço o mock do JsonPlaceholderServiceMock e faço um JsonPlaceholderService fake
// agora é so eu instancia dentro do test service = JsonPlaceholderServiceMock

class JsonPlaceholderServiceMock extends Mock
    implements JsonPlaceholderService {}

void main() {
  test(
    'Deve retornar a lista corretamente ',
    () async {
      // aqui faço a instancia do service e passo no Homecontroller
      final service = JsonPlaceholderServiceMock();

      // testando o controller do (HomeController)
      // vamos instanciar o controller = HomeController();.
      // como faço pra pegar algo externo sem internet?
      // vamos fazer o mock e fazer um fake criando um homeController na classe,
      //homeController para pegar o service e mockar aqui no test
      // depois vamos fazer o metodo when que seria , quando meu services
      //chamar o getTodos meu metodo ele vai me retorno um TodoModel.stub
      // e agora eu tenho que fazer minha acao e mu teste
      // entao quando acabar de executar a acao eu tenho que eperar do meu controller que ele preenchar minha lista de todos(meu estado,obejto)
      // e eu vou esperar depois da acao o meu controller.todos.lenght tenha pelo menos 1 dados
      // funcinou a mensagem que eu queria
      // agora vamos fazer a view criando um homePage

      when(() => service.getTodos()).thenAnswer(
        (_) async => [
          TodoModel.stub(),
        ],
      );

      final controller = HomeController(service);
      await controller.fetchAllTodos();
      expect(controller.todos.length, 1);
    },
  );
}
