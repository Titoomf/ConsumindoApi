// criando um modulo de injecao de dependencia ,e como fazemos isso
// criando um classe appModule e extends de module {}
// depois colocamos os binds(ligar) seria todas as coisas que iam ser injetada e as routes
// todo aquele treco de codigo que ficou la na home ,
// vamos trazer pra essa classe para começar a trabalhar de forma mais legivel
//final controller = HomeController(JsonPlaceholderService(DioCliente()));
// agora vamos fazer essa ligacao no binds
// temos varios binds, factory quando voce chmar vai criar um novo
// temos um singleton que ele cria so uma vez
// criamos um sigleton e passamos o homeController ,
// ele recebe um JsonPlaceHolder,
//so que quem vai ffazer essa verificacao é o modular nao preciso
//ficar me preocupando , entao eu coloco um "i()"" de injeção modular,
// antes disso eu crio uma bind para o JsonPlaceholderService,
//que ele vai me retorna um IHttpClient  e isso que o modular vai verificar
// e la na homePage que ele vai fazer essa injeção
// faço a minha rota com ChildRouter passa a rota e um filho sem arguments
// e agora para funcionar iremos na main e colocar o
// modularapp que vai receber 2 parametros , o nosso appModule e o Myapp
// agora consigo muda meu serviço caso ele nao funcione , dioclint,httpPackageClient

import 'package:consumindoapis/controllers/home_controller.dart';
import 'package:consumindoapis/services/dio_cliente.dart';
import 'package:consumindoapis/views/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/http_client_interfaces.dart';
import 'services/json_placeholder_services.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IHttpClient>((i) => DioCliente()),
        Bind.singleton((i) => JsonPlaceholderService(i())),
        Bind.singleton((i) => HomeController(i())),
      ];
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => HomePage())];
}
