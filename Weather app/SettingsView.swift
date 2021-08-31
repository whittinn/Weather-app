//
//  SettingsView.swift
//  Weather app
//
//  Created by Nathaniel Whittington on 8/1/21.
//

import SwiftUI

struct SettingsView: View {
   @EnvironmentObject var appData: AppData
   @Binding var selected: Int
   var body: some View {
      ZStack {
         Image("seaside")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
         VStack {
            SettingsMeasurementView(celsius: $appData.celsius)
            SettingsCitiesView(selected: $selected)
         }.foregroundColor(Color.black)
      }
   }
}
struct SettingsMeasurementView: View {
   @Binding var celsius: Bool

   var body: some View {
      Group {
         HStack(alignment: .top, spacing: 0) {
            Button("Celsius") {
               self.celsius = true
            }.frame(maxWidth: .infinity)
            .padding()
            .background(celsius ? Color.yellow : Color.clear)
            .disabled(celsius)
                
            Button("Fahrenheit") {
               self.celsius = false
            }.frame(maxWidth: .infinity)
            .padding()
            .background(!celsius ? Color.yellow : Color.clear)
            .disabled(!celsius)
         }.padding()
      }
      .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
      .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.9))
      .cornerRadius(15)
      .padding()
   }
}
struct SettingsCitiesView: View {
   @EnvironmentObject var appData: AppData
   @Binding var selected: Int

   var body: some View {
      Group {
         VStack(alignment: .leading, spacing: 10) {
            Text("Select City")
               .font(.footnote)
            Button(appData.userData[0].name) {
               self.appData.selectedCity = 0
               self.selected = 0
            }
            Button(appData.userData[1].name) {
               self.appData.selectedCity = 1
               self.selected = 0
            }
            Button(appData.userData[2].name) {
               self.appData.selectedCity = 2
               self.selected = 0
            }
            Spacer()
         }.padding()
      }
      .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
      .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.9))
      .cornerRadius(15)
      .padding()
   }
}
struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView(selected: .constant(1)).environmentObject(AppData())
   }
}
