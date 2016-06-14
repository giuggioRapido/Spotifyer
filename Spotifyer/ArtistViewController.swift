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
}
