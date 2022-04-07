import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lib_system/Homepage/plagiarism.dart';
import 'package:lib_system/Widgets/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class PlagiarismFormArea extends StatefulWidget{
  const PlagiarismFormArea({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlagiarismFormAreaState();
  }
}
class PlagiarismFormAreaState extends State<PlagiarismFormArea>{

  final controlFname = TextEditingController();
  final controlLname = TextEditingController();
  final controlEmail = TextEditingController();
  final controlUniversity = TextEditingController();
  final controlDepartment = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool verifyResult = false;
  bool fileSelect = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Form(
        key: formKey,
        child : Center(
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
                    top: this.widget.screenSize.height/50,
                    bottom: this.widget.screenSize.height/50
                ),
                child :Column(
                    children :[
                      widget.screenSize.width<700? Column(
                        children: [
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Fist Name",
                                  controller: controlFname,
                                  autoHint: "First Name", size: widget.screenSize.width/1.5,
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
                                  autoHint: "Last Name", size: widget.screenSize.width/1.5,
                                  match:  r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Email",
                                  controller: controlEmail,
                                  autoHint: "Email", size: widget.screenSize.width/1.5,
                                  match:r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "University/Collage",
                                  controller: controlUniversity,
                                  autoHint: "University/Collage", size: widget.screenSize.width/1.5,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Department",
                                  controller: controlDepartment,
                                  autoHint: "Department", size: widget.screenSize.width/1.5,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                        ],
                      ):widget.screenSize.width<900? Column(
                        children: [
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "First Name",
                                  controller: controlFname,
                                  autoHint: "First Name", size: widget.screenSize.width/2,
                                  match:  r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Last Name",
                                  controller: controlLname,
                                  autoHint: "Last Name", size: widget.screenSize.width/2,
                                  match:  r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Email",
                                  controller: controlEmail,
                                  autoHint: "Email", size: widget.screenSize.width/2,
                                  match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "University/Collage",
                                  controller: controlUniversity,
                                  autoHint: "University/Collage",
                                  size: widget.screenSize.width/2,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextField(
                                  title: "Department",
                                  controller: controlDepartment,
                                  autoHint: "Department", size: widget.screenSize.width/2,
                                  match: r'^[a-z A-z]+$')
                            ],
                          ),
                        ],
                      ):
                      widget.screenSize.width<1330?
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
                                  match:  r'^[a-z A-z]+$'),
                              SizedBox(width: 10,),
                              buildTextField(
                                  title: "Last Name",
                                  controller: controlLname,
                                  autoHint: "Last Name",
                                  size: 265,
                                  match:  r'^[a-z A-z]+$'),
                            ],),
                          SizedBox(height: 16,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildTextField(title: "Email",
                                    controller: controlEmail,
                                    autoHint: "Email",
                                    size: 265,
                                    match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}'),
                                SizedBox(width: 10,),
                                buildTextField(title: "University/Collage",
                                    controller: controlUniversity,
                                    autoHint: "University/Collage", size: 265, match: r'^[a-z A-z]+$')
                              ]),
                          SizedBox(height: 16,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildTextField(title: "Department",
                                    controller: controlDepartment,
                                    autoHint: "Department", size: 265, match: r'^[a-z A-z]+$')
                              ])

                        ],
                      )
                          : Column(
    children: [Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children :[
                          SizedBox(height: 16,),
                          buildTextField(
                              title: "First Name",
                              controller: controlFname,
                              autoHint: "First Name",
                              maxLines : 1,
                              size: 265,
                              match: r'^[a-z A-z]+$'
                          ),
                          buildTextField(
                              title: "Last Name",
                              controller: controlLname,
                              autoHint: "Last Name",
                              maxLines:1,
                              size: 265,
                              match: r'^[a-z A-z]+$'),
                          buildTextField(
                              title: "Email",
                              controller: controlEmail,
                              autoHint: "Email",
                              maxLines:1,
                              size: 265,
                              match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                        ],
                      ),
      SizedBox(height: 16,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        buildTextField(
            title: "University/Collage",
            controller: controlUniversity,
            autoHint: "University/Collage",
            maxLines : 1,
            size: 265,
            match: r'^[a-z A-z]+$'
        ),
        buildTextField(
            title: "Department Name",
            controller: controlDepartment,
            autoHint: "Department Name",
            maxLines:1,
            size: 265,
            match: r'^[a-z A-z]+$'),
      ],),
      ]),
                      SizedBox(height: 16,),
                      Center(
                        child: OutlinedButton(
                          child: Text("Upload Pdf File only"),
                          onPressed: (){
                            fileSelect = true;
                            UploadFileSelect();
                          },
                        ),
                      ),
                      fileSelect ? Container(
                          child:Center(
                            child: Text("$fileName",)
                          )) : Container(),
                      Padding(padding: EdgeInsets.all(4)),
                      //Recaptcha(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                final isValid = formKey.currentState.validate();

                                if(isValid){
                                  submit();
                                  verifyResult = true;
                                }
                              },
                              child: Text("Submit")),
                        ],
                      ),
                      SizedBox(height: 16,),
                      verifyResult ? Container(
                      height: 200.0,
                      width: 200.0,
                      child: LiquidCircularProgressIndicator(
                            value: progress/100,
                            valueColor: AlwaysStoppedAnimation(
                            Colors.pinkAccent,),
                            backgroundColor: Colors.white,
                            direction: Axis.vertical,
                            center: Text("$progress%",
                            style: TextStyle(
                            color: Color(0xFF077bd7),
                            fontSize: 26,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                            letterSpacing: 3,
                            ),),
                            ),
                            ):Container()
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
            width: size,child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
              ),
              validator : (value){
                if(value.isEmpty || !RegExp(match).hasMatch(value))
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
            width: size,child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: autoHint,
            ),
            validator: (boaz){
              if(boaz.length < 5){
                return "Enter at least 5 characters";
              }
              else{
                return null;
              }
            },
          ),)

        ],
      );
  List LibraryRequest = [];

  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("Plagiarism_check");

  DateTime currentTime = DateTime.now();
  Uint8List file;
  String fileName;
  double progress = 0.0;

  Future<void> UploadFileSelect() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
      allowMultiple: false
    );
    if(result != null){
      file = result.files.first.bytes;
      fileName = result.files.first.name;
    }
    else return "Please select your pdf file correctly";
  }

  Future<void> submit() async {
    String FirstName = controlFname.text;
    String LastName = controlLname.text;
    String Email = controlEmail.text;
    String University = controlUniversity.text;
    String Department = controlDepartment.text;


    String name = Email;
    // uploading file to firebase
    var pdfFile = FirebaseStorage.instance
        .ref()
        .child("files/$fileName");
    UploadTask task = pdfFile.putData(file);
    task.snapshotEvents.listen((event) {
      setState(() {
        progress = ((event.bytesTransferred.toDouble()/
        event.totalBytes.toDouble())*100).roundToDouble();
        print(progress);
      });
    });
    TaskSnapshot snapshot = await task;
    var url = await snapshot.ref.getDownloadURL();
    // upload url to cloud firebase
    await FirebaseFirestore.instance.collection("Plagiarism_check").doc().set({
      "DateTime": DateFormat.yMd().add_jm().format(currentTime),
      'First Name': FirstName,
      "Last Name": LastName,
      "Email": Email,
      "University": University,
      "Department": Department,
      "FileName": fileName,
      "fileUrl": url
    }).then((eyu) =>
        _showAlertDialog("JIT Library Request",
            "Your request send Successfully. We will reach you soon"))
        .catchError((error) =>
        _showAlertDialog("JIT Library Request",
            "Problem on sending your request, please try again."));
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
                (builder: (context) => Plagiarism()));
            },
          ),
        ]
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog);
  }
}
