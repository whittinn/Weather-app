//
//  ContentView.swift
//  Weather app
//
//  Created by Nathaniel Whittington on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedView : Int = 0
    var body: some View {
        TabView(selection: $selectedView){
            //assign binding property to selection attr
            WeatherView()
                .tabItem { Image(systemName: "sun.max")
                Text("Weather")
            }
            
                
            .tag(0)
            
            SettingsView(selected: $selectedView)
                .tabItem { Image(systemName: "gear")
            Text("Setting")
            }
          //apply tag modifier to to each with a unique value that helps the sys iden.
        }.tag(0)
        .edgesIgnoringSafeArea(.top)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
