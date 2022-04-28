//
//  CircleListSection.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 24/04/22.
//

import SwiftUI

struct CircleListSection: View{
    @EnvironmentObject var viewModel: CircleViewModel

    var body: some View{
        
        VStack(alignment:.leading){
            List{
                Section(
                    header: HStack{
                        ListHeaderText(heading: "xPos")
                        ListHeaderText(heading: "yPos")
                        ListHeaderText(heading: "Radius")
                    }.listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                ){

                    ForEach(viewModel.circlesList, id: \.id){ item in
                        HStack{
                            ListRowText(value: item.xHolePos)
                            ListRowText(value: item.yHolePos)
                            ListRowText(value: item.radius)
                        }.padding(.leading, 8).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading).background(viewModel.selectedCircleId == item.id ? Color.blue : Color.white)
                            .listRowBackground(viewModel.selectedCircleId == item.id ? Color.blue : Color.white).foregroundColor(viewModel.selectedCircleId == item.id ? Color.white : Color.black.opacity(0.9))
                        
                        .onTapGesture {
                            if viewModel.selectedCircleId == item.id{
                                viewModel.selectedCircleId = ""
                            }else{
                                viewModel.selectedCircleId = item.id
                            }
                        }
                    }
                }
            }
                .background(Color.white.opacity(0.8)).clipShape(RoundedRectangle(cornerRadius: 12)).listStyle(.plain)
        }.frame(height: (CGFloat(viewModel.circlesList.count) * 20)+40 <= 160 ? CGFloat(viewModel.circlesList.count * 20 + viewModel.listHeaderHeight) : 160)
    }
}
