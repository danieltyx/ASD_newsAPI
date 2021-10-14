//
//  Newsurl.swift
//  NewsAPIwithUI
//
//  Created by Daniel on 10/13/21.
//

import Foundation
import Combine

class Newsurl: ObservableObject {
    
    @Published var newsurl : [NewsStory]
    
    init(ns:[NewsStory])
    {
        self.newsurl = ns

    }
    
}
