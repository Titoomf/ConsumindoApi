// nesse classe iremos usa uma reatividade
// aqui eu vou chamar meu servicos para na hora de clicar ele fazer uma ação
// meu services é meu JsonPlaceHollder e ele recebe um cliente que serio o meu
//servios(http,dio,uno) no caso vou usar o DioCliente e depois
// vou ter uma lista de todos e uma  ação
// criando assim um var para todos = <todoModel>[];
// var= é uma palavra-chave, que significa "Eu não me importo de anotar qual é o tipo aqui
//." O Dart substituirá a varpalavra-chave
// pelo tipo de inicializador ou a deixará dynamicpor padrão se não houver inicializador.

//Use var se você espera que uma atribuição de variável mude durante sua vida útil:

import 'package:consumindoapis/models/todo_model.dart';

import 'package:consumindoapis/services/json_placeholder_services.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  // fazendo uma mudando para passar o service
  //pelo construtor para que consiga fazer o mock do services
  //final _service = JsonPlaceholderService(DioCliente());

  //-----MOCK------SERVICES-----
  // EU INICIO ELE ASSIM , PASSANDO PELO construtor
  // agora eu ja consigo mock meu JsonPlaceholderService la no test
  final JsonPlaceholderService _service;

  HomeController(this._service);
  var todos = <TodoModel>[];

  // minha ação buscar todos os todos, o que essa ação vai ser ? vai ser uma
  // future que nao vai me retorna nada pois é uma ação
  Future<void> fetchAllTodos() async {
    // vamos consumir essa api, quando eu recebe
    //meus todos ele vai pegar direto o getTodos e vai me retorna uma lista
    // agora eu tenho que comunicar com a view para falar que deu tudo certo
    // e isso fazemos com a reatividade de changeNotifier
    // vou ter inha variavel privato pq eu so vou usar ela aqui dentro
    // o changeNotifer funciona tipo um mega fone onde
    //quando tu falar so vai escutar que ta ouvindo e todo
    //mundo que ouvir o controller vai poder escutare e quando voce vai gritar pra quem ta ouvindo
    // quando voce notificar dai voce usar o metodo notifyListiners() que vem da classe ChangeNotifier
    // entao quando ele ouvir alguma coisa ele vai alterar os todos
    // agora criamos um ambiente de test para testar o controller (homecotroller)
    todos = await _service.getTodos();
    // aqui que ta vindo o changeNotifier ,
    //que o controller vai pegar e quando dispara aqui a biulder ouve na view e acontece o precesso
    notifyListeners();
  }
}
