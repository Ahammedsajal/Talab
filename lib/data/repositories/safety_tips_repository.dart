import 'package:Talab/data/model/data_output.dart';
import 'package:Talab/data/model/safety_tips_model.dart';
import 'package:Talab/utils/api.dart';

class SafetyTipsRepository {
  Future<DataOutput<SafetyTipsModel>> fetchTipsList() async {
    try {
      Map<String, dynamic> response = await Api.get(
        url: Api.getTipsApi,
        queryParameters: {},
      );

      List<SafetyTipsModel> list = (response['data'] as List).map(
        (e) {
          return SafetyTipsModel.fromJson(e);
        },
      ).toList();

      return DataOutput(total: list.length, modelList: list);
    } catch (e) {
      rethrow;
    }
  }
}
