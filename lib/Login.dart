import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/controller/LoginController.dart';


void main() => runApp(GetMaterialApp(home: Login()));

late LoginController controller = Get.put(LoginController());

//登陆界面
class Login extends StatelessWidget {
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),  //距离顶部距离
            buildTopWidget(), //设置登陆欢迎
            const SizedBox(height: 20), //距离上一个View距离
            buildAccountInputWidget(userNameController), //用户名
            const SizedBox(height: 20),//距离上一个View距离
            buildPasswordInputWidget(passWordController), //密码
            const SizedBox(height: 10,),//距离上一个View距离
            buildPrivacyWidget(), //隐私政策
            const SizedBox(height: 10,),//距离上一个View距离
            buildLoginButton(), //登陆按钮
          ],
        ),
      ),
    );
  }

//Widget-Top
  Widget buildTopWidget() {
    return const Text(
      "你好，欢迎登陆",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
    );
  }

//手机号
  Widget buildAccountInputWidget(TextEditingController? userNameController) {
    return TextField(
      controller: userNameController,
      decoration: InputDecoration(labelText: "用户名"),
      style: TextStyle(fontSize: 16),
      keyboardType: TextInputType.phone,
    );
  }

//密码
  Widget buildPasswordInputWidget(TextEditingController? passWordController) {
    return TextField(
      controller: passWordController,
      obscureText: true,
      decoration: InputDecoration(labelText: "用户密码"),
      style: TextStyle(fontSize: 16),
    );
  }
//登陆按钮
  Widget buildLoginButton() {
    return SizedBox(
      child: RaisedButton(
        child: new Text("登录"),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: ()=>controller.login(userNameController, passWordController),
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        disabledElevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //圆角大小
      ),
      width: double.infinity,
    );
  }
  //隐私协议
  Widget buildPrivacyWidget() {
    return Row(
      children: [
        Obx(()=>Checkbox(value: controller.isChecked.value, onChanged: (value) =>controller.changeChecked(value!))),
        Text('同意', style: TextStyle(fontSize: 14)),
        Text('<服务协议>', style: TextStyle(fontSize: 14, color: Colors.blue)),
        Text('<隐私政策>', style: TextStyle(fontSize: 14, color: Colors.blue))
      ],
    );
  }
}


