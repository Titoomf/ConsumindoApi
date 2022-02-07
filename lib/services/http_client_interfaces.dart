// declaramos abstrac class e colocamos o I por ser interface e o nome da classe
// vamos fazer nessa classe as assinatura que queremos que contenha na outras classes
// o que queremos que o http faca? queremos que tenha um funcao get que
//voce passe a url e ele retorne uma futere de um dynamic
// todos vao ter a mesma sinatura
// posso fazer com o post tambem Futere<dynamic> post (string url);
// posso criar minhas abstracao a partir daqui
// vou implentar no meu dio minha assinatura

abstract class IHttpClient {
  Future<dynamic> get(String url);
}
