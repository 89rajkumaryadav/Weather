//
//  HomeView.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 27/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeVM:HomeVM
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                
                ScrollView{
                    LazyVStack{
                        clearSkygroup
                        
                        txtLargeTempGroup
                        
                        grayBoxWindHumidityUV
                        
                        horizantalListOfTimeTemp
                            .padding(.horizontal,8)
                        
                        listWithDayDateAndTempCloud
                      //  Spacer()
                    }
                }
               
                
            }.frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
        }.onAppear {
            homeVM.getWeatherData()
        }
       
    }
    
    
    
    // Clear sky group design
    
    var clearSkygroup: some View{
        
        HStack{
            AsyncImage(url: URL(string: "https://openweathermap.org/img/w/\(homeVM.weatherIcon).png"))
                .frame(width: 40, height: 40, alignment: .leading)
                .padding()
               
            VStack(alignment:.leading ){
                Text(homeVM.mainWather)
                Text(homeVM.weatherDes)
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .fontWeight(.light)
            }
        }
        
    }
    
    // large titleTemp group
    var txtLargeTempGroup: some View {
        
        VStack{
            Text(homeVM.weTemprature)
                .font(Font.system(size: 90))
            
            Text(homeVM.feelsLike)
                .font(.footnote)
                .foregroundColor(.gray)
            
            Text("No precipitation within an hour")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.top,20)
                .padding(.bottom,5)
        }
        
    }
    
    
    //Gray box design of Wind, Humidity, UV index...
    
    var grayBoxWindHumidityUV: some View {
        
        VStack(alignment:.leading){
            
            HStack{
                HStack(spacing:2){
                    Text(homeVM.wind)
                        .font(Font.system(size: 12))
                        .fontWeight(.bold)
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .center)
            }
                Text(homeVM.humidity)
                    .font(Font.system(size: 12))
                    .fontWeight(.bold)
            
                Text(homeVM.UVIndex)
                    .font(Font.system(size: 12))
                    .fontWeight(.bold)
            
            }
            
            HStack{
                Text(homeVM.pressure)
                    .font(Font.system(size: 12))
                    .fontWeight(.bold)
                Text(homeVM.visibility)
                    .font(Font.system(size: 12))
                    .fontWeight(.bold)
                Text(homeVM.dewPoint)
                    .font(Font.system(size: 12))
                    .fontWeight(.bold)
                
            }
           
            
        }.padding()
            .background(Color.ui.lightGray)
            .cornerRadius(12)
            
        
    }
    
    
    
    //Vertical List Design of time with temratur
    
    var horizantalListOfTimeTemp: some View{
        
        ScrollView(.horizontal){
            LazyHStack(spacing:10){
              
                if (homeVM.hourleyList != nil){
                ForEach(homeVM.hourleyList!) { item in
                    CellTimeImageTemp(item: item)
                }
                }
              
                
            }
        }
    }
     
    
    
    // List deign day name with date and temp range, cloud
    
    var listWithDayDateAndTempCloud: some View {
       
        LazyVStack{
            
            ForEach(0..<20){ index in
                NavigationLink(destination: Text("ggggg")){
                    CellOfDayDateTemCloud()
                        .padding()
                }
            }
            
        }
       
    }
    
}




//MARK: Time Temp Weather Cell Design

struct CellTimeImageTemp:View{
    
    let item:HourlyVM
    var body: some View{
        
        VStack(spacing:8){
            Text(item.Time)
               
            Image(systemName: "cloud.moon")
                
            Text("23°C")
        }.foregroundColor(Color.black)
    }
}


struct CellOfDayDateTemCloud: View{
    var body: some View{
        HStack{
            Text("Mon Nov 29")
                .foregroundColor(.black)
            Spacer()
            
            Text("25/16 °C")
                .foregroundColor(.black)
            
            Image(systemName: "cloud.moon")
                .foregroundColor(.black)
            Image(systemName: "arrow.right")
                .foregroundColor(.gray)
            
            Divider()
            
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
       
        HomeView().environmentObject(HomeVM())
    }
}












