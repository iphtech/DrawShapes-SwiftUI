//
//  Utility.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 21/04/22.
//

import SwiftUI

struct CustomText: View{
    var text: String
    var fontSize: CGFloat = 25
    var color: Color = Color.white
    var body: some View{
        Text(text).font(Font.custom("", size: fontSize)).foregroundColor(color)
    }
}

struct CustomDecimalTextField: View {
    var color: Color = .gray
    @Binding var text: String
    var placeholder: String = ""
    var isDisable: Bool = false
    var width: CGFloat = 90

    var body: some View {
        #if os(macOS)
        TextField(placeholder, text: $text).textFieldStyle(RoundedBorderTextFieldStyle()).disabled(isDisable)
                .onChange(of: text) { cleanNum in
                    let filetered = cleanNum.filter {"0123456789-+*/.".contains($0)}
                    self.text = filetered
                }
                .frame(width:width)
        #else
        TextField(placeholder, text: $text).textFieldStyle(RoundedBorderTextFieldStyle()).disabled(isDisable).keyboardType(.decimalPad)
                .onChange(of: text) { cleanNum in
                    let filetered = cleanNum.filter {"0123456789-+*/.".contains($0)}
                    self.text = filetered
                }
                .frame(width:width)
        #endif
    }
}

struct CustomIconButton: View{
    var imageName: String
    var isDisabled: Bool = false
    var body: some View{
        Image(systemName: imageName).foregroundColor(isDisabled ? Color.white: Color.black).frame(width: 35, height: 35).background(isDisabled ? Color.gray.opacity(0.5): Color.white).cornerRadius(5).font(Font.custom("", size: 20))
    }
}

func hideKeyboard(){
#if os(iOS)
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
#endif
}

