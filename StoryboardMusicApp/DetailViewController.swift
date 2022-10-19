//
//  DetailView.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 11/10/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIContextMenuInteractionDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumDetailCell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumDetailCell
        
        cell.trackNo.text = String(indexPath.row+1)
        cell.trackName.text = songList[indexPath.row].getSongName()
        
        /*let tap = UITapGestureRecognizer(target: self, action: #selector(tappedCell(sender: )))
        cell.addGestureRecognizer(tap)*/
        let contextMenu = UIContextMenuInteraction(delegate: self)
        cell.addInteraction(contextMenu)
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
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) { _ in
                
                let addToPlaylist = UIAction(
                    title: "Add to a playlist",
                    image: (UIImage(systemName: "text.badge.plus")),
                    attributes: .disabled) { _ in
                    print("tested")
                }
                let actionRemove = UIAction(
                    title: "Remove",
                    image: (UIImage(systemName: "trash")),
                    attributes: .destructive
                ) { _ in
                    print("remove")
                }
        
                return UIMenu(children: [addToPlaylist, actionRemove])
            }
    }
}
