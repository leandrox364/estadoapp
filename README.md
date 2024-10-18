##  Controle do Estado da Aplicação Android.

  <a href="https://github.com/leandrox364/estadoapp/blob/main/EstadodoApp.jpg">
    <img alt="Estado do App" height="500" src="https://github.com/leandrox364/estadoapp/blob/main/EstadodoApp.jpg">
  </a>  
</p><br>
<p align="center">
  <b>Estado do App</b> Feito para controlar o tempo de inativdade do aplicação, gerando segurança para o usuário que esquece o app logado.
  Após um tempo sem uso o mesmo o app será fechado.
  

## 🛠️ Desenvolvido em:

**Embarcadero Delphi 12CE**.

Use a unit FMX.Platform;

##  Aqui os estados que a aplição pode está:.
BecameActive - Seu aplicativo ganhou o foco.

EnteredBackground - O usuário não está mais usando seu aplicativo, mas seu aplicativo ainda está em execução em segundo plano.

FinishedLaunching - Seu aplicativo foi iniciado.

LowMemory - Isso avisa seu aplicativo que o dispositivo está ficando sem memória.
Seu aplicativo deve reduzir o uso de memória, liberando estruturas e dados que podem ser carregados novamente em um momento posterior.

OpenURL - Seu aplicativo recebeu uma solicitação para abrir uma URL.

Eventos de aplicativo desse tipo geralmente são associados a um contexto. Este contexto é uma instância da classe TiOSOpenApplicationContext somente para iOS, que fornece as seguintes propriedades somente leitura:

TiOSOpenApplicationContext.SourceApp é uma string que contém o ID do pacote do aplicativo que solicitou que seu aplicativo abrisse a URL.
TiOSOpenApplicationContext.URL é a URL a ser aberta, seja um recurso de rede ou um arquivo.
TiOSOpenApplicationContext.Context é um ponteiro para um objeto de lista de propriedades que pode fornecer informações adicionais.
Veja a documentação de referência da API do iOS para mais informações.

TimeChange - Houve uma mudança significativa no horário.
Este evento pode acontecer, por exemplo, quando o dia muda ou quando o dispositivo muda para ou do horário de verão.

WillBecomeForeground - O usuário agora está usando seu aplicativo, que antes estava em segundo plano.

WillBecomeInactive - Seu aplicativo perderá o foco.

WillTerminate - O usuário está saindo do seu aplicativo.


