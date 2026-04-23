import 'package:http/http.dart' as http;
import 'package:bugaoshan_ohos/injection/injector.dart';
import 'package:bugaoshan_ohos/providers/scu_auth_provider.dart';

class ScuMicroserviceAuthService {
  Future<http.Client?> getAuthenticatedClient() async {
    final auth = getIt<ScuAuthProvider>();
    if (auth.accessToken == null) return null;

    return await auth.service.bindSession();
  }
}
