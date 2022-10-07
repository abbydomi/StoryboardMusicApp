//
//  ViewController.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tvOutlet: UITableView!
    
    let collection = [
        Album(name: "Y3Y2", artist: "Rojuu", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FFdCxkRxXoAQ5Qkv%3Fformat%3Djpg%26name%3Dmedium&f=1&nofb=1&ipt=9f8e98be263d1449bf53d17627b6816477362c40f4b7576d8465425f6480b576&ipo=images"),
        Album(name: "Sour", artist: "Olivia Rodrigo", imageURL: "https://www.gannett-cdn.com/presto/2021/05/21/USAT/86d10a85-a577-426c-aff4-e63b52f2faa3-SOUR_FINAL.jpg?width=1320&height=1320&fit=crop&format=pjpg&auto=webp"),
        Album(name: "Nice Docs, Baby!", artist: "Blue Foster", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.qM4Mqc2Uvdis1wBkckzKogAAAA%26pid%3DApi&f=1&ipt=f32f1d71f843118a8b7bafa84ab3e247cfa16d39c56662c63746a3ff72f54727&ipo=images"),
        Album(name: "ICYMI", artist: "EDEN", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstorage.googleapis.com%2Freplit%2Fimages%2F1663167927921_fcc75d72795af04fde8e49fb0c7f3a86.png&f=1&nofb=1&ipt=5b9bb7e152dfd64d039c3955a34abf9faae7bf24e899bfd8a7c02d8cb8bb2e42&ipo=images"),
        Album(name: "Remember that I love you", artist: "Kimya Dawson", imageURL: "https://media.pitchfork.com/photos/5929bb92c0084474cd0c28b4/1:1/w_600/07ef688e.jpg"),
        Album(name: "Couples Therapy", artist: "Modern Baseball & Marietta", imageURL: "https://f4.bcbits.com/img/a3162157041_10.jpg"),
        Album(name: "Weezer", artist: "Weezer", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcontent.gucca.dk%2Fcovers%2Fbig%2Fw%2Fe%2Fweezer_361518.jpg&f=1&nofb=1&ipt=26111bddf565ae583d0a24817e22ce637a1e7c84079a7175327d463a36be2c71&ipo=images"),
        Album(name: "Motions", artist: "Jeremy Zucker", imageURL: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/80/46/b3/8046b31a-4dde-c3a8-2b8a-aef1ff3fe7bb/00602557714999.rgb.jpg/600x600bf-60.jpg"),
        Album(name: "Best Buds", artist: "Mom Jeans", imageURL: "https://m.media-amazon.com/images/I/71GPefjCGDL._SL1500_.jpg"),
        Album(name: "Virtuality", artist: "Faxu", imageURL: "https://lastfm.freetls.fastly.net/i/u/ar0/0faaee7ca546c81a30f00ca8851c56ce.jpg"),
        Album(name: "Blisters in the pit of my heart", artist: "Martha", imageURL: "https://media.pitchfork.com/photos/5929bb7e5e6ef95969322c0f/1:1/w_600/37be49a7.jpg")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set album name
        let cell: MusicCell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicCell
        let albumName = collection[indexPath.row].getTitle()
        cell.titleOutlet.text = albumName
        
        //Set album image (NOT ASYNC)
        /*let url = URL(string: collection[indexPath.row].getImg())
        let data = try? Data(contentsOf: url!)
        let loadedImage: UIImage = UIImage(data: data!)!
        cell.imageOutlet.image = loadedImage*/
        
        //Set album image (ASYNC)
        if let url = URL(string: collection[indexPath.row].getImg()){
            cell.imageOutlet.asyncLoad(from: url)
        }
        
        //Set album author
        let author = collection[indexPath.row].getArtist()
        cell.artistOutlet.text = author
        return cell
    }
    

    override func viewDidLoad() {
        tvOutlet.dataSource = self
        tvOutlet.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


