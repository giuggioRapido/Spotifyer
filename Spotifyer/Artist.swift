//
//  Artist.swift
//  Spotifyer
//
//  Created by Christopher Shea on 6/14/16.
//  Copyright © 2016 Christopher Shea. All rights reserved.
//

import Foundation

struct fArtist: Parsable {
    let name: String
    let biography: String
    let photoURL: NSURL?
}
