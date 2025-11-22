//
//  HeaderView.swift
//  fitlog
//
//  Created by 12345 on 22/11/2025.
//










import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("FitLog")
                .font(AppThemes.bold(30))
                .foregroundColor(AppThemes.textClr)
            
            
            Spacer()
            Image(systemName: "gear")
                .font(AppThemes.bold(30))
                .foregroundColor(AppThemes.textClr)
            
            
            
        }.padding()
     
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
