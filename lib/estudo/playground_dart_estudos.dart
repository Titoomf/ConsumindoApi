// // // sempre trabalhando com programaçã assincrona

// // import 'dart:convert';
// // import 'dart:io';

// // void main() async {
// //   // fazendo primeiro no dart puro
// //  *** var url = 'https://jsonplaceholder.typicode.com/todos';*****

// //   // obejto nativo do dart que, e ele cria uma possibilitada de enviar
// // uma requisicao(request),
// //   // e receber um response(resposta).
// //   **final client = HttpClient();**

// //   // 1 - passo criar um requisição(request) objeto,
// //   // 2 -para pegar a requisiçao acesso o client.openUrl.
// //   // ele recebe uma Uri.parse(url ) que é a String,
// //   // e recebe um metodo que geralmente é o get.
// //   // coloco um await que eu quero esperar a busca da url,
// //   //so que nao enviamos nada ainda.
// //   // estamos montando o socket
// //   **final request = await client.openUrl('get', Uri.parse(url));**
// //   // receber jason vamos fazer o protocolo Header(cabeçalho_) content-type e o valor application/json
// //   request.headers.set('Content-Type', 'application/json');
// //   // **response**
// //   // como eu enviei um socket eu tenho que fechar,
// //   // // e assim vem a resposta que seria o HttpClientResponse.
// //   // so que o meu response é uma stream que seria meu fluxo de dados

// //   **final response = await request.close();**
// //   // a stream que é fluxo de dados pode ser escutada que varias forma
// //   // o data vai me trazer varios bites(numeros)

// // // aqui é ele vem em varias demanda de array , cada poiscao ,
// // //vem uma coisa e vem quebrado, entao tenho que junta ela é algum canto, entao faço um array de string vazio numa list
// //   final list = <String>[];

// //   await for (var data in response) {
// //     final string = utf8.decode(data);

// //     list.add(string);
// //   }
// //   // aqui eu vou junto toda minha string e uma unica só ,
// // agora nao vai vim quebrada
// //   final body = list.join();
// // }
// //---------------------------------------------------------------------------------------------------------------------------------------------------
// //-----------------------------------------------------------------------------------------------------------------------------------------------------
// //  // uma forma é fazer com listen
// //   // response.listen(
// //   //   (data) {

// //   //     // vou pegar esse data e transforma em string fazendo um decode(decodificar)
// //   //     // fazendo essa tranformaçao para String recebemos o nosso json,
// //   //     //so que vem quebrado(chunk).
// //   //     final string = utf8.decode(data);
// //   //   },
// //   // );

// import 'dart:convert';
// import 'package:dio/dio.dart';

// // import 'package:http/http.dart' as http;

// void main() async {
//   var url = 'https://jsonplaceholder.typicode.com/todos';
//   // final response = await http.get(Uri.parse(url));
//   // final json = jsonDecode(response.body);
//   // print(response.body);

// // o dio ja vem como map, entao fica mais facil de covert a String
//   final response = await Dio().get(url);
//   print(response.data[0]);
// }















// import 'dart:convert';
// import 'dart:io';
// // importando package do http
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

// // depois que customizarao cada um http,dio
// void main() async {
//   var url = "https://jsonplaceholder.typicode.com/todos";

//   final response = await Dio().get(url);
//   // aqui ele ja faz o map e convert os dados
//   print(response.data[0]);
// }

// void httpPackage() async {
//   var url = "https://jsonplaceholder.typicode.com/todos";

//   final response = await http.get(Uri.parse(url));
//   final body = response.body;
//   final json = jsonDecode(response.body);
//   print(body);
// }

// // codigo do dart puro

// void httpCliente() async {
//   var url = "https://jsonplaceholder.typicode.com/todos";

//   final client = HttpClient();

//   final request = await client.openUrl('get', Uri.parse(url));
//   request.headers.set('Content-Type', 'application/json');

//   final respose = await request.close();

//   final list = <String>[];

//   await for (var data in respose) {
//     final string = utf8.decode(data);
//     list.add(string);
//   }
//   final body = list.join;
// }
