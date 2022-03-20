//
//  ContentView.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-03-20.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        TabView{
            Text("Hello World")
                .tabItem{
                    Image(systemName: "person")
                    Text("Home")
                }
        }
        TabView{
            Text("")
                .tabItem{
                    Image(systemName:"pencil")
                    Text("Quiz")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewController()
    }
}
