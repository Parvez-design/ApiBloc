import 'package:bloc/bloc.dart';
import 'package:blocApi/api_model.dart';
import 'package:blocApi/api_state_event.dart';
import 'package:blocApi/repositories/repository_fetch.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiFetching apiFetching;
  ApiBloc({this.apiFetching});
  @override
  ApiState get initialState => ApiEmpty();

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    if (event is FetchApi) {
      yield ApiLoading();
      try {
        List<ApiModel> models = await apiFetching.fetchApi();
        yield ApiLoaded(api: models);
      } catch (e) {
        yield e;
      }
    }
  }
}
