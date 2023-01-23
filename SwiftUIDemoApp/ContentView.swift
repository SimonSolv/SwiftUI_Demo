//
//  ContentView.swift
//  SwiftUIDemoApp
//
//  Created by Simon Pegg on 22.01.2023.
//

import SwiftUI

struct Universe: Identifiable {
    var id: ObjectIdentifier
    var name: String
}

struct ContentView: View {
    @State var isPushEnabled: Bool = false
    @State var speed = 10.0
    @State var editing = false
    @State var universe: Universe?
    var body: some View {
        Form(content: {
            Toggle(isOn: $isPushEnabled, label: {
                Text("Push notificaton")
            })
            Section(content: {
                Toggle(isOn: $isPushEnabled, label: {
                    Text("Push notificaton")
                })
                Toggle(isOn: $isPushEnabled, label: {
                    Text("Push notificaton")
                })
            })
            Slider(value: $speed, in: 0 ... 100) { editing in
                self.editing = editing
            }
            Text("\(Int((speed)))")
                .foregroundColor(speed > 60 ? .red : .black)
            Section {
                VStack {
                    Text("Какую вселенную выберешь?")
                        .frame(alignment: .center)
                }
                Button(action: {
                    universe = Universe(id: ObjectIdentifier(Any.Type.self), name: "Marvel")
                    print("\(universe!.name)")
                }, label: {
                    Text("Marvel")
                })
                Button(action: {
                    universe = Universe(id: ObjectIdentifier(Any.Type.self), name: "DC")
                    print("\(universe!.name)")
                }, label: {
                    Text("DC")
                })
                .alert(item: $universe) { universe in
                    Alert(title:
                            Text("Вы выбрали \(universe.name)"), dismissButton: .default(Text("Ok"))
                    )
                }
            }
 
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
