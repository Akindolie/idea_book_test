import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ideabook/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../components/send_button.dart';
import '../../components/textfield_bd.dart';
import '../../components/textfield_hd.dart';
import 'notes_viewmodel.dart';

class NotesView extends StackedView<NotesViewModel> {
  NotesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotesViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          icon: const Icon(
            IconlyLight.arrow_left,
            size: 24,
          ),
          onPressed: () {},
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.jpeg"),
              radius: 20,
            ),
            horizontalSpaceSmall,
            Text('IdeaBook'),
          ],
        ),
        iconTheme: const IconThemeData(color: kcVeryLightGrey),
        backgroundColor: kcMediumGrey,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            //color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            height: size.height - 100,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 149,
                      decoration: BoxDecoration(
                        color: Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 2),
                            child: SizedBox(
                              height: 20,
                              child: Text(
                                'Lorem ipsum',
                                style: kTitleTS.copyWith(fontSize: 14),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color(0xFF202020),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Justo convallis viverra faucibus volutpat. Eu diam purus viverra arcu turpis placerat a. Risus quis elit magna gravida viverra elementum rhoncus nunc dui. Suspendisse aliquet lacinia erat pharetra ....',
                                style:
                                    kBodyTS.copyWith(color: Color(0xFFDBDADA)),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          GestureDetector(
            onVerticalDragStart: (details) {
              viewModel.screenHeight = details.globalPosition.dy;
            },
            onVerticalDragUpdate: (details) {
              double dy = details.globalPosition.dy - viewModel.screenHeight;

              viewModel.updateContainerHeight = dy;

              viewModel.screenHeight = details.globalPosition.dy;
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: viewModel.containerHeight,
              decoration: const BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Padding(
                  padding:
                      //const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                      const EdgeInsets.only(
                          top: 4, bottom: 8, left: 14, right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 81,
                            height: 3,
                            decoration: BoxDecoration(
                                color: kcPrimaryColorDark,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          verticalSpaceSmall,
                          if (viewModel.containerHeight >=
                              viewModel.screenHeight)
                            TextFieldHd(
                              label: 'Title',
                              onChanged: (value) =>
                                  viewModel.updateTextTitle = value,
                            ),
                          //verticalSpaceTiny,
                          Row(
                            children: [
                              TextFieldBd(
                                label: 'Jot something down',
                                onChanged: (value) =>
                                    viewModel.updateTextBody = value,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SendButton(
                          onTap: () {
                            print('clicked!');
                          },
                          disable: viewModel.disableButton(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // body: Container(
      //   height: viewModel.bannerHeight,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Stack(
      //           alignment: Alignment.bottomCenter,
      //           children: [
      //             Image.network(
      //               'https://via.placeholder.com/600x400',
      //               height: 200,
      //               width: double.infinity,
      //               fit: BoxFit.cover,
      //             ),
      //             GestureDetector(
      //               onVerticalDragUpdate: (DragUpdateDetails details) {
      //                 //setState(() {
      //                 double positionY = details.globalPosition.dy;
      //                 double maxHeight =
      //                     MediaQuery.of(context).size.height - 100;
      //
      //                 /// Limits at 200 height minimum
      //                 if (positionY < 200) {
      //                   viewModel.bannerHeight = 200;
      //                 }
      //
      //                 /// Limits the max height of expanded
      //                 else if (positionY <= maxHeight) {
      //                   viewModel.bannerHeight = positionY;
      //                 }
      //                 viewModel.rebuildUi();
      //                 // });
      //               },
      //               child: const FaIcon(
      //                 FontAwesomeIcons.gripLines,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //         Text('Example'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  @override
  NotesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotesViewModel();
}
