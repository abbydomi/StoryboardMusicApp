//
//  Album+CoreDataClass.swift
//  StoryboardMusicApp
//
//  Created by Abby Dominguez on 19/10/22.
//
//

import Foundation
import CoreData

@objc(Album)
public class Album: NSManagedObject {
    
    func getTitle() -> String {
        return self.albumName!
    }
    func getImg() -> String {
        return self.albumPictureURL!
    }
    
    func getArtist() -> String {
        return self.albumArtist!
    }
    
    func getSongs() -> NSSet {
        
        return self.albumTracks!
    }
}
