//
//  CharacterProvider.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/14/20.
//

import WidgetKit

struct CharacterProvider: TimelineProvider {
    typealias Entry = CharacterEntry

    func placeholder(in context: Context) -> Entry {
        CharacterEntry.preview
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = CharacterEntry.preview
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        getData { result in
            switch result {
                case .success(let char):
                    var entries: [Entry] = []
                    var entryDate = Date()
                    
                    if let nextUpdate = Calendar.current.date(byAdding: .second, value: 1, to: entryDate) {
                        entryDate = nextUpdate
                        entries.append(CharacterEntry(date: nextUpdate, character: char))
                    }
                    
                    

                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                   
                    
                    completion(timeline)
            
                case .failure(let error):
                    print(error)
                    completion(Timeline(entries: [], policy: .atEnd))
            }
        }
    }

    func getData(completion: @escaping (Result<WidgetCharacter, Error>) -> Void) {
        let randomNumber = Int.random(in: 1..<500)
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(randomNumber)") else {
            print("invalid URL")
            return
        }

        let urlTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                fatalError("Data is not accessible")
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let char = try decoder.decode(WidgetCharacter.self, from: data)
                completion(.success(char))
            } catch {
                completion(.failure(error))
            }
        }

        urlTask.resume()
    }
    
}
