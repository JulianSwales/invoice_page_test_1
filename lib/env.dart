import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
    @EnviedField(varName: 'STRIPE_KEY', obfuscate: true)
    static final String key = _Env.key;
}