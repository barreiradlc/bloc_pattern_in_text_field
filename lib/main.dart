import 'package:bloc_pattern_in_text_field/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyTextFieldApp());
}

class MyTextFieldApp extends StatelessWidget {
  TextBloc _textBloc = TextBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: StreamBuilder(
                      stream: _textBloc.textStream,
                      builder: (ctxt, AsyncSnapshot<String> textStream) {
                        return TextField(
                          onChanged: (String text) => _textBloc.updateText(text),
                          decoration: InputDecoration(
                            errorText: textStream.hasError ? textStream.error.toString() : null,
                            fillColor: Colors.grey[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                      );
                    }
                  )
                ))));
  }
}
