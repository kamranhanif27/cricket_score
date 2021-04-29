import 'package:cricket_score/models/league.dart';
import 'package:cricket_score/models/player.dart';
import 'package:cricket_score/models/team.dart';
import 'package:cricket_score/services/api_services.dart';
import 'package:flutter/material.dart';

class LeagueViewModel extends ChangeNotifier {
  List<League> leagueList = [];
  List<Team> teamList;
  List<Player> playerList;

  int index = 0;
  int subIndex = 0;
  bool isLoading = true;

  // ignore: missing_return
  void loadLeagueData() async{
    // ignore: unused_local_variable
    // odiLeague = await ApiServices().getTeams('odi');
    // testLeague = await ApiServices().getTeams('test');
    // t20League = await ApiServices().getTeams('t20');
    //
    switch (index) {
      case 0: 
        leagueList = await ApiServices().getTeams('odi');
        setList();
        break;
      case 1: 
        leagueList = await ApiServices().getTeams('test');
        setList();
        break;
      case 2:
        leagueList = await ApiServices().getTeams('t20');
        setList();
        break;
    }
  }

  void updateUI(){
    notifyListeners();
  }

  void setList() {
    teamList= leagueList[0].leagueTeams;
    if(subIndex == 0){
      playerList = leagueList[0].leagueBatsmen;
    }else if(subIndex == 1) {
      playerList = leagueList[0].leagueBowlers;
    }else if(subIndex == 2){
      playerList = leagueList[0].leagueAllRounders;
    }
    isLoading = false;
    notifyListeners();
  }
}