//
//  ContentView.swift
//  Shared
//
//  Created by iPHTech39 on 21/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var lineViewModel = LineViewModel()
    @StateObject var circleViewModel = CircleViewModel()
    @StateObject var rectangleViewModel = RectangleViewModel()
    @StateObject var scaleFactor = ScaleFactor()
    
    var body: some View {
        BaseView().environmentObject(circleViewModel)
            .environmentObject(rectangleViewModel)
            .environmentObject(lineViewModel)
            .environmentObject(scaleFactor)
    }
}
