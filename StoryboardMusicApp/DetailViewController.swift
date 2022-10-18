//
//  DetailView.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 11/10/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumDetailCell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumDetailCell
        
        cell.trackNo.text = String(indexPath.row+1)
        cell.trackName.text = songList[indexPath.row].getSongName()
        
        return cell
    }

    @IBOutlet weak var tableView: AlbumTableView!
    @IBOutlet weak var labelSongArtist: UILabel!
    @IBOutlet weak var imageAsync: AsyncImageView!
    @IBOutlet weak var labelSongTitle: UILabel!
    
    var songTitle: String = ""
    var songImage: String = ""
    var songArtist: String = ""
    var songList: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAsync.layer.cornerRadius = 10.0
        labelSongTitle.text = songTitle
        labelSongArtist.text = songArtist
        if let url = URL(string: songImage){
            imageAsync.asyncLoad(from: url)
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
}
