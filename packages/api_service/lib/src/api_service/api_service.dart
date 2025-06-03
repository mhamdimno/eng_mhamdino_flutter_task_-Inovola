abstract class ApiService {
  Future<T> get<T>(String path,
      {required JsonConverterResponse<T> fromJson,
      Map<String, dynamic>? queryParameters});

  Future<T> getDynamicObject<T>(String path,
      {required JsonConverterDynamicResponse<T> fromJson,
      Map<String, dynamic>? queryParameters});

  Future<String?> getString(String path,
      {Map<String, dynamic>? queryParameters});

  Future<void> download(
    String path,
    String finalPath,
  );

  Future<List<T>> getList<T>(String path,
      {required JsonConverterResponse<T> fromJson,
      Map<String, dynamic>? queryParameters});

  Future<T> post<T>(String path,
      {dynamic data,
      required JsonConverterResponse<T> fromJson,
      String? contentType,
      bool withData = true});

  /// Sends a POST request to the specified [path] and returns a list of
  /// objects of type [T] by converting the response using [fromJson].
  ///
  /// The [queryParameters] are optional and will be appended to the URL.
  /// The [body] contains the data to be sent in the POST request.
  /// The [contentType] specifies the media type of the request data.
  ///
  /// Returns a [Future] that resolves to a list of objects of type [T].

  Future<List<T>> postList<T>(String path,
      {required JsonConverterResponse<T> fromJson,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      String? contentType});

  Future<T> put<T>(String path,
      {dynamic data, required JsonConverterResponse<T> fromJson});

  Future<T> delete<T>(String path,
      {required JsonConverterResponse<T> fromJson});

  Future<T> upload<T>(String path,
      {required JsonConverterDynamicResponse<T> fromJson,
      Map<String, dynamic>? data,
      required String filePath,
      String? fileName,
      Map<String, dynamic>? queryParameters});
}

typedef JsonConverterResponse<T> = T Function(Map<String, dynamic>);

typedef JsonConverterDynamicResponse<T> = T Function(dynamic);
