select DISTINCT descMapName from tb_lobby_stats_player

(case when DISTINCT descMapName = "de_mirage" then idLobbyGame end) as qtMiragePartida,
(case when DISTINCT descMapName = "de_nuke" then idLobbyGame end) as qtNukePartida,
(case when DISTINCT descMapName = "de_inferno" then idLobbyGame end) as qtInfernoPartida,
(case when DISTINCT descMapName = "de_vertigo" then idLobbyGame end) as qtVertigoPartida,
(case when DISTINCT descMapName = "de_ancient" then idLobbyGame end) as qtAncientPartida,
(case when DISTINCT descMapName = "de_dust2" then idLobbyGame end) as qtDust2Partida,
(case when DISTINCT descMapName = "de_train" then idLobbyGame end) as qtTrainPartida,
(case when DISTINCT descMapName = "de_overpass" then idLobbyGame end) as qtOverpassPartida