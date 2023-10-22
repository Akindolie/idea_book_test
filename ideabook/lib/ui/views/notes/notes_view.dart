import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../components/custom_app_bar.dart';
import '../../components/idea_tile.dart';
import '../../components/send_button.dart';
import '../../components/textfield_bd.dart';
import '../../components/textfield_hd.dart';
import 'notes_viewmodel.dart';

class NotesView extends StackedView<NotesViewModel> {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotesViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            height: size.height - 100,
            child: ListView.builder(
                itemCount: viewModel.ideas.length,
                itemBuilder: (BuildContext context, int index) {
                  return IdeaTile(
                    title: viewModel.ideas[index].title,
                    content: viewModel.ideas[index].content,
                    time: viewModel.ideas[index].time,
                    date: viewModel.ideas[index].date,
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
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 16, left: 14, right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              width: 81,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: kcPrimaryColorDark,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            if (viewModel.containerHeight >= size.height * 0.5)
                              TextFieldHd(
                                label: 'Title',
                                onChanged: (value) =>
                                    viewModel.updateTextTitle = value,
                                controller: viewModel.titleController,
                              ),
                            TextFieldBd(
                              label: 'Jot something down',
                              onChanged: (value) =>
                                  viewModel.updateTextBody = value,
                              controller: viewModel.contentController,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SendButton(
                          onTap: () {
                            viewModel.submit();
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
    );
  }

  @override
  NotesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotesViewModel();
}
