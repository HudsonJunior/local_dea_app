import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/infra/resources/api_response.dart';
import 'package:local_dea_app/infra/resources/siga_api.dart';

class DeaRemoteDatasource {
  final SigaApi api;

  DeaRemoteDatasource({
    required this.api,
  });

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<ApiResponse<Iterable<EmergencyServiceModel>>> getDeas() async {
    try {
      final response = await firestore.collection('deas').get();

      return SuccessApiResponse(
        data: EmergencyServiceModel.fromJsonListFirebase(response.docs),
      );
    } on Exception catch (error) {
      return FailApiResponse(error: error.toString());
    }
  }

  Future<ApiResponse<bool>> registerDea(EmergencyServiceModel model) async {
    try {
      await firestore.collection('deas').add(model.toJson());

      return SuccessApiResponse(data: true);
    } on Exception catch (error) {
      return FailApiResponse(error: error.toString());
    }
  }
}
