class Player {
  final int playerRank;
  final String playerName;
  final int playerPoints;
  Player({
    this.playerRank,
    this.playerName,
    this.playerPoints,
  });


  factory Player.fromJson(Map<String, dynamic> json){
    return Player(
      playerRank: json['position'],
      playerName: json['player_name'],
      playerPoints: json['points'],
    );
  }

  toMap(Map<String, dynamic> data){
    return {
      "position": playerRank,
      "player_name": playerName,
      "points": playerPoints,
    };
  }
}
