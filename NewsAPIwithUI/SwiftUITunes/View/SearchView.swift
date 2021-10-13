//
//  SearchView.swift
//  SwiftUITunes
//
//  Created by lake on 9/20/21.
//

import SwiftUI

struct SearchView: View
{
    
    @State var searchTerm: String
    
    @EnvironmentObject var searchModel: SearchURLModel
    
    var body: some View
    {
        
        NavigationView
        {
            VStack(alignment: .leading)
                {
                    
                   TextField(
                        "Search",
                         text: $searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle()
                    )
                    .multilineTextAlignment(.center)
                
                   .onChange(of: searchTerm, perform: { value in
        
                    searchModel.searchTerm = searchTerm
                    
                   })
                    
                   .padding()
                   .padding()
                    //Spacer()
                   
                    NavigationLink(destination: TrackListView())
                    {
                        let width = UIScreen.main.bounds.width
                       
                        Text("Search")
                                    .frame(minWidth: 0, maxWidth: width)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(40)
                                    .font(.title)
                    }
                    Spacer()
                    Spacer()
                        .navigationBarHidden(true)
                    
                }
                .background(Color.gray)
                
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
