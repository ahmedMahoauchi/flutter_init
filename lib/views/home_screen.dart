import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machines_talk_init/views/post_list_item.dart';
import 'package:provider/provider.dart';

import '../viewmodels/dtails_viewmodel.dart';
import '../viewmodels/home_viewmodel.dart';
import 'myAppBar.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchData();
  }

  Future<void> _refresh() async {
    await Provider.of<HomeViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home Screen (${Provider.of<HomeViewModel>(context).itemList.length} items)",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: Consumer<HomeViewModel>(
                  builder: (context, homeViewModel, child) {
                    if (homeViewModel.itemList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: homeViewModel.itemList.length,
                        itemBuilder: (context, index) {
                          final item = homeViewModel.itemList[index];
                          return ListItemWidget(item);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
