//
//  ListUtility.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 25/04/22.
//

import SwiftUI

struct ListHeaderText: View{
    var heading: String
    var body: some View{
        Text(heading).frame(width: 80, alignment: .leading).font(.subheadline).foregroundColor(Color.black)
    }
}

struct ListRowText: View{
    var value: String
    var body: some View{
        Text(value).frame(width: 80, alignment: .leading).font(.subheadline)
    }
}
