//
//  ContentView.swift
//  MadenTurkiye
//
//  Created by omer sanli on 22.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var gram : Json4Swift_Base?
    @State var gramAlis = ""
    
    
    var body: some View {
    
        
        VStack{
            
            Text(gram?.gA?.alis ?? "Değer")



        }.onAppear(perform: loadData)

    }
    private func loadData(){
        let url = URL(string: "https://api.genelpara.com/embed/altin.json")
         URLSession.shared.dataTask(with: url!) { data, response, error in
             guard let data = data else{return}
             if let decodedData = try? JSONDecoder().decode(Json4Swift_Base.self, from: data){
                 DispatchQueue.main.async {
                     self.gram = decodedData
                     gramAlis = self.gram?.gA?.alis ?? "44"
                 }
                
                 
             }
             

        }
        .resume()
    }
        

    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
