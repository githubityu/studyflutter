import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';

void showMsg(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}


String getSex(String sex) {
  String gender = "男";
  if ("1" == sex) {
    gender = "男";
  } else if ("2" == sex) {
    gender = "女";
  }
  return gender;
}

String getUrlById(String id){
  return "${Constants.newsUrl}$id";
}

Widget buildForEdit(BuildContext context,Widget child){
   return GestureDetector(
     behavior: HitTestBehavior.opaque,
     onTap: () {
       FocusScope.of(context).unfocus();
     },
     child: ContainerWithLoading(
       child: Container(
         constraints: const BoxConstraints.expand(),
         child: SingleChildScrollView(
           child: Container(
             padding: const EdgeInsets.all(8.0),
             child: child,
           ),
         ),
       ),
     ),
   );
}




