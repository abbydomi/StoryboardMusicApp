//
//  Song+CoreDataClass.swift
//  StoryboardMusicApp
//
//  Created by Abby Dominguez on 19/10/22.
//
//

import Foundation
import CoreData

@objc(Song)
public class Song: NSManagedObject, SongProtocol {
    
    var lsongName: String = ""
    var lsongArtist: String = ""
    
    func getSongName() -> String {
        return lsongName
    }
    
    func getSongArtist() -> String {
        return lsongArtist
    }
    

}
