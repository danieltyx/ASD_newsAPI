//
//  SearchURLModel.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import Foundation
import Combine

class SearchURLModel: ObservableObject
{
    @Published var searchTerm: String
   

    init(sTerm: String)
    {
        self.searchTerm = sTerm
       
    }
}
