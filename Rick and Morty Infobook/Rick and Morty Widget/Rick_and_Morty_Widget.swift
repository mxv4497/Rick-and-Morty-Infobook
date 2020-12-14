//
//  Rick_and_Morty_Widget.swift
//  Rick and Morty Widget
//
//  Created by MateoVicic on 12/13/20.
//

import WidgetKit
import SwiftUI
import Intents

struct WidgetView: View {
    var data: CharacterEntry
    
    private var character: WidgetCharacter {
        data.character
    }
    
    private var remoteImage: UIImage? {
        if let imageUrl = character.image ,
           let data = try? Data(contentsOf: imageUrl),
           let image = UIImage(data: data) {
            return image
        }

        return nil
    }
    
    var body: some View{
        HStack(spacing: 16){
            if let image = remoteImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.2,
                           height: UIScreen.main.bounds.width * 0.2)
                    .cornerRadius(12)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width * 0.2,
                           height: UIScreen.main.bounds.width * 0.2)
            }
            VStack(alignment: .leading, spacing: 8){
                let random = Int.random(in: 1..<4)
                Text("\(character.name)").font(.headline)
                Text("Did you know?").font(.subheadline)

                switch random{
                case 1:
                    Text("\(character.name)'s gender is \(character.gender)").font(.callout)
                case 2:
                    Text("\(character.name)'s specie is \(character.species)").font(.callout)
                case 3:
                    if character.type != "" {
                        Text("\(character.name)'s specie-type is \(character.type)").font(.callout)
                    } else {
                        Text("\(character.name) has no specie-type").font(.callout)
                    }
                    
                case 4:
                    Text("\(character.name) starred in \(character.episode.count) ").font(.callout)
                        + Text(character.episode.count == 1 ? "episode" : "episodes").font(.callout)

                default:
                    Text("This character is also pretty cool")
                }

            }
            
            Spacer()
        }.padding()
    }
}

@main
struct MainWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "Rick and Morty Characterbook", provider: CharacterProvider()) {data in
            WidgetView(data: data)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Rick and Morty Widget")
        .description("Displays character information.")
    }
}
