// import 'package:dio/dio.dart';

// class HttpService {
//   Dio _dio;
//   final baseUri = 'https://reqres.in';

//   HttpService() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: baseUri,
//       ),
//     );
//     initializeInterceptors();
//   }
//   initializeInterceptors() {
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (option, handle) {
//         print('Request option $option.headers');
//       },
//       onError: (option, handle) {
//         print('Error option.$option.uri');
//       },
//       onResponse: (option, handle) {
//         print('Response option.$option.uri');
//       },
//     ));
//   }
// }
