import 'dart:async';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_main/Network/dioClient.dart';

typedef Onsuccessfull = Function(dynamic response);
typedef OnProgressed = Function();
typedef onError = Function(String errorMsg);

class Diowrapper {
  final Onsuccessfull onsuccessfull;
  final OnProgressed onProgressed;
  final onError onerror;
  final String urlBasic;
  final FormData? formData;
  Diowrapper({
    required this.onsuccessfull,
    required this.onProgressed,
    required this.onerror,
    required this.urlBasic,
    this.formData,
  });

  postDioResponse() async {
    try {
      onProgressed();
      Dioclient dioclient = Dioclient.defaultClient();
      final response = await dioclient.dio?.post(
        urlBasic,
        data: formData,
        options: Options(),
      );
      print("the response is $response ${formData?.fields}");
      if (response?.data == null || response?.data == "") {
        onerror("Something went wrong");
      } else {
        if (response?.statusCode == 200 || response?.statusCode == 201) {
          print("INSIDE 200 BLOCK");

          onsuccessfull(response?.data);
        } else {
          onerror(response?.statusMessage ?? "Something went Wrong");
        }
      }
    } on TimeoutException catch (e) {
      onerror("Connection Timeout");
      print(e.toString());
    } on DioException catch (e) {
      print(e.toString());
    } finally {
      print("FUNCTION EXECUTED");
    }
  }

  getDioResponse() async {
    print("INSIDE GET DIO RESPONSE ");
    try {
      onProgressed();
      Dioclient dioclient = Dioclient.defaultClient();
      dioclient.dio?.options.headers = {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
        'Accept': 'application/json',
      };
      final response = await dioclient.dio?.get(urlBasic);
      print("the response is $response");
      if (response?.data == null || response?.data == "") {
        onerror("Something went wrong");
      } else {
        if (response?.statusCode == 200 || response?.statusCode == 201) {
          print("INSIDE 200 BLOCK");

          onsuccessfull(response?.data);
        } else {
          onerror(response?.statusMessage ?? "Something went Wrong");
        }
      }
    } on TimeoutException catch (e) {
      onerror("Connection Timeout");
      print(e.toString());
    } on DioException catch (e) {
      print(e.toString());
      onerror("Connection Timeout status");
    } finally {
      print("FUNCTION EXECUTED");
    }
  }
}
