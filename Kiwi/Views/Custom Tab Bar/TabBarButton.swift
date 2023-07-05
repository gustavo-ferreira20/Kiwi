//
//  TabBarButton.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        GeometryReader{ geo in
            
            if isActive {
                
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
            }
            
            VStack ( alignment: .center, spacing: 4){
                Image(systemName: isActive ? imageName + ".fill" : imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isActive ? .green : .gray)
                Text(buttonText)
                    .font(isActive ? .custom("Montserrat-Black", size: 12) : .custom("Montserrat-SemiBold", size: 12)) 
                    .foregroundColor(isActive ? .green : .gray)
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }

    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Overview", imageName: "network", isActive: true)
    }
}
