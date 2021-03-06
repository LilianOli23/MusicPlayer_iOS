//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Lilian De Oliveira Silva on 10/05/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Text("MusicPlayer")
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                        .foregroundColor(.buttonColor)

                }
                HStack {
                    Spacer()
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                    Spacer()
                    Button(action: {
                        if self.count < 3 {
                            self.count += 1
                        } else {
                            self.count = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "forward.end").resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                    Spacer()
                }
            }
        }
        .onAppear() {
            let sound = Bundle.main.path(forResource: "song3", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
