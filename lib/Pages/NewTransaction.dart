import 'package:flutter/material.dart';
//page to add new transaction

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Transaction Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddTransaction(),
        ],
      ),
    );
  }
}

class AddTransaction extends StatefulWidget {

  @override
  _AddTransactionState createState() => _AddTransactionState();

}

class _AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  String dropdownValue = 'Food';
  TextEditingController dateCtl = TextEditingController();

  @override

  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Title"),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Text("Amount"),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dateCtl,
              decoration: InputDecoration(
                labelText: "Insert Date",
                hintText: "Ex. Insert your dob",),
              onTap: () async{
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                    context: context,
                    initialDate:DateTime.now(),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(2100));

                dateCtl.text = date.toIso8601String().substring(0,10);}),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>["Food", "Transportation", "Entertainment", "Others"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                    print("Rerouting to home");
                    Navigator.pushReplacementNamed(context, '/', arguments: {
                        'title': titleController.text,
                        'amount': amountController.text,
                        'date': dateCtl.text,
                        'category': dropdownValue
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

