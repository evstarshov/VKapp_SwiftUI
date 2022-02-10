//
//  GroupsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        HStack {
            ImageBuilder{ Image("pepe")
            }
            Text("Клуб фанатов грустной жабы").fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
        }
    }
    
}


struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
            .previewInterfaceOrientation(.portrait)
    }
}
