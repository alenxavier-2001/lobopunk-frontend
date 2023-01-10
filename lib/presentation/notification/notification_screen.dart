import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/notification/notification_bloc.dart';
import 'package:lobopunk/presentation/notification/widgets/requests_screen.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NotificationBloc>(context).add(const LoadData());
    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: width / 17),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CustomLoader());
            } else if (state.hasError) {
              return const Center(
                child: Text("Error Occur"),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    children: const [
                      RequestWidget(isreceived: true),
                      MySizedBox(),
                      RequestWidget(isreceived: false),
                    ],
                  ),
                ),
              );
            }
          }),
        ));
  }
}

class RequestWidget extends StatelessWidget {
  const RequestWidget({
    Key? key,
    required this.isreceived,
  }) : super(key: key);

  final bool isreceived;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestsScreen(
                      isreceived: isreceived,
                    )));
      },
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isreceived ? "Splits requests" : "Splits requested",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: width / 20, fontWeight: FontWeight.w500),
              ),
              Text(
                isreceived
                    ? "Approve or ignore the request"
                    : "Status of requests",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: width / 22,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: width / 12,
          )
        ],
      ),
    );
  }
}
