//
//  TrackDetailView.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI

struct TrackDetailView: View
{
    @EnvironmentObject var searchModel: SearchURLModel
    
    var body: some View
    {
        Text(searchModel.searchTerm)
    }
}

struct TrackDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TrackDetailView()
    }
}
