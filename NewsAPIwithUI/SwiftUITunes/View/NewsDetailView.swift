//
//  TrackDetailView.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI
import BetterSafariView
struct NewsDetailView: View
{
    
    var selectedNews: NewsStory
    @EnvironmentObject var searchModel: SearchURLModel
    @EnvironmentObject var NewsurlModel: Newsurl
    @State private var presentingSafariView = false
    var body: some View
    {
        
            VStack(alignment:.leading)
            {
                Text(selectedNews.title)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .multilineTextAlignment(.leading)
                    .offset(y: 0)
                    .frame(minWidth: 0, maxHeight: 150, alignment: .topLeading)
                RemoteImageView(url: selectedNews.imageUrl)
                   .clipShape(Rectangle())
                   .frame(width: 300, height: 160)
                   .scaledToFit()
                   .padding()
                Text(selectedNews.author)
                Text(selectedNews.date)
                Text(selectedNews.time)
                Text(" ")
                Text(selectedNews.content)
                Spacer()
            if selectedNews.readMoreUrl != nil
            {
                
                let thisurl = selectedNews.readMoreUrl!
                let thisurl = thisurl.replacingOccurrences(of: " ", with: "")
                
                Button(action: {
                           self.presentingSafariView = true
                       }) {
                           Text("Read More")
                               .font(.title)
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
                
                Link("Open in Safari", destination: URL(string: thisurl)!)
                .foregroundColor(.gray)
                
                
            }
//            Text(searchModel.searchTerm)
//            Text(selectedNews.title)
//            Text(selectedNews.readMoreUrl ?? "none")
        }
           
    
        
    }
}

