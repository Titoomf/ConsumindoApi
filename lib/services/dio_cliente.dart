import 'package:dio/dio.dart';

import 'http_client_interfaces.dart';

// aqui minha classe vai implementar a assinatura no metodo que estar na interfaces IHttp
// aqui eu vou desenvolver aquela assinatura pois como é implements aqui eu realizo o metodo
// eu sei que vou receber um respose entao crio uma variavel async e pego meu dio.get(url)
// e vai me retornar informoaçao
// dynamic seria é uma indicação que o objeto pode ser de um tipo qualquer e qualquer coisa que você tente acessar o compilador deixará sem dar erro (não quer dizer que funcionará, poderá dar erro durante a execução se o objeto concreto não possuir o membro que está acessando). É só uma sintaxe para desligar a verificação de tipos.
// criei minha implementação do dio
// no meu JsonPlaceholder em vez de eu receber o dio ,
//dentro da classe eu recebo minha implementação mas eu posso tambem colocar para ,
//sempre  receber do contrato  da interface

class DioCliente implements IHttpClient {
  final dio = Dio();
  @override
  Future<dynamic> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
