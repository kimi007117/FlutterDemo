class Logger {
  static const String TAG_DEF = "###Sales Flutter###";

  static bool isDebug = true; //是否是debug模式

  static void init({bool debuggable = true}) {
    isDebug = debuggable;
  }

  static void log(Object object, {String tag}) {
    if (isDebug) {
      printLog(tag, '  v  ', object);
    }
  }

  static void error(Object object, {String tag}) {
    printLog(tag, '  e  ', object);
  }

  static void printLog(String tag, String stag, Object object) {
    StringBuffer sb = new StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? TAG_DEF : tag);
    sb.write(stag);
    sb.write(object);
    print(sb.toString());
  }
}
