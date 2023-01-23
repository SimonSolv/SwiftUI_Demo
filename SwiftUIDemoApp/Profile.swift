//
//  Profile.swift
//  SwiftUIDemoApp
//
//  Created by Simon Pegg on 22.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isPushEnabled: Bool = false
    @State var speed = 10.0
    @State var editing = false
    @State var universe: Universe?
    
    @State var username = ""
    
    @State var password = ""
    
    @FocusState var emailFieldIsFocused: Bool
    
    var body: some View {
        
        TabView {
            VStack {
                
                Image("VKlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .offset(y: 200)
                
                VStack(alignment: .center, spacing: 20) {
                    VStack(spacing: 0) {
                        TextField(
                            "User name (email address)",
                            text: $username
                        )
                        .focused($emailFieldIsFocused)
                        .onSubmit {
                            //        validate(name: username)
                        }
                        .modifier(FieldModifier())
                        
                        Divider()
                            .border(Color.gray, width: 2)
                        
                        TextField(
                            "Password",
                            text: $password
                        )
                        .focused($emailFieldIsFocused)
                        .onSubmit {
                            //        validate(name: username)
                        }
                        .modifier(FieldModifier())
                        
                    }
                    .background(Color.clear)
                    .border(Color.gray, width: 2)
                    .cornerRadius(15)
                    
                    .padding([.leading, .trailing])
                    .clipped()
                    
                    
                    Button(action: {
                        print("Login button tapped")
                    }, label: {
                        Text("Log in")
                            .foregroundColor(Color.white)
                    })
                    .modifier(ButtonModifier())
                    Spacer()
                }
                .padding()
                .offset(y: 300)
                Spacer()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
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
            .tabItem {
                Image(systemName: "bookmark.circle.fill")
                Text("Bookmark")
            }
            HStack{
                Text("Video Tab")
                    .modifier(Title())
                Text("Video Tab")
                    .modifier(Regular())
            }
            .tabItem {
                Image(systemName: "video.circle.fill")
                Text("Video")
            }
        }
        
        
    }
    
}

struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
