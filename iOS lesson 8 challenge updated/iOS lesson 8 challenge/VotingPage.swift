//
//  VotingPage.swift
//  iOS lesson 8 challenge
//
//  Created by Jerro Lee on 28/8/23.
//

import SwiftUI

struct VotingPage: View {
    
    @State var alertShown = false
    @Binding var bindedCandidateInfo: [candidateInfo]
    
    var body: some View {
        VStack {
            Button {
                alertShown = true
            } label: {
                Text("VOTE")
            }
            .alert(Text("Vote for your new president!!"), isPresented: $alertShown) {
                ForEach($bindedCandidateInfo, id: \.self) { item in
                    Button {
                        item.votes.wrappedValue += 1
                    } label: {
                        Text(String(item.name.wrappedValue))
                    }
                }
                Button {
                    
                } label: {
                    Text("Cancel")
                }
            } message: {
                Text("Vote for your new president below")
            }
        }
    }
}

struct VotingPage_Previews: PreviewProvider {
    static var previews: some View {
        VotingPage(bindedCandidateInfo: .constant([candidateInfo(name: "", age: "", info: "", famousFor: "", nameChange: "")]))
    }
}

/*
 Picker("Your vote", selection: $prezOptions) {
     ForEach(prezOptions, id: \.self) { option in
         Text(option)
     }
 }
 .pickerStyle(.segmented)
 */
