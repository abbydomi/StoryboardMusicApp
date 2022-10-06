//
//  AlbumProtocol.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 6/10/22.
//

import Foundation
protocol AlbumProtocol {
    var albumName: String {get set}
    var albumArtist: String {get set}
    var albumImage: String{get set}
    
    func getTitle() -> String
    func getImg() -> String
    func getArtist() -> String
}
