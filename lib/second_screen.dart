import 'package:flutter/material.dart';

import 'datastore.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataScreen")),

      body: FutureBuilder<Map<String, String?>>(
        future: SharedPrefsHelper.getFormData(),

        builder: (context, snapshot) {
          final data = snapshot.data!;
          return Center(
            child: Text(
              'Name: ${data['name'] ?? ''}\n\nMobile: ${data['mobile'] ?? ''}\n\nPassword:${data['password'] ?? ''}',
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
