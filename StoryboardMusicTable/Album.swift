//
//  Album.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 6/10/22.
//

import Foundation
class Album: AlbumProtocol {
    init(name: String, artist: String, imageURL: String){
        albumName = name
        albumArtist = artist
        albumImage = imageURL
    }
    var albumName: String
    var albumImage: String
    var albumArtist: String
    
    func getTitle() -> String {
        return self.albumName
    }
    func getImg() -> String {
        return self.albumImage
    }
    
    func getArtist() -> String {
        return self.albumArtist
    }
    
    
}

