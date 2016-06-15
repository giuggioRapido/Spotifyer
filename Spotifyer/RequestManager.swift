//
//  RequestManager.swift
//  Spotifyer
//
//  Created by Christopher Shea on 6/14/16.
//  Copyright © 2016 Christopher Shea. All rights reserved.
//

import Foundation

final class RequestManager {
    static let sharedManager = RequestManager()
    typealias Artists = [Artist]

    enum Result {
        case Success(Artists)
        case Error(NSError)
    }

    typealias CompletionHandler = (Result) -> Void

    func searchArtistName(name: String, completion: CompletionHandler) {

        let query = Endpoints.Search + searchQueryForArtistName(name)

        guard let url = NSURL(string: query) else {
            print("Could not create URL from query: \(query)")
            return
        }

        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"

        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)

        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            print(response)
        }

        task.resume()
    }

    private enum Endpoints {
        static let Search = "https://api.spotify.com/v1/search"
    }

    private func searchQueryForArtistName(name: String) -> String {
        let formattedName = name.stringByReplacingOccurrencesOfString(" ",
                                                                      withString: "+",
                                                                      options: .CaseInsensitiveSearch,
                                                                      range: nil)
        return "?q=\(formattedName)&type=artist"
    }
}