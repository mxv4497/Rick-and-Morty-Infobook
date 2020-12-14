//
//  CharacterPageViewModel.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/11/20.
//

import Foundation
import Combine

class EpisodePageViewModel: ObservableObject {

    @Published private(set) var page: EpisodePage? = nil
    var pageNum: Int = 1
    
    func nextPage() {
        if page?.info.next != nil {
            pageNum += 1
            load()
        }
    }
    
    func previousPage() {
        if page?.info.prev != nil {
            pageNum -= 1
            load()
        }
    }
    
    func returnPageNum() -> Int{
        return pageNum
    }
    

    private var cancellable: Set<AnyCancellable> = []

    init(){
        load()
    }
        
    func load() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode?page=\(pageNum)") else {
            
            print("invalid URL")
            return
        }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {(data,response,error) in
            do {
                if let d = data {
                    let decoder = JSONDecoder()
                    let decodedLists = try decoder.decode(EpisodePage.self, from: d)
                    DispatchQueue.main.async {
                        self.page = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print (error)
            }
            
        }.resume()
         
    }

}
