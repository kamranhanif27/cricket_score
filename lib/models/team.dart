class Team {
  final int teamRank;
  final String teamName;
  final int teamRating;
  final int teamPoints;
  

  Team({this.teamRank, this.teamName, this.teamRating, this.teamPoints});

  factory Team.fromJson(Map<String, dynamic> json){
    return Team(
      teamRank: json['position'],
      teamName: json['team_name'],
      teamRating: json['rating'],
      teamPoints: json['points'],
    );
  }

  toMap(Map<String, dynamic> data){
    return {
      "position": teamRank,
      "team_name": teamName,
      "rating": teamRating,
      "points": teamPoints,
    };
  }
}