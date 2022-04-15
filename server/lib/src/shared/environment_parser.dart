enum RuntimeEnvironment {
  localDevelopment,
  cloudDevelopment,
  notProduction,
  production
}

class RuntimeEnvParser {
  static RuntimeEnvironment getEnvFromString(String env) {
    switch (env.toLowerCase().trim()) {
      case 'local-dev':
        return RuntimeEnvironment.localDevelopment;
      case 'cloud-dev':
        return RuntimeEnvironment.cloudDevelopment;
      case 'non-prod':
        return RuntimeEnvironment.notProduction;
      case 'prod':
        return RuntimeEnvironment.production;
      default:
        throw ArgumentError.value(env, 'env', 'Invalid environment specified');
    }
  }

  // TODO: Implement this method
  // Do some checks here to try to confirm we aren't doing something
  // silly like trying to run localDevelopment when we are actually
  // running in production for example.
  static void verifyEnv() {}
}
