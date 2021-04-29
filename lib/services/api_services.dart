import 'dart:convert';

import 'package:cricket_score/models/league.dart';
import 'package:cricket_score/models/player.dart';
import 'package:cricket_score/models/team.dart';
import 'package:flutter/services.dart';

class ApiServices {
 
  int statusCode;
  Future getJson() async {
    return json.decode(await rootBundle.loadString('assets/jsons/ranking_response.json'));
  }
  Future<List<League>> getTeams(String league) async{
    var response = await getJson();
    List<League> result;
    if(response['statusCode'] == 1) {
      result = (response['responseData']['result']['${league}Teams'] as List).map((e) => League.fromJson({
        'name': league,
        'teams': (response['responseData']['result']['${league}Teams'] as List).map((e) => Team.fromJson(e)).toList(),
        'batsmen': (response['responseData']['result']['${league}Batsman'] as List).map((e) => Player.fromJson(e)).toList(),
        'bowlers': (response['responseData']['result']['${league}Bowler'] as List).map((e) => Player.fromJson(e)).toList(),
        'allRounders': (response['responseData']['result']['${league}AllRounder'] as List).map((e) => Player.fromJson(e)).toList(),
      })).toList();
    }
    return result;
  }  

}

