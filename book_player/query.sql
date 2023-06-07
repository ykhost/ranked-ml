with tb_lobby as (
    select *
    from tb_lobby_stats_player
    where dtCreatedAt < '2022-02-01'
    and dtCreatedAt > date('2022-02-01', '-30 day')
),
 tb_stats as (
    select 
        idPlayer,
        count(distinct idLobbyGame) as qtPartidas,
        count(distinct date(dtCreatedAt)) as qtDias,
        count(DISTINCT case when qtRoundsPlayed < 16 then idLobbyGame end) as qtPartidasMenos16,
        1.0 * count(DISTINCT idLobbyGame)/count(distinct date(dtCreatedAt)) as mediaPartidasDia,
        avg(qtKill) as avgqtKill,
        avg(qtAssist) as avgqtAssist,
        avg(qtDeath) as avgqtDeath,

        avg((qtKill+qtAssist)/qtDeath) as avgKDA, -- media por partida
        1.0 * sum(qtKill+qtAssist)/sum(qtDeath) as KDAgeral,

        avg((qtKill+qtAssist)/qtRoundsPlayed) as avgKARound, -- media por partida
        1.0 * sum(qtKill+qtAssist)/sum(qtRoundsPlayed) as KARoundGeral,

        avg(qtHs) as avgqtHs,
        avg(1.0 * qtHs/qtKill) as avgHSRate,
        1.0 * sum(qtHs)/sum(qtKill) as txHSGeral,

        avg(qtBombeDefuse) as avgqtBombeDefuse,
        avg(qtBombePlant) as avgqtBombePlant,
        avg(qtTk) as avgqtTk,
        avg(qtTkAssist) as avgqtTkAssist,
        avg(qt1Kill) as avgqt1Kill,
        avg(qt2Kill) as avgqt2Kill,
        avg(qt3Kill) as avgqt3Kill,
        avg(qt4Kill) as avgqt4Kill,
        sum(qt4Kill) as sumqt4Kill,
        avg(qt5Kill) as avgqt5Kill,
        sum(qt5Kill) as sumqt5Kill,
        avg(qtPlusKill) as avgqtPlusKill,
        avg(qtFirstKill) as avgqtFirstKill,

        avg(vlDamage) as avgvlDamage,
        avg(1.0* vlDamage/qtRoundsPlayed) as avgDamageRound,
        1.0 * sum(vlDamage) / sum(qtRoundsPlayed) as DamageRoundGeral,

        avg(qtHits) as avgqtHits,
        avg(qtShots) as avgqtShots,
        avg(qtLastAlive) as avgqtLastAlive,
        avg(qtClutchWon) as avgqtClutchWon,
        avg(qtRoundsPlayed) as avgqtRoundsPlayed,
        avg(descMapName) as avgdescMapName,
        avg(vlLevel) as avgvlLevel,
        avg(qtSurvived) as avgqtSurvived,
        avg(qtTrade) as avgqtTrade,
        avg(qtFlashAssist) as avgqtFlashAssist,
        avg(qtHitHeadshot) as avgqtHitHeadshot,
        avg(qtHitChest) as avgqtHitChest,
        avg(qtHitStomach) as avgqtHitStomach,
        avg(qtHitLeftAtm) as avgqtHitLeftAtm,
        avg(qtHitRightArm) as avgqtHitRightArm,
        avg(qtHitLeftLeg) as avgqtHitLeftLeg,
        avg(qtHitRightLeg) as avgqtHitRightLeg,
        avg(flWinner) as avgflWinner,
        avg(dtCreatedAt) as avgdtCreatedAt,

    -- Partidas por mapa
        count(DISTINCT case when descMapName = "de_mirage" then idLobbyGame end) as qtMiragePartida,
        count(DISTINCT case when descMapName = "de_nuke" then idLobbyGame end) as qtNukePartida,
        count(DISTINCT case when descMapName = "de_inferno" then idLobbyGame end) as qtInfernoPartida,
        count(DISTINCT case when descMapName = "de_vertigo" then idLobbyGame end) as qtVertigoPartida,
        count(DISTINCT case when descMapName = "de_ancient" then idLobbyGame end) as qtAncientPartida,
        count(DISTINCT case when descMapName = "de_dust2" then idLobbyGame end) as qtDust2Partida,
        count(DISTINCT case when descMapName = "de_train" then idLobbyGame end) as qtTrainPartida,
        count(DISTINCT case when descMapName = "de_overpass" then idLobbyGame end) as qtOverpassPartida,

    -- Vitorias por mapa
        count(DISTINCT case when descMapName = "de_mirage" and flWinner = 1 then idLobbyGame end) as qtMirageVitoria,
        count(DISTINCT case when descMapName = "de_nuke" and flWinner = 1 then idLobbyGame end) as qtNukeVitoria,
        count(DISTINCT case when descMapName = "de_inferno" and flWinner = 1 then idLobbyGame end) as qtInfernoVitoria,
        count(DISTINCT case when descMapName = "de_vertigo" and flWinner = 1 then idLobbyGame end) as qtVertigoVitoria,
        count(DISTINCT case when descMapName = "de_ancient" and flWinner = 1 then idLobbyGame end) as qtAncientVitoria,
        count(DISTINCT case when descMapName = "de_dust2" and flWinner = 1 then idLobbyGame end) as qtDust2Vitoria,
        count(DISTINCT case when descMapName = "de_train" and flWinner = 1 then idLobbyGame end) as qtTrainVitoria,
        count(DISTINCT case when descMapName = "de_overpass" and flWinner = 1 then idLobbyGame end) as qtOverpaVitoria

    from tb_lobby_stats_player
    where dtCreatedAt < '2022-02-01'
    and dtCreatedAt > date('2022-02-01', '-30 day')

    group by idPlayer
),
tb_lvl_atual as (
    select idPlayer,
        vlLevel
    from (
        select idLobbyGame,
            idPlayer,
            vlLevel,
            dtcreatedAt,
            row_number() over (PARTITION by idPlayer order by dtCreatedAt desc) as rn
        from tb_lobby
    )
    where rn = 1
)

select t1.*,
    t2.vlLevel as vlLevelAtual
from tb_stats as t1
left join tb_lvl_atual as t2
on t1.idPlayer = t2.idPlayer