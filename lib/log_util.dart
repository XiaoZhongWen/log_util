library log_util;

import 'dart:developer';

class LogUtil {
  static const String _defTag = "common_util";
  static bool _debugMode = false;
  static int _maxLen = 128;
  static String _tagValue = _defTag;

  static void init({
    String tag = _defTag,
    bool isDebug = false,
    int maxLen = 128
  }) {
    _tagValue = tag;
    _debugMode = isDebug;
    _maxLen = maxLen;
  }

  static void d(Object? object, {String? tag}) {
    if (_debugMode) {
      log('$tag d | ${object?.toString()}');
    }
  }

  static void e(Object? object, {String? tag}) {
    if (_debugMode) {
      _printLog(tag, " e ", object);
    }
  }

  static void v(Object? object, {String? tag}) {
    if (_debugMode) {
      _printLog(tag, " v ", object);
    }
  }

  static void _printLog(String? tag, String stag, Object? object) {
    String str = object.toString();
    tag = tag ?? _defTag;
    if (str.length <= _maxLen) {
      print('$tag$stag $str');
      return;
    }
    print('$tag$stag- - - - - - - - - - - - - - start - - - - - - - - - - - - - - ');
    while(str.isNotEmpty) {
      if (str.length > _maxLen) {
        print('$tag$stag| ${str.substring(0, _maxLen)} ');
        str = str.substring(_maxLen, str.length);
      } else {
        print('$tag$stag| $str');
        str = '';
      }
    }
    print('$tag$stag- - - - - - - - - - - - - - end - - - - - - - - - - - - - - ');
  }
}
