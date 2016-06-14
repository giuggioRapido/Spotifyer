//
//  ArtistViewController.swift
//  Spotifyer
//
//  Created by Christopher Shea on 6/14/16.
//  Copyright © 2016 Christopher Shea. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {

    let artist: Artist?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var bioTextView: UITextView!

    required init?(coder aDecoder: NSCoder) {
        artist = nil
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        artist = nil
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    init(artist: Artist) {
        self.artist = artist
        super.init(nibName: "ArtistViewController", bundle: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        populateArtistFields()
    }

    func populateArtistFields() {
        if let artist = artist {
            nameLabel.text = artist.name
            bioTextView.text = artist.biography
        }
    }
}
