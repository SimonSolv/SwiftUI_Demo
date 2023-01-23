//
//  CustomModifiers.swift
//  SwiftUIDemoApp
//
//  Created by Simon Pegg on 23.01.2023.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .padding(.horizontal, 20)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(.white)
            .background(Color("VKColor"))
            .cornerRadius(10)
            .padding([.leading, .trailing])
    }
}

struct FieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .frame(height: 40)
            .background(Color("LightGray"))
            
    }
}
