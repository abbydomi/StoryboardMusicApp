//
//  CollectionViewController.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 16/10/22.
//

import UIKit
import CoreData


class CollectionViewController: UICollectionViewController {
    
    
    //UI Stuff
    let screenSize: CGRect = UIScreen.main.bounds
    let margin: Int = 5
    
    //Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var collection: [Album]?
    
    func fetchAlbums() {
        do {
            //Fill the collection array
            self.collection = try context.fetch(Album.fetchRequest())
            let result = try context.fetch(Album.fetchRequest())
            if result.isEmpty{
                initMusic()
                try self.context.save()
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            
        }
        catch {
            
        }
    }
    
    func fetchSongsFromAlbum(albumID: String) -> [Song]{
        var songsFromAlbum = [Song]()
        do {
            let request = Song.fetchRequest() as NSFetchRequest<Song>
            let pred = NSPredicate(format: "songAlbum.albumName CONTAINS %@", albumID)
            request.predicate = pred
            songsFromAlbum = try context.fetch(request)
                    }
        catch {
            
        }
        return songsFromAlbum

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchAlbums()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection = []
        fetchAlbums()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (Int(screenSize.width)/2)-margin, height: 260)
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlaylistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "playlistCell", for: indexPath) as! PlaylistCell
    
        if let url = URL(string: collection![indexPath.row].getImg()){
            cell.imageOutlet.asyncLoad(from: url)
            cell.imageOutlet.layer.cornerRadius = 10.0
        }
        cell.artistOutlet.text = collection![indexPath.row].getArtist()
        cell.titleOutlet.text = collection![indexPath.row].getTitle()
    
        return cell
    }

    @IBSegueAction func gotoDetail(_ coder: NSCoder) -> DetailViewController? {
        return DetailViewController(coder: coder)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDetailSeque"){
            if let nextViewController = segue.destination as? DetailViewController {
                let cell = sender as! PlaylistCell
                let indexPath = self.collectionView!.indexPath(for: cell)
                nextViewController.songTitle = collection![indexPath!.row].getTitle()
                nextViewController.songImage = collection![indexPath!.row].getImg()
                nextViewController.songArtist = collection![indexPath!.row].getArtist()
                nextViewController.songList = fetchSongsFromAlbum(albumID: collection![indexPath!.row].getTitle())
            }
        }
    }
    func initMusic() {
        
        //No albums therefore create an album
        let newAlbumY3Y2 = Album(context: context)
        newAlbumY3Y2.albumName = "Y3Y2"
        newAlbumY3Y2.albumArtist = "Rojuu"
        newAlbumY3Y2.albumPictureURL = "https://cdn.albumoftheyear.org/album/554040-y3y2.jpg"
        var newSongY3Y2 = Song(context: context)
        newSongY3Y2.songName = "Lugar Seguro 3.0"
        newSongY3Y2.songArtist = "Rojuu"
        newAlbumY3Y2.addToAlbumTracks(newSongY3Y2)
        newSongY3Y2 = Song(context: context)
        newSongY3Y2.songName = "Twilight"
        newSongY3Y2.songArtist = "Rojuu, Saramalacara & Carzé"
        newAlbumY3Y2.addToAlbumTracks(newSongY3Y2)
        newSongY3Y2 = Song(context: context)
        newSongY3Y2.songName = "Infinite Azure"
        newSongY3Y2.songArtist = "Rojuu & Mda"
        newAlbumY3Y2.addToAlbumTracks(newSongY3Y2)
        newSongY3Y2 = Song(context: context)
        newSongY3Y2.songName = "Makima"
        newSongY3Y2.songArtist = "Rojuu & Carzé"
        newAlbumY3Y2.addToAlbumTracks(newSongY3Y2)
        newSongY3Y2 = Song(context: context)
        newSongY3Y2.songName = "22"
        newSongY3Y2.songArtist = "Rojuu & Carzé"
        newAlbumY3Y2.addToAlbumTracks(newSongY3Y2)
        newSongY3Y2 = Song(context: context)
        newSongY3Y2.songName = "Mix Demencia 3"
        newSongY3Y2.songArtist = "Rojuu & Carzé"
        newAlbumY3Y2.addToAlbumTracks(newSongY3Y2)
        collection?.append(newAlbumY3Y2)
        
        let newAlbumSour = Album(context: context)
        newAlbumSour.albumName = "SOUR"
        newAlbumSour.albumArtist = "Olivia Rodrigo"
        newAlbumSour.albumPictureURL = "https://www.gannett-cdn.com/presto/2021/05/21/USAT/86d10a85-a577-426c-aff4-e63b52f2faa3-SOUR_FINAL.jpg?width=1320&height=1320&fit=crop&format=pjpg&auto=webp"
        var newSongSour = Song(context: context)
        newSongSour.songName = "brutal"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "traitor"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "drivers license"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "1 step forward, 3 steps back"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "deja vu"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "good 4 u"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "enough for you"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "happier"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "jealousy, jealousy"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "favorite crime"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        newSongSour = Song(context: context)
        newSongSour.songName = "hope ur ok"
        newSongSour.songArtist = "Olivia Rodrigo"
        newAlbumSour.addToAlbumTracks(newSongSour)
        collection?.append(newAlbumSour)
        
        let newAlbumNiceDocs = Album(context: context)
        newAlbumNiceDocs.albumName = "Nice Docs, Baby!"
        newAlbumNiceDocs.albumArtist = "Blue Foster"
        newAlbumNiceDocs.albumPictureURL = "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/ba/81/84/ba8184ba-7098-da28-7d85-9d67371e8bf7/artwork.jpg/375x375bb.jpg"
        let newSongNiceDocs = Song(context: context)
        newSongNiceDocs.songName = "Nice Docs, Baby!"
        newSongNiceDocs.songArtist = "Blue Foster"
        newAlbumNiceDocs.addToAlbumTracks(newSongNiceDocs)
        collection?.append(newAlbumNiceDocs)
        
        let newAlbumICYMI = Album(context: context)
        newAlbumICYMI.albumName = "ICYMI"
        newAlbumICYMI.albumArtist = "EDEN"
        newAlbumICYMI.albumPictureURL = "https://m.media-amazon.com/images/I/41Ven6kzqPL._UX250_FMwebp_QL85_.jpg"
        var newSongICYMI = Song(context: context)
        newSongICYMI.songName = "A Call"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Balling"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Sci-Fi"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Modern Warfare"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Waiting Room"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Closer 2"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "PS1"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Call Me Back"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Duvidha"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Elsewhere"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        newSongICYMI = Song(context: context)
        newSongICYMI.songName = "Reaching 2"
        newSongICYMI.songArtist = "EDEN"
        newAlbumICYMI.addToAlbumTracks(newSongICYMI)
        collection?.append(newAlbumICYMI)
        
        let newAlbumRemember = Album(context: context)
        newAlbumRemember.albumName = "Remember That I Love You"
        newAlbumRemember.albumArtist = "Kimya Dawson"
        newAlbumRemember.albumPictureURL = "https://media.pitchfork.com/photos/5929bb92c0084474cd0c28b4/1:1/w_600/07ef688e.jpg"
        var newSongRemember = Song(context: context)
        newSongRemember.songName = "Tire Swing"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "My Mom"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "Loose Lips"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "Caving In"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "Better Weather"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "Underground"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "I Like Giants"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "The Competition"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "France"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "I Miss You"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "12-26"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        newSongRemember = Song(context: context)
        newSongRemember.songName = "My Rollercoaster (New Edit)"
        newSongRemember.songArtist = "Kimya Dawson"
        newAlbumRemember.addToAlbumTracks(newSongRemember)
        collection?.append(newAlbumRemember)
        
        let newAlbumCouples = Album(context: context)
        newAlbumCouples.albumName = "Couples Therapy"
        newAlbumCouples.albumArtist = "Modern Baseball & Marietta"
        newAlbumCouples.albumPictureURL = "https://f4.bcbits.com/img/a3162157041_10.jpg"
        var newSongCouples = Song(context: context)
        newSongCouples.songName = "Yeah Yeah Utah"
        newSongCouples.songArtist = "Marietta"
        newAlbumCouples.addToAlbumTracks(newSongCouples)
        newSongCouples = Song(context: context)
        newSongCouples.songName = "Green Call Her Sims"
        newSongCouples.songArtist = "Marietta"
        newAlbumCouples.addToAlbumTracks(newSongCouples)
        newSongCouples = Song(context: context)
        newSongCouples.songName = "Hope"
        newSongCouples.songArtist = "Modern Baseball"
        newAlbumCouples.addToAlbumTracks(newSongCouples)
        newSongCouples = Song(context: context)
        newSongCouples.songName = "It's Cold Out Here"
        newSongCouples.songArtist = "Modern Baseball"
        newAlbumCouples.addToAlbumTracks(newSongCouples)
        newSongCouples = Song(context: context)
        collection?.append(newAlbumCouples)

        let newAlbumWeezer = Album(context: context)
        newAlbumWeezer.albumName = "Weezer"
        newAlbumWeezer.albumArtist = "Weezer"
        newAlbumWeezer.albumPictureURL = "https://m.media-amazon.com/images/I/41EmpHRJLsL._UX250_FMwebp_QL85_.jpg"
        var  newSongWeezer = Song(context: context)
        newSongWeezer.songName = "My Name Is Jonas"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "No One Else"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "The World Has Turned and Left Me Here"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "Buddy Holly"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "Undone - The Sweater Song"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "Surf Wax America"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "Say It Ain't So"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "In the Garage"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "Holiday"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        newSongWeezer = Song(context: context)
        newSongWeezer.songName = "Only in Dreams"
        newSongWeezer.songArtist = "Weezer"
        newAlbumWeezer.addToAlbumTracks(newSongWeezer)
        collection?.append(newAlbumWeezer)
    }
}
