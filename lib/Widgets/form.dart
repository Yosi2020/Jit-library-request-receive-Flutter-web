import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lib_system/Homepage/home.dart';
import 'package:lib_system/Widgets/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
//import 'captcha.dart';

class FormArea extends StatefulWidget{
  const FormArea({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormAreaState();
  }
}
class FormAreaState extends State<FormArea> {

  final controlFname = TextEditingController();
  final controlLname = TextEditingController();
  final controlEmail = TextEditingController();
  final controlMessage = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String verifyResult = "";

  final RequestCategory = ["Book Request", "Research Request"];
  String value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: formKey,
        child: Center(
            heightFactor: 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.screenSize.height * 0.01,
                left: ResponsiveWidget.isSmallScreen(context)
                    ? widget.screenSize.width / 12
                    : widget.screenSize.width / 5,
                right: ResponsiveWidget.isSmallScreen(context)
                    ? widget.screenSize.width / 12
                    : widget.screenSize.width / 5,
              ),
              child:
              Padding(
                padding: EdgeInsets.only(
                    top: this.widget.screenSize.height / 50,
                    bottom: this.widget.screenSize.height / 50
                ),
                child: Column(
                    children: [
                      widget.screenSize.width < 700 ? Column(
                        children: [
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Fist Name",
                                  controller: controlFname,
                                  autoHint: "First Name",
                                  size: widget.screenSize.width/1.5,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Last Name",
                                  controller: controlLname,
                                  autoHint: "Last Name",
                                  size: widget.screenSize.width/1.5,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Email",
                                  controller: controlEmail,
                                  autoHint: "Email",
                                  size: widget.screenSize.width/1.5,
                                  match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            ],
                          )
                        ],
                      ) : widget.screenSize.width < 900 ? Column(
                        children: [
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "First Name",
                                  controller: controlFname,
                                  autoHint: "First Name",
                                  size: 300,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Last Name",
                                  controller: controlLname,
                                  autoHint: "Last Name",
                                  size: 300,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Email",
                                  controller: controlEmail,
                                  autoHint: "Email",
                                  size: 300,
                                  match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            ],
                          )
                        ],
                      ) :
                      widget.screenSize.width < 1330 ?
                      Column(
                        children: [
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "First Name",
                                  controller: controlFname,
                                  autoHint: "First Name",
                                  size: 265,
                                  match: r'^[a-z A-z]+$'),
                              SizedBox(width: 10,),
                              buildTextField(
                                  title: "Last Name",
                                  controller: controlLname,
                                  autoHint: "Last Name",
                                  size: 265,
                                  match: r'^[a-z A-z]+$'),
                            ],),
                          SizedBox(height: 16,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildTextField(title: "Email",
                                    controller: controlEmail,
                                    autoHint: "Email",
                                    size: 300,
                                    match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              ])

                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 16,),
                          buildTextField(
                              title: "First Name",
                              controller: controlFname,
                              autoHint: "First Name",
                              maxLines: 1,
                              size: 265,
                              match: r'^[a-z A-z]+$'
                          ),
                          buildTextField(
                              title: "Last Name",
                              controller: controlLname,
                              autoHint: "Last Name",
                              maxLines: 1,
                              size: 265,
                              match: r'^[a-z A-z]+$'),
                          buildTextField(
                              title: "Email",
                              controller: controlEmail,
                              autoHint: "Email",
                              maxLines: 1,
                              size: 265,
                              match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                        ],
                      ),
                      Center(
                        child: DropdownButton<String>(
                          value: value,
                          items: RequestCategory.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                          hint: Text("Request Category"),),
                      ),
                      Padding(padding: EdgeInsets.all(4),),
                      widget.screenSize.width < 700 ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextFieldMessage(
                              controller: controlMessage,
                              autoHint: "Type your request here",
                              maxLines: 7,
                              size: widget.screenSize.width/1.5),
                        ],
                      ) : widget.screenSize.width < 800 ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextFieldMessage(
                              controller: controlMessage,
                              autoHint: "Type your request here",
                              maxLines: 7,
                              size: 300),
                        ],
                      ) : widget.screenSize.width < 900 ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextFieldMessage(
                              controller: controlMessage,
                              autoHint: "Type your request here",
                              maxLines: 7,
                              size: 400),
                        ],
                      ) : widget.screenSize.width < 950 ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextFieldMessage(
                              controller: controlMessage,
                              autoHint: "Type your request here",
                              maxLines: 7,
                              size: 500),
                        ],
                      ) : widget.screenSize.width < 1320 ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextFieldMessage(
                              controller: controlMessage,
                              autoHint: "Type your request here",
                              maxLines: 7,
                              size: 550),
                        ],
                      ) : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildTextFieldMessage(
                              controller: controlMessage,
                              autoHint: "Type your request here",
                              maxLines: 7,
                              size: 790,
                            ),
                          ]),

                      Padding(padding: EdgeInsets.all(4)),
                      //Recaptcha(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                final isValid = formKey.currentState.validate();

                                if (isValid) {
                                  submit();
                                }
                              },
                              child: Text("Submit")),
                        ],
                      )
                    ]),
              ),
            )
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String RequestCategory) =>
      DropdownMenuItem(
          value: RequestCategory,
          child: Text(
            RequestCategory,
            style: TextStyle(fontSize: 14),
          )
      );

  Widget buildTextField({
    @required title,
    @required TextEditingController controller,
    int maxLines,
    @required String autoHint,
    @required size,
    @required match
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size, child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
              ),
              validator: (value) {
                if (value.isEmpty || !RegExp(match).hasMatch(value))
                  return "Enter a correct " + title;
                else
                  return null;
              }
          ),
          )

        ],
      );

  Widget buildTextFieldMessage({
    @required TextEditingController controller,
    int maxLines,
    @required String autoHint,
    @required size,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size, child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: autoHint,
            ),
            validator: (boaz) {
              if (boaz.length < 5) {
                return "Enter at least 5 characters";
              }
              else {
                return null;
              }
            },
          ),)

        ],
      );
  List LibraryRequest = [];

  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("Requests");

  final CollectionReference collectionRefR =
  FirebaseFirestore.instance.collection("Research_Request");

  DateTime currentTime = DateTime.now();

  Future<void> submit() async {
    String FirstName = controlFname.text;
    String LastName = controlLname.text;
    String Email = controlEmail.text;
    String Message = controlMessage.text;

    await printDocID();
    return value == "Book Request" ? collectionRef.add(
      {"DateTime": DateFormat.yMd().add_jm().format(currentTime),
        'First Name': FirstName,
        "Last Name": LastName,
        "Email": Email,
        "Messgae": Message,
        "Request": "Book Request"},
    ).then((eyu) =>  _showAlertDialog("JIT Library Request",
        "Your request send Successfully. We will reach you soon"))
        .catchError((error) =>
        _showAlertDialog("JIT Library Request",
            "Problem on sending Your request, please try again."))
        : value == "Research Request" ? collectionRefR.add(
      { "DateTime": DateFormat.yMd().add_jm().format(currentTime),
        'First Name': FirstName,
        "Last Name": LastName,
        "Email": Email,
        "Messgae": Message,
        "Request": "Research Request"},
    ).then((eyu) => _showAlertDialog("JIT Library Request",
        "Your request send Successfully. We will reach you soon"))
        .catchError((error) =>
        _showAlertDialog("JIT Library Request",
            "Problem on sending your request, please try again."))
        : Container();
  }

  printDocID() async {
    var querySnapshots = await collectionRef.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      debugPrint(documentID);
    }
  }

  void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
      backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        actions: <Widget>[
          new FlatButton(
            child: Text('Exit'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => HomePage()));
            },
          ),
        ]
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog);
  }
}