//
//  TrackDetailView.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI
import BetterSafariView
struct TrackDetailView: View
{
    
    var landmark: NewsStory
    @EnvironmentObject var searchModel: SearchURLModel
    @EnvironmentObject var NewsurlModel: Newsurl
    @State private var presentingSafariView = false
    var body: some View
    {
        if landmark.readMoreUrl != nil
        {
            let thisurl = landmark.readMoreUrl!
            let thisurl = thisurl.replacingOccurrences(of: " ", with: "")
            
            Button(action: {
                       self.presentingSafariView = true
                   }) {
                       Text("Present SafariView")
                   }
                   .safariView(isPresented: $presentingSafariView) {
                       SafariView(
                           url: URL(string: thisurl)!,
                           configuration: SafariView.Configuration(
                               entersReaderIfAvailable: false,
                               barCollapsingEnabled: true
                           )
                       )
                       .preferredBarAccentColor(.clear)
                       .preferredControlAccentColor(.accentColor)
                       .dismissButtonStyle(.done)
                   }
            
            Link("Visit", destination: URL(string: thisurl)!)
            .font(.title)
            .foregroundColor(.red)
            
            
        }
        Text(searchModel.searchTerm)
        Text(landmark.title)
        Text(landmark.readMoreUrl ?? "none")
        
           
    
        
    }
}
//
//struct TrackDetailView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//       // TrackDetailView(landmark: [])
//    }
//}


