//
//  ContentView.swift
//  StarWarsDemo
//
//  Created by Danilo Osorio on 12/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var vm = StarCardVM()
    
    var body: some View {
        List {
            ForEach(vm.cards) { card in
                StarCardView(card: card)
            }
        }
    }
}

#Preview {
    //ContentView(vm:StarCardVM(repository: RepositoryTest())) // way to load test file
    ContentView()// way to load production file
}
