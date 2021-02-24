abstract class ApiRequest {
  ApiRequest();
  ApiRequest.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
