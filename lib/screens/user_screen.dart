import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linnefromice/models/user.dart';

final usersProvider = StateNotifierProvider((_) => UsersState());

// ref: http://www.ffotaku.com/final-fantasy-ix/characters.php
class UsersState extends StateNotifier<List<User>> {
  UsersState(): super([
    User(id: 1, name: "Zidane Tribal", age: 16),
    User(id: 2, name: "Garnet Til Alexandros XVII", age: 9),
    User(id: 3, name: "Vivi Ornitier", age: 16),
    User(id: 4, name: "Adelbert Steiner", age: 33),
  ]);

  void add(final String name, final int age) {
    final newId = state.last.id + 1;
    state = [...state, User(
      id: newId,
      name: name,
      age: age
    )];
  }

  void delete(final int id) {
    state.removeWhere((element) => element.id == id);
  }
}

class UserScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(usersProvider.state);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: List.generate(state.length, (index) {
          final user = state[index].toJson();
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Text(user["id"].toString()),
                  title: Text(user["name"]),
                  subtitle: Text(user["age"].toString()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("MODIFY"),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text("DELETE"),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            )
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => _UserFormDialog()
          );
        },
      ),
    );
  }
}

class _UserFormDialog extends HookWidget {
  Widget _buildAddButton({final Function onPressed}) {
    return RaisedButton.icon(
      color: Colors.green[100],
      label: Text("Add"),
      icon: Icon(Icons.add, color: Colors.green),
      onPressed: onPressed
    );
  }

  Widget _buildCancelButton({final Function onPressed}) {
    return RaisedButton.icon(
      color: Colors.red[100],
      label: Text("Cancel"),
      icon: Icon(Icons.clear, color: Colors.red),
      onPressed: onPressed
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(usersProvider);
    final _nameController = useTextEditingController();
    final _ageController = useTextEditingController();

    return AlertDialog(
      title: Text("Add New User"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
                hintText: 'Name'
            ),
          ),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Age'
            ),
          ),
        ],
      ),
      actions: [
        _buildCancelButton(
          onPressed: () {
            Navigator.pop(context);
            _nameController.clear();
            _ageController.clear();
          }
        ),
        _buildAddButton(
          onPressed: () {
            Navigator.pop(context);
            provider.add(
              _nameController.text,
              int.parse(_ageController.text),
            );
            _nameController.clear();
            _ageController.clear();
          }
        )
      ],
    );
  }
}