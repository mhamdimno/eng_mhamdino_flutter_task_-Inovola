abstract class ApiResponse<T> {
  T fromJson(Map<String, dynamic> json);
}
