import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'server_event.dart';
part 'server_state.dart';

class ConfaBloc extends Bloc<ServerEvent, ServerState> {
  ConfaBloc() : super(ServerInitial()) {
    on<ServerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
