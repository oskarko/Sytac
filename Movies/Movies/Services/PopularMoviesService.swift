//
//  PopularMoviesService.swift
//  Movies
//
//  Created by xdmgzdev on 19/04/2021.
//

import Foundation
import NetworkProvider

struct PopularMoviesService: NetworkService {
    var baseURL: String {
        CommonMovieService.baseURL
    }
    
    var method: HttpMethod {
        .get
    }
    
    var httpBody: Encodable? {
        nil
    }
    
    var headers: [String: String]? {
        [HttpHeaderKey.accept: MimeType.json.rawValue]
    }
    
    var queryParameters: [URLQueryItem]? {
        var queryItems = CommonMovieService.queryItems
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        
        return queryItems
    }
    
    var timeout: TimeInterval? {
        30
    }
    
    var path: String {
        "/movie/popular"
    }
    
    let page: Int
}
