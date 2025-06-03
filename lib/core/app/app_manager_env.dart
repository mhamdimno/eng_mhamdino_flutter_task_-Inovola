enum AppManagerEnv { dev, prod, testing }

extension AppManagerEnvHelper on AppManagerEnv {
  String get dependencyInjectionEnv {
    if (this == AppManagerEnv.prod) {
      return 'prod';
    }
    return 'dev';
  }

  String get baseUrl {
    return 'https://api.currencyapi.com/v3';
  }
}
