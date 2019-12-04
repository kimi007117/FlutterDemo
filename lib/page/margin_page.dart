import 'package:flutter/material.dart';
import 'package:flutter_app/common/log/log_utils.dart';

class MarginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    LogUtil.d("""{"code":200,"msg":"OK","timestamp":0,"data":[{"cover":"","sub_title":"","listen_num":0,"report":"","id":23644,"title":"","type":10002,"jump_info":{"mid":"","id":0,"url":"000kD0DI1EXpLO"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1788145.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23601,"title":"","type":3002,"jump_info":{"mid":"","id":0,"url":"https://y.qq.com/m/digitalbum/gold/index.html?openinqqmusic=1&_video=true&mid=000XEFal22lEwn&g_f=yqqjiaodian"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1781138.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23646,"title":"","type":10002,"jump_info":{"mid":"","id":0,"url":"
003XxGq831zlQv"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1788739.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23554,"title":"","type":3002,"jump_info":{"mid":"","id":0,"url":"https://y.qq.com/m/digitalbum/gold/index.html?openinqqmusic=1&_video=true&mid=000H3CIo2BRJCl&g_f=yqqjiaodian"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1781158.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23648,"title":"","type":10002,"jump_info":{"mid":"","id":0,"url":"003VJ4rz4FltZy"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1788440.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","
id":23636,"title":"","type":10002,"jump_info":{"mid":"","id":0,"url":"003BVXph3haZPj"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1783665.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23619,"title":"","type":10002,"jump_info":{"mid":"","id":0,"url":"000iCavD0beBPq"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1784125.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23629,"title":"","type":10002,"jump_info":{"mid":"","id":0,"url":"003HbRAe4Y8qqG"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1786011.jpg","urlex1":""}},{"cover":"","sub_title":"","listen_num":0,"report":"","id":23617,"title":"","t
ype":10002,"jump_info":{"mid":"","id":0,"url":"000W8zPv1woZcd"},"pic_info":{"urlex2":"","mid":"","url":"http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1780111.jpg","urlex1":""}}]}""");
    return _MarginPageState();
  }
}

class _MarginPageState extends State<MarginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Margin"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: new BoxDecoration(
              color: Colors.yellow,
            ),
            child: Text(
              "测试1",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFE6E6E6),
          ),
          Container(
//            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: new BoxDecoration(
              color: Colors.yellow,
            ),
            child: Text(
              "测试2",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFE6E6E6),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: new BoxDecoration(
              color: Colors.yellow,
            ),
            width: double.infinity,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              child: Text(
                "测试3",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFE6E6E6),
          ),
          Container(
            width: 80.0,
            height: 48,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: new BoxDecoration(
              color: Colors.yellow,
            ),
            child: Text(
              "测试4",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFE6E6E6),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: new BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFFfbab66), Color(0xFFf7418c)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
//            width: double.infinity,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              child: Text(
                "测试5",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFE6E6E6),
          ),
        ],
      ),
    );
  }
}
