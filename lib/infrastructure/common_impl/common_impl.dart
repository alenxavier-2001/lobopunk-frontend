import 'package:injectable/injectable.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/domain/common_services/common_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CommonService)
class CommonImplementation implements CommonService {
  @override
  Future changeQuality(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('quality', data);

    qualityNotifier.value = data;
  }
}
