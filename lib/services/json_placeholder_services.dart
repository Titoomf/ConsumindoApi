import 'package:consumindoapis/services/http_client_interfaces.dart';

import '../models/todo_model.dart';

class JsonPlaceholderService {
  // consumindo api com Dio no flutter,
  // iremos para o model fazer TodoModel o metdo map , fromJson.
  // o que iremos retorna do model vai ser um future de uma lista do modelo,
  // TodoModel e o nome do metodo getTodos

  final url = "https://jsonplaceholder.typicode.com/todos";
  // criando instancia do dio = Dio
  // para fazer algo externa sem internet temos que fazer conteudo fake e ai sim
  // consumir esse dados fake, que faz esse ligação externa é o Dio() que devemos
  //desacoplar passando ele como construtor Dio dio;
  // aqui passo a receber a IHttp interface onde tem minha assinatura
  // final Dio dio;(sem a implementação normal)
  // quando eu depende do contrato da classe abstrata eu posso ter qualquer implementação como do dio, http,uno
  // onde tinha Dio eu substituo por client e deixo meu dio desacoplado
  // final Dio dio  passar a ser IHttpCliente client e no meu
  //contrutor vai ser client e no meu get vai ser client pois tenho uma abstracao e uma assinatura
  final IHttpClient client;

  JsonPlaceholderService(this.client);

  Future<List<TodoModel>> getTodos() async {
    final body = await client.get(url);
    // como eu sei que o data é um mapa que convertos dados para uma string e,
    // é uma list entao vou fala que meu quero o meu dados em lista faço um cast
    //final body = response.data as List;
    // aqui fazemos a refatoração do todo model criando um fromString no model
    // entao pegamos todos o todoModel e tranferimos para o model ,
    //como essa class ta no TodoModel entao passamos para ele o fromJson e o map
    // ficando TodoModel.fromJson(map)
    // entao sabemos que é um dynamico e declaramos direto
    // ficando TodoModel.fromJson(dynamic map)
    //  nossa isso é pra um servidor, imagina se fizer para 200services que seria
    //o dia que tu recebe gerlmente e tem que testa tudo, entao voce faz o
    // desacoplamento para nao fica depednendo de package caso ele nao funcione
    // e como fazer ??
    // voce criar um contrato e voce vai receber o contrato
    //que seria a classe abstrata dai passamos qualquer implementcao de contrato
    //dai faz o contrato com o dio,http........
    // para desacoplar totalmente do dio ,  criamos uma pasta services e uma classe abstrac
    // agora dentro do jsonplaceholder(test) em vez de mock o dio
    //todo eu mock o que eu realmente quero , pois o dio ja foi testao e ta funcionando
    // eu quero mock minha implementação IHttpClientMock extends Mock implements IHttpClient
    // como eu to testa meu client e nao vou querer meu response pois response é do dio entao vou retornar direto meu corpo
    // e como nao tem mais cast eu vou precisar fazer cast no meu corpo pra ele saber que é uma LISTA DE MAP
    // AGORA TUDO TA DESACOPLADO E DA PRA USAR OUTRAS SERVIÇOS COMO HTTP , DIO, UNO.SO FAZER UMA COPIA DA CLASSE DO HTTP E TROCAR OS NOMES
    // agora iremos fazer o controller para poder chamar na view

    final todos = (body as List)
        .map(TodoModel.fromJson)
        // tem que colocar o toList no final senao da erro e vira um iterable
        .toList();
    // nao podemos esquecer do retorno
    return todos;
  }
}
