
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../blocs/image/image_path.dart';
import '../../../blocs/remote_bloc/bloc_navi.dart';
import '../../style_app/color_app.dart';
import '../../style_app/style_text.dart';

class NavBottom extends StatefulWidget {
  Function()? centerOnTap;

  NavBottom({this.centerOnTap});

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  @override
  Widget build(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Stack(
      children: [
        Container(
          height: 60,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorApp.grey66.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemNav(
                imagePath: "assets/images/home.png",
                title: "Trang chủ",
                index: 0,
              ),
              ItemNav(
                imagePath: "assets/images/shop.png",
                title: "Cửa hàng",
                index: 1,
              ),
              const Expanded(child: SizedBox()),
              ItemNav(
                imagePath: "assets/images/notification.png",
                title: "Thông báo",
                index: 2,
              ),
              ItemNav(
                imagePath: "assets/images/persion.png",
                title: "Tài khoản",
                index: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ItemNav({
    required String title,
    required String imagePath,
    int index = 0,
  }) {
    return Expanded(
      child: BlocBuilder<BlocNavHome, int>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              context.read<BlocNavHome>().changeTab(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    height: 20,
                    width: 18,
                    color: state == index ? ColorApp.main : ColorApp.grey82,
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: state == index
                        ? StyleApp.textStyle700(
                      fontSize: 10,
                      color: ColorApp.main,
                    )
                        : StyleApp.textStyle400(
                      fontSize: 10,
                      color: ColorApp.grey82,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}