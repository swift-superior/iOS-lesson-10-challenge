//
//  InfoPage.swift
//  iOS lesson 8 challenge
//
//  Created by Jerro Lee on 28/8/23.
//

import SwiftUI

struct InfoPage: View {
    
 
    @State var infoShown = [false, false, false]
    @State var alertShown = false
    @State var deleteAlertShown = false
    @Binding var candidates: [candidateInfo]
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(candidates.indices, id: \.self) { item in
                        VStack {
                            HStack {
                                Button {
                                    if infoShown[item] == false {
                                        infoShown[item] = true
                                    } else {
                                        infoShown[item] = false
                                    }
                                } label: {
                                    Image(systemName: "person.fill")
                                }
                                Text(candidates[item].name)
                                    .multilineTextAlignment(.leading)
                                Menu {
                                    Button {
                                        alertShown = true
                                    } label: {
                                        Text("Name")
                                    }
                                    Button(role: .destructive) {
                                        deleteAlertShown = true
                                    } label: {
                                        Text("DELETE CANDIDATE")
                                    }
                                } label: {
                                    Image(systemName: "pencil")
                                }
                                .alert(Text("Change name of candidate"), isPresented: $alertShown) {
                                    TextField("Name", text: $candidates[item].nameChange)
                                    Button {
                                        candidates[item].name = candidates[item].nameChange
                                    } label: {
                                        Text("Ok")
                                    }
                                }
                                .alert(Text("DELETE CANDIDATE"), isPresented: $deleteAlertShown) {
                                    Button(role: .destructive) {
                                        candidates.remove(at: item)
                                    } label: {
                                        Text("DELETE")
                                    }
                                } message: {
                                    Text("Are you sure you want to delete this candidate?")
                                }
                            }
                            if infoShown[item] == true {
                                HStack {
                                    Text("Age:")
                                    TextField("Age", text: $candidates[item].age)
                                        .multilineTextAlignment(.leading)
                                }
                                HStack {
                                    Text("Special:")
                                    TextField("Special", text: $candidates[item].info)
                                        .multilineTextAlignment(.leading)
                                }
                                HStack {
                                    Text("Famous For:")
                                    TextField("Famous For", text: $candidates[item].famousFor)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                    }
                    Button {
                        candidates.append(candidateInfo(name: "", age: "", info: "", famousFor: "", nameChange: "", votes: 0))
                        infoShown.append(false)
                    } label: {
                        Image(systemName: "person.fill.badge.plus")
                    }
                } .navigationTitle("Canditates' info")
            }
        }
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage(candidates: .constant([candidateInfo(name: "", age: "", info: "", famousFor: "", nameChange: "", votes: 0)]))
    }
}


/*

 */
