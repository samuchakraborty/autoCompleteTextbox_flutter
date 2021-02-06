import 'package:auto_complete_text/players.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AutoComplete(),
      ),
    );
  }
}

class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  // String itemName;
  GlobalKey<AutoCompleteTextFieldState<SearchApi>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController myController = new TextEditingController();

  _AutoCompleteState();

  // void _loadData() async {
  //   print("its trigered");
  //   await PlayersViewModel.loadPlayers("cof");
  //
  //   //  print(searchTextField.textField.controller.text.toString());
  // }

  @override
  void initState() {
  //  _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Auto Complete tag'),
      ),
      body: new Center(
        child: new Column(children: <Widget>[
          new Column(
            children: <Widget>[
              searchTextField = AutoCompleteTextField<SearchApi>(

              //  controller: myController,
                style: new TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: new InputDecoration(
                  suffixIcon: Container(
                    width: 85.0,
                    height: 60.0,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                  filled: true,
                  hintText: 'Search Player Name',
                  hintStyle: TextStyle(color: Colors.black),

                ),


              textChanged: (value)=> PlayersViewModel.loadPlayers(value),
                itemSubmitted: (item) {
                  setState(() =>
                      searchTextField.textField.controller.text = item.name);
                },

                clearOnSubmit: false,
                key: key,
                suggestions: PlayersViewModel.search,
                itemBuilder: (context, item) {

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      // Text(
                      //   item.id.toString(),
                      // )
                    ],
                  );
                },
                itemSorter: (a, b) {
                  return a.name.compareTo(b.name);
                },
                itemFilter: (item, query) {
                  return item.name
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
