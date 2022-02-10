//
//  FriendsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI


struct FriendsView: View {
    var body: some View {

        HStack {
            ImageBuilder{ Image("marina")
            }
            Text("Марина").fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
            Text("Сергеева").fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
        }
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
            .previewInterfaceOrientation(.portrait)
    }
}
