import 'package:flutter/material.dart';
import '../questions/item_value.dart';
import '../questions/select_question.dart';

class RadioGroupWidget extends StatelessWidget {
  final SelectQuestion questionSelect;
  const RadioGroupWidget(this.questionSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: questionSelect.getChangesStreamController('value').stream,
        initialData: questionSelect.value,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            children: questionSelect.choices.map<Widget>((ItemValue itemValue) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                  // RadioListTile
                  child: Row(children: [
                    Radio(
                      groupValue: snapshot.data.toString(),
                      value: itemValue.value.toString(),
                      onChanged: (String? value) {
                        questionSelect.value = value;
                      },
                    ),
                    Text(itemValue.text ?? '')
                  ]));
            }).toList(),
          );
        });
  }
}
