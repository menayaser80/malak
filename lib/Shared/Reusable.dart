import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Widget/Textwidget.dart';
Future<void> errorDialog({
  required String subtitle,
  required BuildContext context,
}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/sign.png',
                height: 20.0,
                width: 20.0,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(' An Error occured'),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Textwidget(
                color: Colors.cyan,
                text: 'Ok',
                textsize: 18,
              ),
            ),
          ],
        );
      });
}
Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)? onchange,
  required String? Function(String? val)? validator,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefix,
          ),
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
        keyboardType: type,
        onChanged: onchange);

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  bool isUppercase = true,
  double raduis = 10,
  @required Function()? function,
  @required String? text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        height: 45.0,
        color: background,
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );

PreferredSizeWidget defaultAppbar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      titleSpacing: 5.0,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: actions,
    );
Widget listtile({
  required String title,
  required IconData icon,
  String? subtitle,
  required Function onpressed,
  required Color color,

})
{
  return ListTile(
    title: Textwidget(
      color: color,
      text:title,
      textsize:22.0,
      // istitle: true,
    ),
    subtitle: Textwidget(
      color: color,
      text:subtitle==null?"":subtitle,
      textsize:18.0,
    ),
    leading: Icon(icon),
    trailing: Icon(Icons.arrow_right_alt),
    onTap: (){
      onpressed();
    },
  );

}
Future<void>warningDialog({
  required String title,
  required String subtitle,
  required VoidCallback fct,
  required BuildContext context,
})async {
  await showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Row(
        children: [
          Image.asset('assets/images/signo.png',height: 20.0,width: 20.0,fit: BoxFit.fill,),
          SizedBox(width: 8.0,),
          Text(title),
        ],
      ),
      content: Text(subtitle),
      actions: [
        TextButton(onPressed: (){
          if(Navigator.canPop(context))
          {
            Navigator.pop(context);
          }
        }, child:Textwidget(
          color: Colors.cyan,
          text: 'Cancel',
          textsize: 18,
        ),),
        TextButton(
          onPressed: fct
          ,child:Textwidget(
          color: Colors.red,
          text: 'ok',
          textsize: 18,
        ),

        ),
      ],
    );
  });
}
Widget defaulttextbutton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

void showToast({
  required String text ,
  required ToastColor state ,
}) =>  Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: ChangeToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);
enum ToastColor {SUCCESS,ERROR,WARNING}
Color ChangeToastColor(ToastColor state)
{
  Color color;
  switch(state){
    case ToastColor.SUCCESS:
      color = Colors.green;
      break;
    case ToastColor.ERROR:
      color = Colors.red;
      break;
    case ToastColor.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
void navigateTo(context,Widget)=>Navigator.push(context, MaterialPageRoute(
  builder:(context)=>Widget,
));

void navigateandFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
  builder: (context)=>Widget,
),
      (route)
  {
    return false;
  },
);