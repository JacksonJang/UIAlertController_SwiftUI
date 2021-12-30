//
//  ContentView.swift
//  UIAlertController_SwiftUI
//
//  Created by 장효원 on 2021/12/30.
//

import SwiftUI

struct ContentView: View {
    @State var data: [String] = ["OK Alert", "OK And Cancel Alert", "Destructive And Cancel"]
    
    var body: some View {
        VStack {
            List{
                ForEach(0..<data.count){ number in
                    CustomListCell(name: data[number], index: number)
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
    var name:String
    var index:Int

    var body: some View {
        if index == 0 {
            showOKAlert()
        } else if index == 1 {
            showOKAndCancelAlert()
        } else if index == 2 {
            showDestructiveAndCancel()
        }
    }
    
    func showOKAlert() -> some View {
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
    
    func showOKAndCancelAlert() -> some View {
        Button("\(name)") {
                showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Title"), message: Text("Message"), primaryButton: .default(Text("OK"), action: {
                    
            }), secondaryButton: .cancel())
        }
    }
    
    func showDestructiveAndCancel() -> some View {
        Button("\(name)") {
                showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Title"), message: Text("Message"), primaryButton: .destructive(Text("Destructive"), action: {
                print("Destructive")
            }), secondaryButton: .cancel())
        }
    }
}
