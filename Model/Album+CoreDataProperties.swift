//
//  Album+CoreDataProperties.swift
//  StoryboardMusicApp
//
//  Created by Abby Dominguez on 19/10/22.
//
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album")
    }

    @NSManaged public var albumName: String?
    @NSManaged public var albumPictureURL: String?
    @NSManaged public var albumArtist: String?
    @NSManaged public var albumTracks: NSSet?

}

// MARK: Generated accessors for albumTracks
extension Album {

    @objc(addAlbumTracksObject:)
    @NSManaged public func addToAlbumTracks(_ value: Song)

    @objc(removeAlbumTracksObject:)
    @NSManaged public func removeFromAlbumTracks(_ value: Song)

    @objc(addAlbumTracks:)
    @NSManaged public func addToAlbumTracks(_ values: NSSet)

    @objc(removeAlbumTracks:)
    @NSManaged public func removeFromAlbumTracks(_ values: NSSet)

}

extension Album : Identifiable {

}
