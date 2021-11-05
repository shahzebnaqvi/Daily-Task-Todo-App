import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  List lst = [];
  List lstdate = [];
  List lstloc = [];
  var gettext = "";
  var gettextdate = "";
  var location = "";
  var gettext1 = "";
  var gettextdate1 = "";
  var location1 = "";
  var colorprim = Colors.blue;
  var colorsec = Colors.blue[50];
  var colorsec1 = Colors.blue[200];
  submit() {
    setState(() {
      if (gettext != "") {
        lst.add(gettext);
        lstdate.add(gettextdate);
        print(gettextdate);
      }
    });
  }

  // update() {
  //   setState((index) {
  //     var ind = lst.indexOf(gettext);
  //     lst.replaceRange(ind, ind + 1, [gettext]);

  //     print(lst);
  //     // str1.replaceAll(gettext, "ddsd");
  //     // String str1 = "Hello World";
  //     // str1.replaceAll('World', 'ALL');
  //     // print(lst);
  //   });
  // }

  erase() {
    gettext = "";
    gettextdate = "";
  }

  erase1() {
    gettext1 = "";
    gettextdate1 = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsec,
      appBar: AppBar(
        backgroundColor: colorprim,
        title: Center(child: Text("Todo App")),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      colorprim = Colors.red;
                      colorsec = Colors.red[50];
                      colorsec1 = Colors.red[200];
                    });
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.04,
                    backgroundColor: Colors.red,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorprim = Colors.yellow;
                      colorsec = Colors.yellow[50];
                      colorsec1 = Colors.yellow[200];
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorprim = Colors.green;
                      colorsec = Colors.green[50];
                      colorsec1 = Colors.green[200];
                    });
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.04,
                    backgroundColor: Colors.green,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorprim = Colors.blue;
                      colorsec = Colors.blue[50];
                      colorsec1 = Colors.blue[200];
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorprim = Colors.brown;
                      colorsec = Colors.brown[100];
                      colorsec1 = Colors.brown[300];
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.brown,
                    radius: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
          topbanner(context, colorprim, colorsec1),
          Container(
            // margin: EdgeInsets.all(20),
            child: Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  final item = lst[index];
                  return Dismissible(
                    background: stackBehindDismiss(),
                    secondaryBackground: secondarystackBehindDismiss(),
                    // Each Dismissible must contain a Key. Keys allow Flutter to
                    // uniquely identify widgets.
                    key: UniqueKey(),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    onDismissed: (direction) {
                      // Remove the item from the data source.

                      if (direction == DismissDirection.startToEnd) {
                        setState(() {
                          lst.removeAt(index);
                          lstdate.removeAt(index);
                        });

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$lst dismissed')));
                      } else if (direction == DismissDirection.endToStart) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: colorsec,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Update Task",
                                    style: TextStyle(color: colorprim),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: colorprim,
                                    ),
                                  )
                                ],
                              ),
                              actions: [
                                Column(
                                  children: [
                                    Container(
                                      margin: contmar(context),
                                      padding: EdgeInsets.only(left: 12),
                                      decoration: contdecoration(),
                                      child: TextField(
                                        onChanged: (value) {
                                          gettext1 = value;
                                        },
                                        controller: txt1,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Updated Task'),
                                      ),
                                    ),
                                    Container(
                                      margin: contmar(context),
                                      padding: EdgeInsets.only(left: 12),
                                      decoration: contdecoration(),
                                      child: TextField(
                                        onChanged: (value) {
                                          gettextdate1 = value;
                                        },
                                        controller: txt3,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Updated Date'),
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            if (gettext1 != "") {
                                              lst.replaceRange(
                                                  index, index + 1, [gettext1]);
                                              lstdate.replaceRange(index,
                                                  index + 1, [gettextdate1]);
                                              print(lst);
                                            }
                                          });
                                          txt1.clear();
                                          txt3.clear();
                                          erase1();
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: colorprim,
                                        ),
                                        icon: Icon(Icons.check),
                                        label: Text("Update It")),
                                  ],
                                )
                              ],
                            );
                          },
                        );

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$lst dismissed')));
                      }
                    },
                    // Show a red background as the item is swiped away.

                    child: task(context, lst[index], '${index + 1}',
                        lstdate[index], colorprim),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: colorprim,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: colorsec,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add Task",
                                  style: TextStyle(color: colorprim),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: colorprim,
                                  ),
                                )
                              ],
                            ),
                            actions: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: contmar(context),
                                    padding: EdgeInsets.only(left: 12),
                                    decoration: contdecoration(),
                                    child: TextField(
                                      onChanged: (value) {
                                        gettext = value;
                                      },
                                      controller: txt,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Task'),
                                    ),
                                  ),
                                  Container(
                                    margin: contmar(context),
                                    padding: EdgeInsets.only(left: 12),
                                    decoration: contdecoration(),
                                    child: TextField(
                                      onChanged: (value) {
                                        gettextdate = value;
                                      },
                                      controller: txt2,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter date'),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        submit();
                                        txt.clear();
                                        txt2.clear();
                                        erase();
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: colorprim,
                                      ),
                                      icon: Icon(Icons.check),
                                      label: Text("Add It"))
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("ADD")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget task(BuildContext context, String text1, text2, time, colorprim) {
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.010,
        bottom: MediaQuery.of(context).size.height * 0.010,
        left: MediaQuery.of(context).size.width * 0.040,
        right: MediaQuery.of(context).size.width * 0.040,
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.020,
        left: MediaQuery.of(context).size.width * 0.005,
        bottom: MediaQuery.of(context).size.height * 0.020,
        right: MediaQuery.of(context).size.width * 0.0050,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorprim,
          radius: 30,
        ),
        title: Text(
          text1,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text2,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: colorprim),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ));
}

Widget secondarystackBehindDismiss() {
  return Container(
    color: Colors.green,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: Colors.white),
          Text('Edit', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}

Widget stackBehindDismiss() {
  return Container(
    color: Colors.red,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: Colors.white),
          Text('Move to trash', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}

contdecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 0, color: Colors.white),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

contmar(context) {
  return EdgeInsets.only(
    top: MediaQuery.of(context).size.height * 0.010,
    bottom: MediaQuery.of(context).size.height * 0.010,
    left: MediaQuery.of(context).size.width * 0.020,
    right: MediaQuery.of(context).size.width * 0.020,
  );
}

Widget topbanner(context, colorprim, colorsec1) {
  return Stack(children: [
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      color: colorprim,
    ),
    Positioned(
      top: MediaQuery.of(context).size.width * 0.1,
      right: MediaQuery.of(context).size.width * -0.70,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: colorsec1,
      ),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width * -0.15,
      left: MediaQuery.of(context).size.width * -0.10,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.14,
        backgroundColor: colorsec1,
      ),
    ),
    Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        child: Text(
          "Hello!",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        )),
    Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.height * 0.1),
        child: Text(
          "SHAHZEB",
          style: TextStyle(
              fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold),
        )),
    // Positioned(
    //   top: -20,
    //   child: Container(
    //     width: MediaQuery.of(context).size.width * 0.10,
    //     height: MediaQuery.of(context).size.height * 0.10,
    //     color: colorsec,
    //   ),
    // ),
  ]);
}
