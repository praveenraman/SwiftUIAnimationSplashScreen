//
//  ContentView.swift
//  DemoAppSwiftUI
//
//  Created by iOS Developer on 25/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    var body: some View {
      // SplashScreen()
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 20){
                    
                    Image("bgimage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 480)
                        .cornerRadius(15)
                    
                    Text("I Papars Gallery")
                        .font(.title.bold())
                }
                .padding()
            }
            .navigationTitle("Latest")
        }
        
        // Use Overlay since ZStack having issue with animation...
        
        .overlay(SplashScreen())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
