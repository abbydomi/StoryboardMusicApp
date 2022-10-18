//
//  DetailView.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 11/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    
   
    
    @IBOutlet weak var labelSongArtist: UILabel!
    @IBOutlet weak var imageAsync: AsyncImageView!
    @IBOutlet weak var labelSongTitle: UILabel!
    var songTitle: String = ""
    var songImage: String = ""
    var songArtist: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAsync.layer.cornerRadius = 10.0
        labelSongTitle.text = songTitle
        labelSongArtist.text = songArtist
        if let url = URL(string: songImage){
            imageAsync.asyncLoad(from: url)
        }
    }
}
