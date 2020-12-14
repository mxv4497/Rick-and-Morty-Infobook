//
//  LocationPageView.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/12/20.
//

import SwiftUI

struct LocationPageView: View {
    @StateObject private var viewModel = LocationPageViewModel()
    
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
                            viewModel.previousPage()
                        }, label: {
                            Text("\(Image(systemName: "arrow.left")) Page \(viewModel.returnPageNum()-1)")
                        }).disabled(hasPreviousPage).isHidden(hasPreviousPage)
                        
                        Text("\(viewModel.page?.info.count ?? 0) locations")
                            .font(.callout)
                            .padding(.top)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Button(action: {
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
                        ForEach(viewModel.page?.results ?? []) { location in
                            LocationRow(location: location)
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

struct LocationRow: View{
    var location: Locations
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8){
                Text("Location name: \(location.name )")
                Text("Dimension: \(location.dimension)")
                Text("Type: \(location.type)")
                Text("Holds: \(location.residents.count) resident(s)")
            }.padding()
            Spacer()
        }.background(Color.rose.opacity(0.1))
    }
}

