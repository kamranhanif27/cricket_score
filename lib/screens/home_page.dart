import 'package:cricket_score/screens/list_ui.dart';
import 'package:cricket_score/screens/subTab.dart';
import 'package:cricket_score/services/api_services.dart';
import 'package:cricket_score/view_models/leagues_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _controller;
  // ignore: unused_field

  

  @override
  void initState() {
    ApiServices().getTeams('odi');
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var league = Provider.of<LeagueViewModel>(context, listen: false);
    league.loadLeagueData();
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: Text('RANKING'),
          centerTitle: true,
          bottom: TabBar(
            controller: _controller,
            onTap: (i){
              league.index = i;
              league.loadLeagueData();
            },
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'ODI',
              ),
              Tab(
                text: 'TEST',
              ),
              Tab(
                text: 'T20',
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SubTab(
                onChanged: (i){
                  league.subIndex = i;
                  league.loadLeagueData();
                },
              ),
              Expanded(
                child: Consumer<LeagueViewModel>(
                  builder: (context, data, _){
                    return Column(
                      children: [
                        Container(
                          color: Colors.grey[200],
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text('RANK')
                              ),
                              Expanded(
                                flex: 3,
                                child: data.subIndex == 3 ? Text('TEAMS') : Text('PLAYERS'),
                              ),
                              if (data.subIndex == 3) Expanded(child: Text('RATING')),
                              SizedBox(width:15.0),
                              Expanded(child: Text('POINTS')),
                            ],
                          ),
                        ),
                        Expanded(
                          child: data.isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
                            itemCount: data.subIndex == 3 ? data.teamList.length : data.playerList.length,
                            itemBuilder: (context, i){
                              return data.subIndex == 3 ? ListUI(
                                rank: data.teamList[i].teamRank,
                                name: data.teamList[i].teamName,
                                rating: data.teamList[i].teamRating,
                                isRating: true,
                                points: data.teamList[i].teamPoints,
                                color: i % 2 == 1 ? Colors.grey[200] : Colors.white,
                              ) : ListUI(
                                rank: data.playerList[i].playerRank,
                                name: data.playerList[i].playerName,
                                isRating: false,
                                points: data.playerList[i].playerPoints,
                                color: i % 2 == 1 ? Colors.grey[200] : Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
  
}


