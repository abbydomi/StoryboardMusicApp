//
//  CollectionViewController.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 16/10/22.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    var collection: [Album] = []
    
    let screenSize: CGRect = UIScreen.main.bounds
    let margin: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection = initMusic()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (Int(screenSize.width)/2)-margin, height: 260)
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlaylistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "playlistCell", for: indexPath) as! PlaylistCell
    
        if let url = URL(string: collection[indexPath.row].getImg()){
            cell.imageOutlet.asyncLoad(from: url)
            cell.imageOutlet.layer.cornerRadius = 10.0
        }
        cell.artistOutlet.text = collection[indexPath.row].getArtist()
        cell.titleOutlet.text = collection[indexPath.row].getTitle()
    
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
                nextViewController.songTitle = collection[indexPath!.row].getTitle()
                nextViewController.songImage = collection[indexPath!.row].getImg()
                nextViewController.songArtist = collection[indexPath!.row].getArtist()
                nextViewController.songList = collection[indexPath!.row].getSongs()
            }
        }
    }
    func initMusic() -> [Album]{
        let albumY3Y2 = [
            Song(song: "Lugar Seguro 3.0", artist: "Rojuu & Carzé"),
            Song(song: "Twilight", artist: "Rojuu, Saramalacara & Carzé"),
            Song(song: "Infinite Azure", artist: "Rojuu & Mda"),
            Song(song: "Makima", artist: "Rojuu & Carzé"),
            Song(song: "22", artist: "Rojuu & Carzé"),
            Song(song: "Mix Demencia 3", artist: "Rojuu & Carzé")
        ]
        let albumSour = [
            Song(song: "brutal", artist: "Olivia Rodrigo"),
            Song(song: "traitor", artist: "Olivia Rodrigo"),
            Song(song: "drivers license", artist: "Olivia Rodrigo"),
            Song(song: "1 step forward, 3 steps back", artist: "Olivia Rodrigo"),
            Song(song: "deja vu", artist: "Olivia Rodrigo"),
            Song(song: "good 4 u", artist: "Olivia Rodrigo"),
            Song(song: "enough for you", artist: "Olivia Rodrigo"),
            Song(song: "happier", artist: "Olivia Rodrigo"),
            Song(song: "jealousy, jealousy", artist: "Olivia Rodrigo"),
            Song(song: "favorite crime", artist: "Olivia Rodrigo"),
            Song(song: "hope ur ok", artist: "Olivia Rodrigo")
        ]
        let albumNiceDocs = [Song(song: "Nice Docs, Baby!", artist: "Blue Foster")]
        let albumICYMI = [
            Song(song: "A Call", artist: "EDEN"),
            Song(song: "Balling", artist: "EDEN"),
            Song(song: "Sci-Fi", artist: "EDEN"),
            Song(song: "Modern Warfare", artist: "EDEN"),
            Song(song: "Waiting Room", artist: "EDEN"),
            Song(song: "Closer 2", artist: "EDEN"),
            Song(song: "PS1", artist: "EDEN"),
            Song(song: "Call Me Back", artist: "EDEN"),
            Song(song: "Duvidha", artist: "EDEN"),
            Song(song: "Elsewhere", artist: "EDEN"),
            Song(song: "Reaching 2", artist: "EDEN")
        ]
        let albumRemember = [
            Song(song: "Tire Swing", artist: "Kimya Dawson"),
            Song(song: "My Mom", artist: "Kimya Dawson"),
            Song(song: "Loose Lips", artist: "Kimya Dawson"),
            Song(song: "Caving In", artist: "Kimya Dawson"),
            Song(song: "Better Weather", artist: "Kimya Dawson"),
            Song(song: "Underground", artist: "Kimya Dawson"),
            Song(song: "I Like Giants", artist: "Kimya Dawson"),
            Song(song: "The Competition", artist: "Kimya Dawson"),
            Song(song: "France", artist: "Kimya Dawson"),
            Song(song: "I Miss You", artist: "Kimya Dawson"),
            Song(song: "12-26", artist: "Kimya Dawson"),
            Song(song: "My Rollercoaster (New Edit)", artist: "Kimya Dawson")
        ]
        let albumCouples = [
            Song(song: "Yeah Yeah Utah", artist: "Marietta"),
            Song(song: "Green Call Her Sims", artist: "Marietta"),
            Song(song: "Hope", artist: "Modern Baseball"),
            Song(song: "It's Cold Out Here", artist: "Modern Baseball")
        ]
        let albumBestBuds = [
            Song(song: "Death Cup", artist: "Mom Jeans"),
            Song(song: "Danger Can't", artist: "Mom Jeans"),
            Song(song: "Movember", artist: "Mom Jeans & Sarah Levy"),
            Song(song: "Edward 40Hands", artist: "Mom Jeans"),
            Song(song: "*Sobs Quietly*", artist: "Mom Jeans"),
            Song(song: "Poor Boxer Shorts", artist: "Mom Jeans"),
            Song(song: "Remy's Boyz", artist: "Mom Jeans"),
            Song(song: "Girl Scout Cookies", artist: "Mom Jeans"),
            Song(song: "Scott Pilgrim Vs. My Gpa", artist: "Mom Jeans"),
            Song(song: "Vape Nation", artist: "Mom Jeans")
        ]
        let albumVirtuality = [
            Song(song: "Amor Al Arte", artist: "Faxu & ksd"),
            Song(song: "Madrid (feat. Chef C)", artist: "Faxu, Nuevo Angel & 7ty"),
            Song(song: "Popstar", artist: "Faxu & deftunedfreq"),
            Song(song: "#HelloKitty^^", artist: "Faxu"),
            Song(song: "Elden Ring (feat. Chef C", artist: "Faxu, Uglywhiite & Wonkaflako"),
            Song(song: "Cyberpunk", artist: "Faxu, Orslok & Chef C"),
            Song(song: "Hookah (Remix)", artist: "Faxu, Rojuu & Chef C"),
            Song(song: "Log out (Outro) (feat. Chef C)", artist: "Faxu & Santo Romeo")
        ]
        let albumWeezer = [
            Song(song: "My Name Is Jonas", artist: "Weezer"),
            Song(song: "No One Else", artist: "Weezer"),
            Song(song: "The World Has Turned and Left Me Here", artist: "Weezer"),
            Song(song: "Buddy Holly", artist: "Weezer"),
            Song(song: "Undone - The Sweater Song", artist: "Weezer"),
            Song(song: "Surf Wax America", artist: "Weezer"),
            Song(song: "Say It Ain't So", artist: "Weezer"),
            Song(song: "In the Garage", artist: "Weezer"),
            Song(song: "Holiday", artist: "Weezer"),
            Song(song: "Only in Dreams", artist: "Weezer"),
        ]
        let albumBlisters = [
            Song(song: "Christine", artist: "Martha"),
            Song(song: "Checkhov's Hangnail", artist: "Martha"),
            Song(song: "Precarious (The Supermarket Song)", artist: "Martha"),
            Song(song: "Do Whatever", artist: "Martha"),
            Song(song: "Goldman's Detective Agency", artist: "Martha"),
            Song(song: "The Awkward Ones", artist: "Martha"),
            Song(song: "Ice Cream and Sunscreen ", artist: "Martha"),
            Song(song: "11:45, Legless in Brandon", artist: "Martha"),
            Song(song: "Curly & Raquel", artist: "Martha"),
            Song(song: "Do Nothing", artist: "Martha"),
            Song(song: "St. Paul's (Westerberg Comprehensive)", artist: "Martha")
        ]
        let albumMotions = [
            Song(song: "Heavy", artist: "Jeremy Zucker"),
            Song(song: "Keep My Head Afloat", artist: "Jeremy Zucker"),
            Song(song: "IDK Love", artist: "Jeremy Zucker"),
            Song(song: "Sinking", artist: "Jeremy Zucker"),
            Song(song: "Shut Your Mouth", artist: "Jeremy Zucker"),
            Song(song: "Stay Quiet", artist: "Jeremy Zucker"),
            Song(song: "Man Down", artist: "Jeremy Zucker"),
            Song(song: "Upside Down (feat. Daniel James)", artist: "Jeremy Zucker"),
        ]
        return [
            Album(name: "Y3Y2", artist: "Rojuu", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FFdCxkRxXoAQ5Qkv%3Fformat%3Djpg%26name%3Dmedium&f=1&nofb=1&ipt=9f8e98be263d1449bf53d17627b6816477362c40f4b7576d8465425f6480b576&ipo=images", songs: albumY3Y2),
            Album(name: "Sour", artist: "Olivia Rodrigo", imageURL: "https://www.gannett-cdn.com/presto/2021/05/21/USAT/86d10a85-a577-426c-aff4-e63b52f2faa3-SOUR_FINAL.jpg?width=1320&height=1320&fit=crop&format=pjpg&auto=webp", songs: albumSour),
            Album(name: "Nice Docs, Baby!", artist: "Blue Foster", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.qM4Mqc2Uvdis1wBkckzKogAAAA%26pid%3DApi&f=1&ipt=f32f1d71f843118a8b7bafa84ab3e247cfa16d39c56662c63746a3ff72f54727&ipo=images", songs: albumNiceDocs),
            Album(name: "ICYMI", artist: "EDEN", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstorage.googleapis.com%2Freplit%2Fimages%2F1663167927921_fcc75d72795af04fde8e49fb0c7f3a86.png&f=1&nofb=1&ipt=5b9bb7e152dfd64d039c3955a34abf9faae7bf24e899bfd8a7c02d8cb8bb2e42&ipo=images", songs: albumICYMI),
            Album(name: "Remember that I love you", artist: "Kimya Dawson", imageURL: "https://media.pitchfork.com/photos/5929bb92c0084474cd0c28b4/1:1/w_600/07ef688e.jpg", songs: albumRemember),
            Album(name: "Couples Therapy", artist: "Modern Baseball & Marietta", imageURL: "https://f4.bcbits.com/img/a3162157041_10.jpg", songs: albumCouples),
            Album(name: "Weezer", artist: "Weezer", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcontent.gucca.dk%2Fcovers%2Fbig%2Fw%2Fe%2Fweezer_361518.jpg&f=1&nofb=1&ipt=26111bddf565ae583d0a24817e22ce637a1e7c84079a7175327d463a36be2c71&ipo=images", songs: albumWeezer),
            Album(name: "Motions", artist: "Jeremy Zucker", imageURL: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/80/46/b3/8046b31a-4dde-c3a8-2b8a-aef1ff3fe7bb/00602557714999.rgb.jpg/600x600bf-60.jpg", songs: albumMotions),
            Album(name: "Best Buds", artist: "Mom Jeans", imageURL: "https://m.media-amazon.com/images/I/71GPefjCGDL._SL1500_.jpg", songs: albumBestBuds),
            Album(name: "Virtuality", artist: "Faxu", imageURL: "https://lastfm.freetls.fastly.net/i/u/ar0/0faaee7ca546c81a30f00ca8851c56ce.jpg", songs: albumVirtuality),
            Album(name: "Blisters in the pit of my heart", artist: "Martha", imageURL: "https://media.pitchfork.com/photos/5929bb7e5e6ef95969322c0f/1:1/w_600/37be49a7.jpg", songs: albumBlisters)]
        
    }
    
}
