//
//  ContentView.swift
//  SwiftuiGrid
//
//  Created by Mac on 10/03/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
         Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {

    @State var languages:[Language] = [
        Language(id: 0, langauge: "ENGLISH"),
        Language(id: 1, langauge: "FRANCH"),
        Language(id: 3, langauge: "SPANSIH"),
        Language(id: 4, langauge: "URDU"),
        Language(id: 5, langauge: "HINDI"),
        Language(id: 6, langauge: "ARABIC"),
        Language(id: 7, langauge: "JAPANIS"),

                    ]
    @Namespace var namespace
    @State var selected:[Language] = []

    var columns = Array(repeating: GridItem(.flexible(),spacing: 15.0), count: 3)
    var body: some View {
        NavigationView {
            ScrollView{

                //spacing verticall
                if !languages.isEmpty {
                    LazyVGrid(columns:columns,spacing: 15.0){

                        ForEach(languages){
                            langauge in
                            Text(langauge.langauge)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 100)
                                .background(.blue)
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: langauge.id, in: self.namespace)
                                .onTapGesture {
                                    self.selected.append(langauge)
                                    self.languages.removeAll() { (lang) ->Bool
                                          in
                                        if lang.id == langauge.id{
                                          return  true
                                        }else{
                                            return    false
                                        }
                                    }
                                }
                        }

                    }
                    .padding(.all)
                }
                //selected languafe
            HStack{
                Text("Selected language")
                    .fontWeight(.bold)
                    .font(.title)

                Spacer()

            }.padding(.horizontal)

                // selection spacing verticall
                LazyVGrid(columns:columns,spacing: 15.0){

                    ForEach(selected){
                        langauge in
                        Text(langauge.langauge)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 100)
                            .background(.green)
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: langauge.id, in: self.namespace)
                            .onTapGesture {
                                 self.languages.append(langauge)
                                self.selected.removeAll(){(lang) ->
                                    Bool
                                    in
                                    if lang.id == langauge.id{
                                        return true

                                    }else{
                                        return false
                                    }

                                }
                            }
                    }

                }
                .padding(.all)


            }
            .navigationTitle("Choose languge")
            .navigationBarTitleDisplayMode(.inline)

        }.animation(.easeOut)

    }
}

//MARK: - Model for languages




struct Language:Identifiable{
    var  id :Int
    var langauge:String
}
