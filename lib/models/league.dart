import 'package:cricket_score/models/player.dart';
import 'package:cricket_score/models/team.dart';

class League {
  final String leagueName;
  final List<Team> leagueTeams;
  final List<Player> leagueBatsmen;
  final List<Player> leagueBowlers;
  final List<Player> leagueAllRounders;

  League({this.leagueName, this.leagueTeams, this.leagueBatsmen, this.leagueBowlers, this.leagueAllRounders});

  factory League.fromJson(Map<String, dynamic> json){
    return League(
      leagueName: json['name'],
      leagueTeams: json['teams'],
      leagueBatsmen: json['batsmen'],
      leagueBowlers: json['bowlers'],
      leagueAllRounders: json['allRounders'],
    );
  }

}