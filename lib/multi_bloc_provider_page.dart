import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/Remote_Data/Repositories/upcoming_event_repository.dart';
import 'Logic/Event_cubit/event_cubit.dart';
import 'Logic/Language_Cubit/language_cubit.dart';

class MultiBlocProvidersPage extends StatefulWidget {
  final Widget body;

  const MultiBlocProvidersPage({Key? key, required this.body})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiBlocProvidersPageState();
}

class _MultiBlocProvidersPageState extends State<MultiBlocProvidersPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LangCubit>(create: (_) => LangCubit()..getLang()),
        BlocProvider<EventCubit>(create: (_) => EventCubit(EventRepository())),
      ],
      child: widget.body,
    );
  }
}
