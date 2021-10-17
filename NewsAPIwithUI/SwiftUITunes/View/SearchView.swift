//
//  SearchView.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI

struct SearchView: View
{
    @State var newsCatagory:String = "science"
    @State var searchTerm: String
    
    @EnvironmentObject var searchModel: SearchURLModel
    
    var body: some View
    {
        
        NavigationView
        {
            VStack()
                {
                    Spacer()
                    HStack
                    {
                        Spacer()
                        Image("newslogo")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 300, height: 300, alignment: .center)
                             .padding()
                        Spacer()
                    }
                    Spacer()
                    
                        Text("News 📰")
                        .font(.custom("Marker Felt", size: 70))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.black)
                    
                    Text("WARNING: If you don’t read the newspaper, you’re uninformed. If you read the newspaper, you’re mis-informed. - Mark Twain")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    Spacer()
//                   TextField(
//                        "Search",
//                         text: $searchTerm)
//                    .textFieldStyle(RoundedBorderTextFieldStyle()
//                    )
//                    .multilineTextAlignment(.center)
//
//                   .onChange(of: searchTerm, perform: { value in
//
//                    searchModel.searchTerm = searchTerm
//
//                   })
//
//                   .padding()
//                   .padding()
                    //Spacer()
                   
                   
                    
                    HStack
                    {
                        NavigationLink(destination: NewsListView(newsCatagory: "science"))
                        {
                            Text("Science")
                                        .frame(minWidth: 0, maxWidth: 100)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(50)
                                        .font(.custom("Marker Felt", size: 30))
                        }
                        
                        NavigationLink(destination: NewsListView(newsCatagory: "world"))
                        {
                            Text("World")
                                        .frame(minWidth: 0, maxWidth: 100)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(50)
                                        .font(.custom("Marker Felt", size: 30))
                        }
                       
                    
                        NavigationLink(destination: NewsListView(newsCatagory: "technology"))
                        {
                           
                            Text("Tech")
                                        .frame(minWidth: 0, maxWidth: 100)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(50)
                                        .font(.custom("Marker Felt", size: 30))
                        }
//                        }
//                        
//                    NavigationLink(destination: TrackListView(newsCatagory: newsCatagory))
//                    {
//                       
//                    
//                    }
                        
                        
                    }
                    Spacer()
                    Spacer()
                        .navigationBarHidden(true)
                    
                }
                .background(Color.white)
                .ignoresSafeArea()
                
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
       
        
    
    }
  
   

}

struct SearchView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchView(searchTerm: "")
            .environmentObject(SearchURLModel(sTerm: ""))
    }
}
