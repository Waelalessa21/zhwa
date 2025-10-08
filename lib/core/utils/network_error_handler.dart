import 'package:dio/dio.dart';

class NetworkErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى';
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          switch (statusCode) {
            case 400:
              return 'طلب غير صحيح';
            case 401:
              return 'غير مصرح لك بالوصول';
            case 403:
              return 'ممنوع الوصول';
            case 404:
              return 'المورد غير موجود';
            case 422:
              return 'بيانات غير صحيحة';
            case 500:
              return 'خطأ في الخادم';
            default:
              return 'حدث خطأ في الشبكة';
          }
        case DioExceptionType.cancel:
          return 'تم إلغاء الطلب';
        case DioExceptionType.connectionError:
          return 'خطأ في الاتصال بالإنترنت';
        case DioExceptionType.badCertificate:
          return 'شهادة غير صحيحة';
        case DioExceptionType.unknown:
          return 'خطأ غير معروف';
      }
    }
    
    if (error is Exception) {
      return 'حدث خطأ غير متوقع';
    }
    
    return 'حدث خطأ غير معروف';
  }
}
