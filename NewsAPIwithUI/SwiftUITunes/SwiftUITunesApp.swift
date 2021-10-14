//
//  SwiftUITunesApp.swift
//  SwiftUITunes
//
//  Created by lake on 9/16/21.
//

import SwiftUI

@main
struct SwiftUITunesApp: App
{
    @StateObject  var searchModel = SearchURLModel(sTerm: "")
    @StateObject  var NewsurlModel = Newsurl(ns:[])
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(NewsurlModel)
                .environmentObject(searchModel)
        }
    }
}
