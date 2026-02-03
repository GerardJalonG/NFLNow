//
//  PlayerStats.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 28/1/26.
//

import Foundation

struct PlayerStats: Identifiable {
    let id = UUID()
    let key: String
    let value: String
}

enum PlayerPositions {
    case qb, rb, receiver, defense, kicker, punter, lineman, specialTeam
}

extension PlayerPositions {
    init(player: CreatedPlayer) {
        switch player.position {
        case .qb:
            self = .qb
        case .rb:
            self = .rb
            
        case .wr, .te:
            self = .receiver
            
        case .lb, .cb, .s, .de, .dt:
            self = .defense
            
        case .k:
            self = .kicker
            
        case .p:
            self = .punter
            
        case .c, .g, .ot:
            self = .lineman
            
        case .ls:
            self = .specialTeam
        }
    }
    
    struct PlayerDefaultStats {
        
        let stats: [PlayerStats]
        
        init(player: CreatedPlayer) {
            
            switch PlayerPositions(player: player)  {
                
            case .qb:
                stats = [
                    PlayerStats(key: "PASS YDS", value: "3,842"),
                    PlayerStats(key: "TD", value: "28"),
                    PlayerStats(key: "INT", value: "11"),
                    PlayerStats(key: "QBR", value: "67.4"),
                    PlayerStats(key: "CMP %", value: "64.8%"),
                    PlayerStats(key: "SACKS TAKEN", value: "31")
                ]
                
            case .rb:
                stats = [
                    PlayerStats(key: "RUSH YDS", value: "1,120"),
                    PlayerStats(key: "RUSH TD", value: "9"),
                    PlayerStats(key: "YPC", value: "4.6"),
                    PlayerStats(key: "REC", value: "42"),
                    PlayerStats(key: "REC YDS", value: "380"),
                    PlayerStats(key: "FUMBLES", value: "3")
                ]
                
            case .receiver:
                stats = [
                    PlayerStats(key: "REC", value: "78"),
                    PlayerStats(key: "REC YDS", value: "1,012"),
                    PlayerStats(key: "YPR", value: "13.0"),
                    PlayerStats(key: "REC TD", value: "7"),
                    PlayerStats(key: "TARGETS", value: "112"),
                    PlayerStats(key: "DROPS", value: "6")
                ]
                
            case .defense:
                stats = [
                    PlayerStats(key: "TACKLES", value: "96"),
                    PlayerStats(key: "SOLO", value: "58"),
                    PlayerStats(key: "SACKS", value: "7.5"),
                    PlayerStats(key: "TFL", value: "11"),
                    PlayerStats(key: "PD", value: "9"),
                    PlayerStats(key: "QB HITS", value: "14")
                ]
                
            case .kicker:
                stats = [
                    PlayerStats(key: "FG", value: "29/33"),
                    PlayerStats(key: "FG %", value: "87.9%"),
                    PlayerStats(key: "LONG", value: "54"),
                    PlayerStats(key: "XP", value: "42/43"),
                    PlayerStats(key: "PTS", value: "129"),
                    PlayerStats(key: "MISSES", value: "4")
                ]
                
            case .punter:
                stats = [
                    PlayerStats(key: "PUNTS", value: "73"),
                    PlayerStats(key: "YDS", value: "3,438"),
                    PlayerStats(key: "AVG", value: "47.1"),
                    PlayerStats(key: "IN 20", value: "28"),
                    PlayerStats(key: "TB", value: "6"),
                    PlayerStats(key: "LONG", value: "66")
                ]
                
            case .lineman:
                stats = [
                    PlayerStats(key: "SNAPS", value: "1,067"),
                    PlayerStats(key: "SACKS ALW", value: "3"),
                    PlayerStats(key: "PEN", value: "7"),
                    PlayerStats(key: "HURRIES", value: "12"),
                    PlayerStats(key: "STARTS", value: "17"),
                    PlayerStats(key: "FALSE STARTS", value: "2")
                ]
                
            case .specialTeam:
                stats = [
                    PlayerStats(key: "ST SNAPS", value: "245"),
                    PlayerStats(key: "TACKLES", value: "9"),
                    PlayerStats(key: "FUM REC", value: "1"),
                    PlayerStats(key: "PEN", value: "1"),
                    PlayerStats(key: "BLOCKS", value: "2"),
                    PlayerStats(key: "IMPACT", value: "HIGH")
                ]
            }
        }
    }
}
