import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contcatImage extends StatefulWidget {
  const contcatImage({Key key}) : super(key: key);

  @override
  _contcatImageState createState() => _contcatImageState();
}

class _contcatImageState extends State<contcatImage> {

  _sendingMails(url) async {
    String url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width<800? Container(
      child: Column(
        children: [
          SizedBox(height: 12,),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrangeAccent,),
              radius: 150,
            ),
          ),
          SizedBox(height: 13,),
          Center(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Binyam ",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("JIT library director",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("+251-932-211-877",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    _sendingMails("mailto:bini@gmail.com");
                  },
                  child: Text("Add Email",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            ],
          ),),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrangeAccent,),
              radius: 150,
            ),
          ),
          SizedBox(height: 13,),
          Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mr. X ",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("JIT library Vice director",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("Add Vice Director phone number",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    _sendingMails("mailto:bini@gmail.com");
                  },
                  child: Text("Add Email for vice ",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            ],
          ),),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrangeAccent,),
              radius: 150,
            ),
          ),
          SizedBox(height: 13,),
          Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mrs/Miss X.",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("JIT library Call Center",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("Official call center",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    _sendingMails("mailto:bini@gmail.com");
                  },
                  child: Text("Add Email",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            ],
          ))

        ],
      ),
    ) : MediaQuery.of(context).size.width<950 ? Container(
        child:
        Column(
            children:[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 12,),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 250,
                          color: Colors.deepOrangeAccent,),
                        radius: 150,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 250,
                          color: Colors.deepOrangeAccent,),
                        radius: 150,
                      ),
                    ),]),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 13,),
                  Center(child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Binyam ",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                      SizedBox(height: 12,),
                      Text("JIT library director",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                      SizedBox(height: 12,),
                      Text("+251-932-211-877",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                      SizedBox(height: 12,),
                      TextButton(
                          onPressed: (){
                            _sendingMails("mailto:bini@gmail.com");
                          },
                          child: Text("Add Email",
                              style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
                    ],
                  ),),
                  Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mr. X ",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                      SizedBox(height: 12,),
                      Text("JIT library Vice director",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                      SizedBox(height: 12,),
                      Text("Add Vice Director phone number",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                      SizedBox(height: 12,),
                      TextButton(
                          onPressed: (){
                            _sendingMails("mailto:bini@gmail.com");
                          },
                          child: Text("Add Email for vice ",
                              style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
                    ],
                  ),),
                ],
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 250,
                    color: Colors.deepOrangeAccent,),
                  radius: 150,
                ),
              ),
              Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mrs/Miss X.",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                  SizedBox(height: 12,),
                  Text("JIT library Call Center",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                  SizedBox(height: 12,),
                  Text("Official call center",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                  SizedBox(height: 12,),
                  TextButton(
                      onPressed: (){
                        _sendingMails("mailto:bini@gmail.com");
                      },
                      child: Text("Add Email",
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
                ],
              ))
            ]),
    )
    : Container(
      child:
      Column(
      children:[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 12,),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrangeAccent,),
              radius: 150,
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrangeAccent,),
              radius: 150,
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrangeAccent,),
              radius: 150,
            ),
          ),]),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          SizedBox(height: 13,),
          Center(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Binyam ",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("JIT library director",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("+251-932-211-877",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    _sendingMails("mailto:bini@gmail.com");
                  },
                  child: Text("Add Email",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            ],
          ),),
          Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mr. X ",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("JIT library Vice director",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("Add Vice Director phone number",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    _sendingMails("mailto:bini@gmail.com");
                  },
                  child: Text("Add Email for vice ",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            ],
          ),),
          Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mrs/Miss X.",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("JIT library Call Center",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              Text("Official call center",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    _sendingMails("mailto:bini@gmail.com");
                  },
                  child: Text("Add Email",
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            ],
          ))

        ],
      ),
    ]));
  }
}
