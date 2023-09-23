//
//  ContentView.swift
//  iOS lesson 8 challenge
//
//  Created by Jerro Lee on 28/8/23.
//

import SwiftUI
import SwiftPersistence

struct candidateInfo: Identifiable, Hashable, Codable {
    var name: String
    var age: String
    var info: String //will be a short paragraph
    var famousFor: String
    var nameChange: String
    var votes: Int = 0
    var id = UUID()
    
}

struct ContentView: View {
    
    @Persistent("candidateList") var candidateList: [candidateInfo] = [
        candidateInfo(name: "Rick Astley", age: "57", info: "Rickroll", famousFor: "Creating the best song - Never Gonna Give You Up", nameChange: "", votes: 0),
        candidateInfo(name: "Boe Jiden", age: "72", info: "Fall Down Attack", famousFor: "Falling down everything", nameChange: "", votes: 0),
        candidateInfo(name: "Tonald D. Rump", age: "64", info: "Being a meme", famousFor: "That mugshot", nameChange: "", votes: 0)]

    
    var body: some View {
        TabView {
            VotingPage(bindedCandidateInfo: $candidateList)
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Vote!")
                    }
                }
            TrackPage(candidates: $candidateList)
                .tabItem {
                    VStack {
                        Image(systemName: "cellularbars")
                        Text("Track votes")
                    }
                }
            InfoPage(candidates: $candidateList)
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill.questionmark")
                        Text("Candidate info")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
