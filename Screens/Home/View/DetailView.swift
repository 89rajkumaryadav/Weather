//
//  DetailView.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 03/12/21.
//

import Foundation
import SwiftUI



struct DetailView:View{
    
    
    
    
    var body: some View{
        
        GeometryReader{ geometry in
            
            VStack{
                HorizantalDateWeekList
                    .frame(width: geometry.size.width , height: 50, alignment: .center)
                Divider()
                graphHeader
                
                
                
            }
            
        }
    }
    
    
    var HorizantalDateWeekList: some View{
        
        ScrollView(.horizontal){
            LazyHStack{
                
                ForEach(0..<9){ index in
                    Spacer()
                    dateWeelCell
                    Spacer()
                }
                
            }
        }.padding(.horizontal)
        
    }
    
    var dateWeelCell:some View{
        VStack{
            Text("Fri")
                .foregroundColor(.gray)
            Text("03")
                .foregroundColor(.black)
        }
    }
    
    
    var graphHeader:some View {
        HStack{
            VStack(alignment: .leading){
                Text("Overcast clouds")
                    .fontWeight(.semibold)
                Text("Light breeze")
                    .font(Font.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }.padding(.horizontal)
            
            Spacer()
            
            
            Text("22 / 18°c")
            
            Image(systemName: "cloud.moon")
                .padding(.trailing)
        }
    }
    
    
    /*    var verticalListOfContent{
     
     LazyVStack{
     
     ForEach
     
     }
     
     }*/
    
    
}




struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

