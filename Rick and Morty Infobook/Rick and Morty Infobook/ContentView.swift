//
//  ContentView.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 0
    @State var characterURL = "https://rickandmortyapi.com/api/character"
    @StateObject var characterPageViewModel = CharacterPageViewModel()
    @StateObject var favCharacterViewModel = FavoriteCharacterViewModel()


    var isFirst: Bool {
        if selection != 0 {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        TabView (selection: $selection){
            
            CustomButtonPicker(selection: $selection)
                .tabItem({
                    Label("Infobook", systemImage: isFirst ? "info.circle.fill" : "info.circle")
                })
                .tag(0)

            CharacterPageView(favCharViewModel: favCharacterViewModel)
                .tabItem({
                    Label("Characters", systemImage: selection == 1 ? "person.fill" : "person")
                })
                .tag(1)

            LocationPageView()
                .tabItem({
                    Label("Locations", systemImage: selection == 2 ? "paperplane.fill" : "paperplane")
                })
                .tag(2)

            EpisodePageView()
                .tabItem({
                    Label("Episodes", systemImage: selection == 3 ? "clock.fill" : "clock")
                })
                .tag(3)

            Group{
                if favCharacterViewModel.favCharacters.count == 0 {
                    
                    VStack {
                        Spacer()
                        
                        Text("It feels so empty in this section...")
                        Text("")
                        
                        Text("Click here and start favoriting!")
                        Text("")
                        
                        Button(action: {
                            selection = 1
                        }, label: {
                            Label("Characters", systemImage: "person.fill")
                        })
                        .buttonStyle(MyButtonStyle(color: Color.skyBlue))
                     
                        Spacer()
                        
                    }
                    
                } else {
                    
                    ScrollView{
                        LazyVStack{
                            ForEach(favCharacterViewModel.favCharacters ) { character in
                                CharacterRow(character: character).onLongPressGesture {
                                    favCharacterViewModel.toggleBookmark(character: character)
                                }
                            }
                        }
                    }
                    
                }
            }
            .tabItem({
                Label("Favorite", systemImage: selection == 4 ? "star.fill" : "star")
            })
            .tag(4)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
