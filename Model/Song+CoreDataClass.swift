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
public class Song: NSManagedObject {

    func getSongName() -> String {
        return songName!
    }
    
    func getSongArtist() -> String {
        return songArtist!
    }
    

}
