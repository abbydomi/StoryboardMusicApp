//
//  ViewController.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tvOutlet: UITableView!
    
    let collection = [Album(name: "Y3Y2", artist: "Rojuu", imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FFdCxkRxXoAQ5Qkv%3Fformat%3Djpg%26name%3Dmedium&f=1&nofb=1&ipt=9f8e98be263d1449bf53d17627b6816477362c40f4b7576d8465425f6480b576&ipo=images"),
                      Album(name: "Sour", artist: "Olivia Rodrigo", imageURL: "https://www.gannett-cdn.com/presto/2021/05/21/USAT/86d10a85-a577-426c-aff4-e63b52f2faa3-SOUR_FINAL.jpg?width=1320&height=1320&fit=crop&format=pjpg&auto=webp")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set album name
        let cell: MusicCell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicCell
        let albumName = collection[indexPath.row].getTitle()
        cell.titleOutlet.text = albumName
        //Set album image
        let url = URL(string: collection[indexPath.row].getImg())
        let data = try? Data(contentsOf: url!)
        let loadedImage: UIImage = UIImage(data: data!)!
        cell.imageOutlet.image = loadedImage
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


