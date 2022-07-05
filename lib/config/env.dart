import 'package:dotenv/dotenv.dart';

class Env {
  static final Env _env = Env._internal();
  final DotEnv _envFile = DotEnv(includePlatformEnvironment: true)..load();

  factory Env() {
    return _env;
  }

  Env._internal();

  String? get gitHubPersonalToken => _envFile["github_personal_token"];
}
