import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'server_event.dart';
part 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  ServerBloc() : super(ServerInitial()) {
    on<ServerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
