//
//  CharacterPageView.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterPageView: View {
    @StateObject private var viewModel = CharacterPageViewModel()
    var favCharViewModel: FavoriteCharacterViewModel
    
    var hasPreviousPage: Bool{
        if viewModel.page?.info.prev == nil {
            return true
        } else {
            return false
        }
    }
    
    var hasNextPage: Bool{
        if viewModel.page?.info.next == nil {
            return true
        } else {
            return false
        }
    }
   
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing: 8){
                    VStack{
                        Button(action: {
                            // did tap
                            viewModel.previousPage()
                        }, label: {
                            Text("\(Image(systemName: "arrow.left")) Page \(viewModel.returnPageNum()-1)")
                        }).disabled(hasPreviousPage).isHidden(hasPreviousPage)
                        
                        Text("\(viewModel.page?.info.count ?? 0) characters")
                            .font(.callout)
                            .padding(.top)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Button(action: {
                            // did tap
                            viewModel.nextPage()
                        }, label: {
                            Text("Page \(viewModel.returnPageNum()+1) \(Image(systemName: "arrow.right"))")
                        }).disabled(hasNextPage).isHidden(hasNextPage)
                        
                        Text("\(viewModel.page?.info.pages ?? 0) pages")
                            .font(.callout)
                            .padding(.top)
                    }
                    
                }.padding()
                
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.page?.results ?? []) { character in
                            
                            NavigationLink(destination: CharacterDetail(favCharViewModel: favCharViewModel, character: character)){
                                CharacterRow(character: character)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarTitle(Text("Characters"))
                .edgesIgnoringSafeArea(.top)
                
            }
            
            Spacer()
        }
    }
}

struct CharacterRow: View{
    var character: Character
    
    var body: some View {
        HStack{
            WebImage(url: character.image)
                .resizable()
                .placeholder {
                    Rectangle().fill(Color.gray)
                }
                .indicator(.activity)
                .animation(.easeIn(duration: 0.5))
                .cornerRadius(12)
                .frame(width: 80, height: 80)
                .padding()
            
            VStack(alignment: .leading, spacing: 8){
                Text("\(character.name )").font(.body)
                Text("Status: \(character.status)").font(.callout)
            }.padding()
            Spacer()
            
        }.background(Color.skyBlue.opacity(0.05))
    }
}


struct CharacterDetail: View{
    var favCharViewModel: FavoriteCharacterViewModel
    var character: Character
    @State var refresh: Bool = false
    
    var body: some View {
        VStack (spacing: 16) {
            WebImage(url: character.image)
                .resizable()
                .placeholder {
                    Rectangle().fill(Color.gray)
                }
                .indicator(.activity)
                .animation(.easeIn(duration: 0.5))
                .cornerRadius(12)
                .frame(width: 200, height: 200)
                .padding()
           
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Name: \(character.name )")
                            .font(.headline)
                        
                        Text("Status: \(character.status )").font(.body)
                        
                        Text("Specie: \(character.species )").font(.body)
                        
                        if character.type != "" {
                            Text("Type: \(character.type )").font(.body)
                        }
                        
                        Text("Gender: \(character.gender )").font(.body)
                        
                        Text("Origin: \(character.origin.name )").font(.body)
                        
                        Text("Location: \(character.location.name )").font(.body)
                        
                        Text("Starred in \(character.episode.count) episode(s)").font(.body)
                    }
                    Spacer()
                }
                //Spacer()
                
            }.padding([.top, .leading, .trailing])
            
            Spacer()
            
            Button(action: {
                favCharViewModel.toggleBookmark(character: self.character)
            }) {
                Image(systemName: favCharViewModel.isBookmarked(character: character) ? "heart.fill" : "heart")
                    .padding()
                    .background(Color.white)
                    .foregroundColor( Color.pink)
                    .clipShape(Circle())
                    .shadow(radius: 8)
            }
            
            Spacer()
        }.navigationBarHidden(true)
        .lazyPop()
        

    }
}
