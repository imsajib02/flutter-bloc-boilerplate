import 'custom_trace.dart';
import 'dart:developer';

class CustomLogger {

  static CustomTrace? programInfo;

  CustomLogger._();

  static debug({required CustomTrace trace, required String tag, required dynamic message}) {

    try {
      programInfo = trace;

      log("\n<----------  DEBUG  ---------->\n\n"
          "|  FileName: ${programInfo?.fileName}  |  FunctionName: ${programInfo?.functionName}  |  Line: ${programInfo?.lineNumber}  |\n"
          "\n<<<<<  $tag  >>>>>  $message\n"
          "\n<----------------------------->\n\n");

    } catch(_) {}
  }

  static error({required CustomTrace trace, required String tag, required dynamic message}) {

    try {
      programInfo = trace;

      log("\n<----------  ERROR  ---------->\n\n"
          "|  FileName: ${programInfo?.fileName}  |  FunctionName: ${programInfo?.functionName}  |  Line: ${programInfo?.lineNumber}  |\n"
          "\n<<<<<  $tag  >>>>>  $message\n"
          "\n<----------------------------->\n\n");

    } catch(_) {}
  }

  static info({required CustomTrace trace, required String tag, required dynamic message}) {

    try {
      programInfo = trace;

      log("\n<----------  INFO  ---------->\n\n"
          "|  FileName: ${programInfo?.fileName}  |  FunctionName: ${programInfo?.functionName}  |  Line: ${programInfo?.lineNumber}  |\n"
          "\n<<<<<  $tag  >>>>>  $message\n"
          "\n<---------------------------->\n\n");

    } catch(_) {}
  }

  static warning({required CustomTrace trace, required String tag, required dynamic message}) {

    try {
      programInfo = trace;

      log("\n<----------  WARNING  ---------->\n\n"
          "|  FileName: ${programInfo?.fileName}  |  FunctionName: ${programInfo?.functionName}  |  Line: ${programInfo?.lineNumber}  |\n"
          "\n<<<<<  $tag  >>>>>  $message\n"
          "\n<------------------------------->\n\n");

    } catch(_) {}
  }
}