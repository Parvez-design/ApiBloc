import 'package:blocApi/api_model.dart';
import 'package:blocApi/repositories/api_get.dart';

class ApiFetching {
  final ApiCalling apiCalling;
  ApiFetching({this.apiCalling});
  Future<List<ApiModel>> fetchApi() async {
    return await apiCalling.getApi();
  }
}
