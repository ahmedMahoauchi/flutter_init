import 'package:flutter/material.dart';
import 'package:machines_talk_init/views/myAppBar.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dtails_viewmodel.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "123"),
      body: Center(
        child: Consumer<DetailsViewModel>(
          builder: (context, viewModel, child) {
            return Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Item Title: ${viewModel.selectedItem?.title}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Item Description: ${viewModel.selectedItem?.body}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  FutureBuilder<int?>(
                    future: viewModel.getSavedPostId(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Text(
                            'Saved PostId from SharedPreferences: ${snapshot.data}',
                            style: const TextStyle(fontSize: 16),
                          );
                        } else {
                          return const Text(
                            'No Saved PostId in SharedPreferences',
                            style: TextStyle(fontSize: 16),
                          );
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),

                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/textField');
        },
        child: Icon(Icons.accessibility_new_outlined),
      ),
      // Adjust the location as needed

    );
  }
}
