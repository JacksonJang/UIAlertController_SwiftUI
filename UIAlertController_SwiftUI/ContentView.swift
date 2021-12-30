//
//  ContentView.swift
//  UIAlertController_SwiftUI
//
//  Created by 장효원 on 2021/12/30.
//

import SwiftUI

struct ContentView: View {
    @State var data: [String] = ["OK Alert", "OK And Cancel Alert", "ALL Alert", "OK ActionSheet", "OK And Cancel ActionSheet", "ALL ActionSheet"]
    
    var body: some View {
        VStack {
            List{
                ForEach(0..<data.count){ number in
                    CustomListCell(name: data[number])
                }
            }.listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomListCell: View {
    @State private var showAlert = false
    var name: String

    var body: some View {
        Button("\(name)") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Title"),
                    message: Text("Message")
                )
            }
    }
}
