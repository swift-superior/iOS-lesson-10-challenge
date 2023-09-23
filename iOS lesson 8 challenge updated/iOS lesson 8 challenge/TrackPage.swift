//
//  TrackPage.swift
//  iOS lesson 8 challenge
//
//  Created by Jerro Lee on 28/8/23.
//

import SwiftUI

struct TrackPage: View {
    
    @Binding var candidates: [candidateInfo]
    
    var body: some View {
        HStack {
            VStack {
                ForEach(candidates.indices, id: \.self) { name in
                    Text(candidates[name].name)
                }
            }
            VStack {
                ForEach(candidates.indices, id: \.self) { votes in
                    Text("\(candidates[votes].votes)")
                }
            }
        }
    }
}

struct TrackPage_Previews: PreviewProvider {
    static var previews: some View {
        TrackPage(candidates: .constant([candidateInfo(name: "", age: "", info: "", famousFor: "", nameChange: "", votes: 0)]))
    }
}

/*
 VStack {
     ForEach(candidates.indices, id: \.self) { item in
         HStack {
             Text(candidates[item].name)
         }
     }
     ForEach(candidates.indices, id: \.self) { item in
         HStack {
             Text(candidates[item].votes)
         }
     }
 }
 */
