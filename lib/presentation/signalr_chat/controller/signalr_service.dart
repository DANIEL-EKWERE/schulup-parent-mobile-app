//import 'package:schulupparent/core/utils/logger.dart';
import 'package:logger/logger.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SignalRService {
  HubConnection? _hubConnection;

  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
    ),
  );

  Future<void> startConnection(String token) async {
    _hubConnection =
        HubConnectionBuilder()
            .withUrl(
              'https://api.schulup.com/conversationHub',
              options: HttpConnectionOptions(
                logMessageContent: true,
                // Removed incompatible logger argument (package:logger.Logger is a different type
                // than the Logger expected by signalr_netcore). If needed, provide an adapter
                // implementing the signalr_netcore Logger interface instead.
                //logger: ,
                accessTokenFactory: () async => token,
              ),
            )
            .build();
    await _hubConnection?.start();
  }

  void receiveMessages() {
    _hubConnection?.on('ReceiveMessage', (message) {
      print('Received: ${message?[0]}');
    });
  }

  void sendMessage(String user, String message) {
    _hubConnection?.invoke('SendMessage', args: [user, message]);
  }

  Future<void> stopConnection() async {
    await _hubConnection?.stop();
  }
}
