//
//  TrackList.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI

struct TrackListView: View
{

    
    @EnvironmentObject var searchModel: SearchURLModel
    @State var results = [NewsStory]()
    
    static let screenWidth = UIScreen.main.bounds.size.width
    var largeFontSize = 20
    var captionFontSize = 10
    
    var body: some View
    {
            List(results, id: \.author)
            { item in
                
                    HStack
                     {
                        
                         RemoteImageView(url: item.imageUrl)
                            .clipShape(Rectangle())
                            .frame(width: 80, height: 40)
            
                            .padding()
                           
                        VStack(alignment: .leading)
                        {
                         
                            Text(item.title)
                                .font(.custom("marker felt", size: setFontType().0, relativeTo: .largeTitle)).bold()
                                //.frame(width: TrackListView.screenWidth * 0.40, height: 50)
                                .multilineTextAlignment(.leading)
                                .scaledToFit()
                            
                            Text(item.author)
                                .font(.custom("zapfino", size: setFontType().1, relativeTo: .caption))
                                //.frame(width:TrackListView.screenWidth * 0.40 , height: 40)
                                .multilineTextAlignment(.center)
                                .scaledToFit()
                            
                        }
                         NavigationLink(destination: TrackDetailView())
                         {
                             
                         }
                         .navigationTitle("Tracks")
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
       
        let urlString = "https://inshortsapi.vercel.app/news?category=science"
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
                            UIApplication.shared.endEditing()
                            print(responseDecoder.data[0]) //print first news story
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
       
        TrackListView()
            .environmentObject(SearchURLModel(sTerm: ""))
           
    }
}
