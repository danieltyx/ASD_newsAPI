//
//  Response.swift
//  SwiftUITunes
//
//  Created by lake on 9/16/21.
//

import Foundation
public struct NewsData: Codable
{
    var category: String
    var data: [NewsStory]
    var success: Bool
    
}
