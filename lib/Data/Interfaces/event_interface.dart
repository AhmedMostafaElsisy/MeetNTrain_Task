import '../Models/base_model.dart';
import 'base_interface.dart';

abstract class EventRepositoryInterface extends BaseInterface {
  Future<BaseModel> getUpComingEvent({
    required int page,
    required String date,
  });
}
