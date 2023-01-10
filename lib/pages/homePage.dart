import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nitnotes/controllers/homeControllers.dart';
import 'package:nitnotes/models/palleteColor.dart';
import 'package:nitnotes/models/submitNotesModel.dart';
import 'package:nitnotes/routes/routesName.dart';
import 'package:nitnotes/widgets/homeWidgets.dart';

class HomePage extends StatelessWidget {
  int indexTab = 0;
  final homeC = Get.put(homeController(), tag: 'df');
  final homeW = Get.put(homeWidgets());
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: ClipOval(
            child: Material(
                color: PrimaryColor().mustard,
                child: InkWell(
                    onTap: () {
                      homeC.indexTab == 0
                          ? Get.toNamed(RoutesName.formNotesPage + '/submit')
                          : homeW.addCheckBox(context, homeC.contentCheckBox);
                    },
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.plus,
                            size: 40.0, color: Colors.white))))),
        appBar: AppBar(
            centerTitle: true,
            titleSpacing: 0,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TabBar(
                  onTap: (index) {
                    homeC.changeTabIndex(index);
                    print(homeC.indexTab);
                  },
                  labelColor: PrimaryColor().mustard,
                  unselectedLabelColor: Colors.white,
                  isScrollable: true,
                  tabs: [
                    Tab(icon: Icon(FontAwesomeIcons.noteSticky)),
                    Tab(icon: Icon(FontAwesomeIcons.squareCheck))
                  ]),
            ]),
            bottom: PreferredSize(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.8),
                      IconButton(
                          onPressed: () {}, icon: Icon(FontAwesomeIcons.sun))
                    ]),
                preferredSize: Size.fromHeight(55))),
        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          notes.length != 0
              ? GridView.count(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      bottom: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.02),
                  crossAxisCount: 2,
                  children: List.generate(notes.length, (index) {
                    return FocusedMenuHolder(
                      menuWidth: MediaQuery.of(context).size.width * 0.5,
                      onPressed: () {
                        Get.toNamed(RoutesName.formNotesPage +
                            '/' +
                            notes[index]['id'].toString());
                      },
                      menuItems: [
                        FocusedMenuItem(
                            title: Text('View'),
                            onPressed: () {
                              print('object');
                            },
                            backgroundColor: PrimaryColor().racingGreen,
                            trailingIcon: Icon(FontAwesomeIcons.eye)),
                        FocusedMenuItem(
                            title: Text('Delete',
                                style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              homeC.removeNotes();
                            },
                            trailingIcon: Icon(FontAwesomeIcons.trash,
                                color: PrimaryColor().desertRed))
                      ],
                      child: Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: PrimaryColor().cactus,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(notes[index]['title'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Text(notes[index]['desc'].toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis),
                                Text(notes[index]['date'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300))
                              ])),
                    );
                  }),
                  mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  childAspectRatio: 16 / 11,
                )
              : homeW.notFoundData(
                  FontAwesomeIcons.noteSticky, 'No notes here yet', context),
          ListView(
            children: [ListTile()],
          )
        ]),
      ),
    );
  }
}
