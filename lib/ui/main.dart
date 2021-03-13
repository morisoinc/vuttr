import 'package:flutter/material.dart';
import 'package:vuttr/ui/widgets/v_container.dart';
import 'package:vuttr/ui/widgets/v_text_field.dart';

import 'global/theme.dart' as vTheme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VUTTR',
      theme: vTheme.buildTheme(vTheme.VTheme.lightBlue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 8,
                      child: VTextField()),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 8,
                      child: VTextField(errorText: 'Please enter some text',)),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
              TextButton(onPressed: () {}, child: Text('This is a button')),
              ElevatedButton(onPressed: () {}, child: Text('This is a button')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
