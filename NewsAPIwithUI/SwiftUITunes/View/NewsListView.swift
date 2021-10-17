//
//  TrackList.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI

struct NewsListView: View
{

    var newsCatagory: String
    @EnvironmentObject var searchModel: SearchURLModel
    @EnvironmentObject var NewsurlModel: Newsurl
   // @State var results = [NewsStory]()
    
    static let screenWidth = UIScreen.main.bounds.size.width
    var largeFontSize = 20
    var captionFontSize = 10
    
    var body: some View
    {
            List(results, id: \.title)
            { item in
              
                
                    HStack
                     {
                         
                         
                         RemoteImageView(url: item.imageUrl)
                            .clipShape(Rectangle())
                            .frame(width: 150, height: 80)
                            .scaledToFit()
                            .padding()
                           
                        VStack(alignment: .leading)
                        {
                         
                            Text(item.title)
                                .font(.custom("Arial", size: setFontType().0, relativeTo: .largeTitle)).bold()
                                   .frame(width: NewsListView.screenWidth * 0.40, height: 120)
                                .lineLimit(5)
                                .multilineTextAlignment(.leading)
                                .scaledToFit()
                            
                            Text(item.author)
                                .font(.custom("Arial Narrow", size: 15, relativeTo: .caption))
                                .frame(width:NewsListView.screenWidth * 0.40 , height: 40)
                                .multilineTextAlignment(.leading)
                                .scaledToFit()
                            
                        }
                         NavigationLink(destination: NewsDetailView(selectedNews: item))
                         {
                             
                         }
                         .navigationTitle("\(newsCatagory) news")
                     }
  
        }

        .onAppear(perform: loadData)
    }
    
    //returns a tuple
    public func setFontType() -> (CGFloat, CGFloat)
    {
        if UIDevice.current.localizedModel == "iPhone"
        {
            print("This is an iPhone")
            return (20, 10)
        }
        else if UIDevice.current.localizedModel == "iPad"
        {
            print("This is an iPad")
            return (30, 12)
        }
        return (20, 10)
    }
    
    
   
    func loadData()
    {
       
        let urlString = "https://inshortsapi.vercel.app/news?category=" + newsCatagory
        /*all
         national //Indian News only
         business
         sports
         world
         politics
         technology
         startup
         entertainment
         miscellaneous
         hatke
         science
         automobile*/
        
        guard let url = URL(string: urlString) else
        {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data
            {
                print(data)
                    if let responseDecoder = try? JSONDecoder().decode(NewsData.self, from: data)
                    {
                        DispatchQueue.main.async
                        {
                           
                            results = responseDecoder.data
                            NewsurlModel.newsurl = responseDecoder.data
                            UIApplication.shared.endEditing()
                            print(NewsurlModel.newsurl[0]) //print first news story
                            
                        }
                    }
            }
        }.resume()
        
        
    }

}



struct TrackList_Previews: PreviewProvider
{
    static var previews: some View
    {
       
        NewsListView(newsCatagory: "science")
            .environmentObject(SearchURLModel(sTerm: ""))
           
    }
}
