import 'package:intl/intl.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/dependency_injector/dependency_injector.dart';
import 'package:sample/features/dashboard/presentation/state/user_state.dart';
import 'package:sample/services/conectivity_services.dart';
import 'package:sample/widgets/app_bar_widget.dart';
import 'package:sample/widgets/error_tex_widget.dart';
import 'package:sample/widgets/loading_widget.dart';
import 'package:sample/widgets/text_field.dart';
import 'package:sample/widgets/text_widget.dart';

class ChatView extends ConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);
    var connectivityStatusSate = ref.watch(connectivityStatusProviders);
    TextEditingController controller = TextEditingController();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
        title: const TextUtils(text: 'Chat'),
        callBack: () {
          scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: Center(
        child: connectivityStatusSate != ConnectivityStatus.isConnected
            ? const Center(
                child: TextUtils(
                  text: 'Is Disconnected from Internet',
                  style: TextStyle(
                      color: Colors.red, fontSize: 20.0, fontFamily: 'Mulish'),
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  return await ref.refresh(userNotifierProvider);
                },
                child: Consumer(
                  builder: (context, ref, child) {
                    if (state is UserLoaded) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: TextFieldUtils(
                                      controller: controller,
                                      callBack: (response) async {},
                                      hintText: 'Search here...',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.edit_note,
                                    size: 33, color: Colors.grey[400])
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: ref.watch(chatListProvider).length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: ref
                                                      .watch(chatListProvider)[
                                                          index]
                                                      .profileURL!,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                          downloadProgress) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                      ),
                                                    );
                                                  },
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                  height: 50,
                                                ),
                                                if (ref
                                                    .watch(
                                                        chatListProvider)[index]
                                                    .isOnline!)
                                                  Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.green,
                                                    ),
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            ref
                                                                .watch(chatListProvider)[
                                                                    index]
                                                                .name!,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87)),
                                                        Text(
                                                            ref
                                                                .watch(chatListProvider)[
                                                                    index]
                                                                .lastMessage!,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey[
                                                                        600])),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          DateFormat.Hm().format(ref
                                                              .watch(chatListProvider)[
                                                                  index]
                                                              .messageTime!),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[600]),
                                                        ),
                                                        if (ref
                                                                .watch(chatListProvider)[
                                                                    index]
                                                                .unreadCount! >
                                                            0)
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Colors
                                                                  .blueAccent,
                                                            ),
                                                            height: 15,
                                                            width: 15,
                                                            child: Text(
                                                              ref
                                                                  .watch(chatListProvider)[
                                                                      index]
                                                                  .unreadCount!
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 7),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                }),
                          ),
                        ],
                      );
                    } else if (state is UserLoading) {
                      return const Loading();
                    } else if (state is UserError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextUtils(text: state.message),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'Error',
                          onPressed: () {},
                        ),
                      ));
                      return ErrorText(error: state.message);
                    } else {
                      return const Loading();
                    }
                  },
                ),
              ),
      ),
    );
  }
}
