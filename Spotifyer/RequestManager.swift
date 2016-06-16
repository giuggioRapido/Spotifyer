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

    typealias ResultHandler = (RequestResult) -> Void

    enum RequestResult {
        case Success(NSData)
        case Error(NSError)
    }

    private enum Endpoints {
        static let Search = "https://api.spotify.com/v1/search"
    }

    func searchArtistName(name: String, completion: ResultHandler) {

        let query = Endpoints.Search + searchQueryForArtistName(name)

        guard let searchURL = NSURL(string: query) else {
            print("Could not create URL from query: \(query)")
            return
        }

        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)

        let searchRequest = NSMutableURLRequest(URL: searchURL)
        searchRequest.HTTPMethod = "GET"

        let task = session.dataTaskWithRequest(searchRequest) { (data, response, error) in
            if let error = error {
                let result = RequestResult.Error(error)
                completion(result)
                return
            }

            if let json = data {
                let result = RequestResult.Success(json)
                completion(result)
                return
            }
        }

        task.resume()
    }

    private func searchQueryForArtistName(name: String) -> String {
        let formattedName =
            name.stringByReplacingOccurrencesOfString(" ",
                                                      withString: "+",
                                                      options: .CaseInsensitiveSearch,
                                                      range: nil)
        return "?q=\(formattedName)&type=artist"
    }
}