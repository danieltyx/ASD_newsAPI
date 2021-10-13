//
//  ContentView.swift
//  SwiftUITunes
//
//  Created by lake on 9/16/21.
//

import SwiftUI



struct ContentView: View
{
    
    @State private var searchTerm: String = ""
 
    
    var body: some View
    {
        SearchView(searchTerm: "")
    }
  

}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group
        {
            ContentView()
                .environmentObject(SearchURLModel(sTerm: ""))
        }
            
            
    }
}


extension UIApplication
{
    func endEditing()
    {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
   
}

