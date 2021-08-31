//
//  WeatherView.swift
//  Weather app
//
//  Created by Nathaniel Whittington on 8/1/21.
//

import SwiftUI

struct WeatherView: View {
   @EnvironmentObject var appData: AppData

   var body: some View {
      let city = appData.userData[appData.selectedCity]

      return ZStack {
         Image("clouds")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
         VStack {
            Text(city.name)
               .font(Font.system(size: 30))
            Text(appData.celsius ? city.temperatureCelsius : city.temperatureFahrenheit)
               .font(Font.system(size: 70))
            WeatherDataView(city: city)
            WeatherFeelsView(city: city, celsius: appData.celsius)
            Spacer()
         }.padding(.top, 80)
      }
   }
}
struct WeatherDataView: View {
   var city: CityViewModel

   var body: some View {
      Group {
         HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
               Text("Precipitation:")
               Text("Humidity:")
               Text("Wind:")
               Text("Pressure:")
               Text("Visibility:")
            }.frame(width: 120, alignment: .leading)

            VStack(alignment: .leading, spacing: 10) {
               Text(city.precipitation)
               Text(city.humidity)
               Text(city.wind)
               Text(city.pressure)
               Text(city.visibility)
            }.font(Font.body.weight(.semibold))
         }.padding()
      }
      .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
      .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
      .cornerRadius(15)
      .padding()
   }
}
struct WeatherFeelsView: View {
   var city: CityViewModel
   var celsius: Bool

   var body: some View {
      Group {
         HStack(alignment: .top, spacing: 0) {
            Text("Feels Like:")
               .frame(width: 120, alignment: .leading)
            Text(celsius ? city.feelsCelsius : city.feelsFahrenheit)
               .font(Font.body.weight(.semibold))
         }.padding()
      }
      .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
      .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
      .cornerRadius(15)
      .padding([.leading, .trailing])
   }
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View{
        WeatherView().environmentObject(AppData())
    }

}
