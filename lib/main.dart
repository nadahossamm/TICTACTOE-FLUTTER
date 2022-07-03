import 'package:flutter/material.dart';

void main() {
//  runApp(MyApp());

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String player = 'X', last = ''/*player1='player12',player2='player1'*/ ;
  List<String> list = ['*', '*', '*', '*', '*', '*', '*', '*', '*'];
  List<bool> list2 = [false, false, false, false, false, false, false, false,false];
  int x=0,o=0;
  game(int index) {
    setState(() {
      // last=player;
      if (list2[index] == false ) {
        if (last == 'X') {
          last = 'O';
          list2[index] == true;

          list[index] = 'O';
        } else {
          last = "X";
          list[index] = "X";
          list2[index] == true;

        }
        winner();

      }
    });
  }

  void winner() {
    setState(() {
      if (list[0] != '*') {
        if (list[0] == list[1] && list[1] == list[2]) {

          return showwinner(true);
        }
      }
      if (list[3] != '*') {
        if (list[3] == list[4] && list[3] == list[5]) {
          showwinner(true);
        }
      }
      if (list[7] != '*') {
        if (list[7] == list[6] && list[6] == list[8]) {
          showwinner(true);
        }
      }
      if (list[0] != '*') {
        if (list[0] == list[4] && list[4] == list[8]) {
          showwinner(true);
        }
      }
      if (list[2] != '*') {
        if (list[2] == list[4] && list[4] == list[6]) {
          showwinner(true);
        }
      }
      if (list[0] != '*') {
        if (list[0] == list[3] && list[3] == list[6]) {
          showwinner(true);
        }
      }
      if (list[2] != '*') {
        if (list[2] == list[5] && list[5] == list[8]) {
          showwinner(true);
        }
      }
      if (list[1] != '*') {
        if (list[1] == list[4] && list[4] == list[7]) {
          showwinner(true);
        }
      }
      if(list[0]!='*' &&list[1]!='*'&&list[2]!='*'&&list[3]!='*'&&list[4]!='*'&&list[5]!='*'&&list[6]!='*'&&list[7]!='*'&&list[8]!='*')
          {
            showwinner(false);
      }
    });
  }

  void showwinner(bool win) {
    list2 = [true, true, true, true, true, true, true, true,true];
    if(win==true)
      {
        if(last=="X")
          x++;
        else
          o++;
      }
    else
      {
        last='NO ONE';
      }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text( last + " WIN",style: TextStyle(color: Colors.blue),)),

              actions: [
                RaisedButton(onPressed:() {
                  setState(() {
                    player = 'X';
                    last = '';
                    list = ['*', '*', '*', '*', '*', '*', '*', '*', '*'];
                  list2 = [false, false, false, false, false, false, false, false,false];

                    Navigator.of(context).pop();

                  });


                },child: Text("Play again!"),color: Colors.blue,)
              ],

            //   content: Text("Dialog Content"),
          );
        });

  }
  playagain(bool q)
  {
        setState(() {
          player = 'X';
          last = '';
          list = ['*', '*', '*', '*', '*', '*', '*', '*', '*'];
         if(q==true)
           {
             x=0;
             o=0;
           }
          list2 = [false, false, false, false, false, false, false, false,false];

        });

  }
  Future <String>  playersname(BuildContext context) {
    TextEditingController player1=new TextEditingController();
    TextEditingController player2=new TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Enter players name ",style: TextStyle(color: Colors.blue),)

            ),
              content: TextField(
            controller: player1,
          ),
            actions: [
              MaterialButton(onPressed: (){
                Navigator.of(context).pop(player1.text.toString());
              },
                  child: Text("Save"))
            ],//   content: Text("Dialog Content"),
          );
        });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('TIC_TAC_TOE'),
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container
                  (
                  margin: EdgeInsets.only(top: 20),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Player X',style: TextStyle(fontSize: 30,color: Colors.blue),),
                      Text('Player O',style: TextStyle(fontSize: 30,color: Colors.blue),),
                      // RaisedButton(onPressed:()=>playersname(context).then((value) => Text(value)))

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(x.toString(),style: TextStyle(fontSize: 30,color: Colors.blue),),
                      Text(o.toString(),style: TextStyle(fontSize: 30,color: Colors.blue),),

                    ],

                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(9, (index) {
                        return Container(
                          padding: EdgeInsets.only(left: 35, top: 30),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 8,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 70,
                          height: 70,
                          child: GestureDetector(
                            onTap: () {
                              game(index);
                            },
                            child: Text(
                              list[index],
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Container(
                 padding: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          playagain(true);
                        },
                        child: Container(
                          // margin: EdgeInsets.only(bottom: 50),
                            child: Text(
                              "Reset",
                              style: TextStyle(color: Colors.white),
                            )),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          playagain(false);
                        },
                        child: Container(
                          // margin: EdgeInsets.only(bottom: 50),
                            child: Text(
                              "Play Again!",
                              style: TextStyle(color: Colors.white),
                            )),
                        color: Colors.blue,
                      )
                    ],
                  ),
                )

              ],
            )));
  }
}
