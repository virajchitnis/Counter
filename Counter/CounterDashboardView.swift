//
//  CounterDashboardView.swift
//  Counter
//
//  Created by Viraj Chitnis on 7/13/20.
//  Copyright © 2020 Viraj Chitnis. All rights reserved.
//

import SwiftUI

struct CounterDashboardView: View {
    @State private var counters: [Counter] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(counters, id: \.id) { counter in
                    CounterItemView(counter: counter)
                }
                .padding(.all)
                Button(action: {}) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Counter")
                    }
                }
            }
            .navigationBarTitle("Counters")
        }.onAppear(perform: loadCounters)
    }
    
    func loadCounters() {
        let newCounters = [
            Counter(name: "Blah 1", description: "First counter for trial"),
            Counter(name: "Blah 2")
        ]
        self.counters = newCounters
    }
}

struct CounterDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDashboardView()
    }
}
