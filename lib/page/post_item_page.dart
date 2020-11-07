import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/widget/linear_percent_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostItemPageState();
  }
}

class _PostItemPageState extends State<PostItemPage> {
  List<String> pics = List();

  List<String> titles = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pics.add(
        "https://t8.baidu.com/it/u=2247852322,986532796&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603957739&t=c3ccd055a00306e11a42ef2315216863");
    pics.add(
        "https://t8.baidu.com/it/u=3571592872,3353494284&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603955043&t=606b426abe363585a8c29e5415c4da02");
    pics.add(
        "https://t7.baidu.com/it/u=3616242789,1098670747&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603955043&t=ec1054ac0eb932a0c839cf6a7e73255c");
    pics.add(
        "https://t8.baidu.com/it/u=2247852322,986532796&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603957739&t=c3ccd055a00306e11a42ef2315216863");

    titles.add("value");
    titles.add("value");
    titles.add("value");
    titles.add("value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PostItemPage"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                _buildUserInfo(),
                _buildContent(),
                _buildImages(context, false),
                _buildLocalAndCircle(),
                _buildBottomBar(),
                _buildInterest(),
                _buildVote(),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Color(0xFFF5F5F5),
                  child: Text(
                    "喜欢xxx的人都在看",
                    maxLines: 1,
                    style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: 25,
                          height: 0.5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFACACB9)),
                          ),
                        ),
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '没有更多内容，去',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF333333),
                              ),
                            ),
                            TextSpan(
                              text: '推荐',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF408AFF)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Fluttertoast.showToast(msg: "推荐");
                                },
                            ),
                            TextSpan(
                              text: '看看',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: 25,
                          height: 0.5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFACACB9)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: Color(0xFFE6E6E6),
                ),
              ],
            ),
          ),
        ));
  }

  /// 用户信息
  Widget _buildUserInfo() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipOval(
                    child: CachedNetworkImage(
                      width: 30,
                      height: 30,
                      imageUrl:
                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603377181101&di=f14a4c09b00f3c5ec9a06aa4506e70a9&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201410%2F09%2F20141009224754_AswrQ.jpeg",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              '倪兴峰',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF333333)),
                            ),
                            Expanded(
                              child: _buildTags(),
                            )
                          ],
                        ),
                        Text(
                          '餐饮厨师·临沂人·在北京',
                          maxLines: 1,
                          style:
                              TextStyle(fontSize: 10, color: Color(0xFF666666)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildFollow(false)
        ],
      ),
    );
  }

  /// 关注widget
  Widget _buildFollow(bool followed) {
    if (followed) {
      return Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFDEDEDE),
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Text("已关注",
            style: TextStyle(fontSize: 13, color: Color(0xFFACACB9))),
      );
    }
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF32BE4A),
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child:
          Text("关注", style: TextStyle(fontSize: 13, color: Color(0xFF32BE4A))),
    );
  }

  /// 标签widget
  Widget _buildTags() {
    List<Widget> tags = [];
    for (int i = 0; i < 3; i++) {
      tags.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 2, right: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFDEDEDE),
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 2),
            child: Text('标签$i',
                maxLines: 1,
                style: TextStyle(fontSize: 10, color: Color(0xFFACACB9))),
          ),
        ),
      ));
    }
    return Container(
      child: Row(
        children: tags,
      ),
    );
  }

  /// 内容widget
  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: '#大学生找工作#',
              style: TextStyle(fontSize: 15, color: Color(0xFF408AFF)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('点击了服务条款');
                },
            ),
            TextSpan(
              text: ' 刚大学毕业改何去何从呢？',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('点击了隐私政策');
                },
            ),
            TextSpan(
              text:
                  '刚大学毕业改何去何从呢?大学毕业，想找工作，大学毕业，想找工作，大学毕业，想找工怎么就这么难呢？不知道是不是大学毕业，想找工作，大学毕业，想找工作，大学毕业，想找工怎么就这么难呢？不知道是不是',
              style: TextStyle(fontSize: 15, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }

  /// 图片widget
  Widget _buildImages(BuildContext context, bool isVideo) {
    List<Widget> widgets = [];
    if (pics.length > 0) {
      // 视频帖子图片处理
      if (isVideo) {
        Size size = MediaQuery.of(context).size;
        double width = (size.width - 40);
        return RepaintBoundary(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      width: width,
                      height: 188,
                      image: CachedNetworkImageProvider(pics[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Icon(Icons.thumb_up),
                  Positioned(
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Text(
                        "01:32",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    right: 10,
                    bottom: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      }

      // 普通图片帖子
      if (pics.length == 1) {
        widgets.add(RepaintBoundary(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  width: 220,
                  height: 220,
                  image: CachedNetworkImageProvider(pics[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
      } else {
        Size size = MediaQuery.of(context).size;
        int count = pics.length > 3 ? 3 : pics.length;
        double width = (size.width - 40) / count - 6;
        for (int i = 0; i < count; i++) {
          widgets.add(RepaintBoundary(
            child: Container(
              margin: EdgeInsets.all(3),
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    width: width,
                    height: width,
                    imageUrl: pics[i],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ));
        }
      }
      if (pics.length > 3) {
        Size size = MediaQuery.of(context).size;
        int count = pics.length > 3 ? 3 : pics.length;
        double width = (size.width - 40) / count - 6;
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: Stack(
            children: <Widget>[
              Row(
                children: widgets,
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: width,
                  height: width,
                  margin: EdgeInsets.all(3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text(
                    "+${pics.length}",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: widgets,
            ));
      }
    }
    return Container(
      height: 0,
      width: 0,
    );
  }

  /// 当前位置和圈子
  Widget _buildLocalAndCircle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.person_pin_circle),
              SizedBox(
                width: 3,
              ),
              Text(
                "北京·朝阳",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF323435),
                ),
              ),
            ],
          ),
          _buildCircle(false),
        ],
      ),
    );
  }

  /// 圈子widget
  Widget _buildCircle(bool isAdded) {
    if (isAdded) {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 2, right: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.contacts),
                Text(
                  "保安职位",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF323435),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 2, right: 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.add_circle_outline),
              SizedBox(
                width: 3,
              ),
              Text(
                "展示圈子名称",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF323435),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  width: 0.5,
                  height: 9,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFACACB9)),
                  ),
                ),
              ),
              Text(
                "加入",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF408AFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// item底部三个按钮
  Widget _buildBottomBar() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.share),
              SizedBox(
                width: 5,
              ),
              Text(
                "34",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.message),
              SizedBox(
                width: 5,
              ),
              Text(
                "12",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.thumb_up),
              SizedBox(
                width: 5,
              ),
              Text(
                "6",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInterest() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "你可能感兴趣的人",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "查看更多",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/icon_back_arrow.png'),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 155,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: titles.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int position) {
                return _buildPeople(context, titles[position]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeople(context, String url) {
    return GestureDetector(
      child: Container(
        width: 105,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(color: Color(0xFFF5F5F5), blurRadius: 2),
            ],
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: CachedNetworkImage(
                        width: 30,
                        height: 30,
                        imageUrl:
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603377181101&di=f14a4c09b00f3c5ec9a06aa4506e70a9&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201410%2F09%2F20141009224754_AswrQ.jpeg",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "倪兴峰",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "临沂人·在北京",
                      style: TextStyle(color: Color(0xFF666666), fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    _buildPeopleTags(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF32BE4A),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Text("关注",
                          style: TextStyle(
                              fontSize: 13, color: Color(0xFF32BE4A))),
                    )
                  ],
                ),
              ),
              Positioned(
                child: Icon(Icons.close),
                right: 3,
                top: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeopleTags() {
    List<Widget> tags = [];
    for (int i = 0; i < 2; i++) {
      tags.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 2, right: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFDEDEDE),
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 2),
            child: Text('标签$i',
                maxLines: 1,
                style: TextStyle(fontSize: 10, color: Color(0xFFACACB9))),
          ),
        ),
      ));
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tags,
      ),
    );
  }

  Widget _buildVote() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('你介意和陌生人拍照吗？',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold)),
          Container(
            width: double.infinity,
            height: 156,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/bg_post_card_vote.png')),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: _buildPositive(),
                  top: 15,
                  left: 25,
                ),
                Positioned(
                  child: _buildNegative(),
                  top: 25,
                  right: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPositive() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('不介意',
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text('支持数：',
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF))),
              Text('30%',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.end,
            width: 105,
            lineHeight: 3,
            percent: 0.3,
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Colors.white54,
            progressColor: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            child: Text('投票', maxLines: 1, style: TextStyle(fontSize: 12)),
            onPressed: () {},
            elevation: 6,
            height: 28,
            minWidth: 75,
            textColor: Color(0xFF4B55BD),
            disabledTextColor: Color(0x884B55BD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            splashColor: Colors.white,
            color: Colors.white,
            disabledColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildNegative() {
    bool isf = true;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('介意',
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text('支持数：',
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF))),
              Text('70%',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.end,
            width: 105,
            lineHeight: 3,
            percent: 0.7,
            isRTL: true,
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Colors.white54,
            progressColor: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            child: Text('已投票', maxLines: 1, style: TextStyle(fontSize: 12)),
            onPressed: null,
            elevation: 6,
            height: 28,
            minWidth: 75,
            textColor: Color(0xFFED372D),
            disabledTextColor: Color(0x88FED372D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            splashColor: Colors.white,
            color: Colors.white,
            disabledColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
