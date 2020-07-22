import 'package:blocApi/api_bloc.dart';
import 'package:blocApi/api_model.dart';
import 'package:blocApi/repositories/api_get.dart';
import 'package:blocApi/repositories/repository_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_state_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ApiFetching fetchingRepository = ApiFetching(
      apiCalling: ApiCalling(),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        usersRepo: fetchingRepository,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ApiFetching usersRepo;
  MyHomePage({Key key, this.usersRepo}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiBloc apiBloc;
  @override
  void initState() {
    apiBloc = ApiBloc(apiFetching: widget.usersRepo);
    apiBloc.dispatch(FetchApi());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Lib'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        bloc: apiBloc,
        builder: (context, state) {
          if (state is ApiLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ApiLoaded) {
            return _buildListView(state.api);
          }
          if (state is ApiError) {
            return Center(
              child: Container(
                child: Text('Error'),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  ListView _buildListView(List<ApiModel> api) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(api[i].userId.toString()),
          subtitle: Text(api[i].title),
        );
      },
      itemCount: api.length,
    );
  }

  @override
  void dispose() {
    apiBloc.dispose();
    super.dispose();
  }
}
