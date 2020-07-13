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
    @State private var addCounter: Bool = false
    @State private var newCounterName: String = ""
    @State private var newCounterDescription: String = ""
    @State private var newCounterCount: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(counters, id: \.id) { counter in
                    CounterItemView(counter: counter)
                        .frame(maxWidth: .infinity)
                }
                .padding(.all)
                if self.addCounter {
                    VStack {
                        TextField("Name", text: $newCounterName)
                            .multilineTextAlignment(.center)
                        TextField("Description (optional)", text: $newCounterDescription)
                            .multilineTextAlignment(.center)
                        TextField("Starting amount", text: $newCounterCount)
                            .keyboardType(.numberPad)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .multilineTextAlignment(.center)
                        Button(action: addNewCounter) {
                            Text("Done")
                        }
                    }
                } else {
                    Button(action: {
                        self.addCounter = !self.addCounter
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Counter")
                        }
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
    
    func addNewCounter() {
        if !self.newCounterName.isEmpty && !self.newCounterCount.isEmpty {
            let newCounter = Counter(name: self.newCounterName, description: self.newCounterDescription, count: Int(self.newCounterCount) ?? 0)
            self.newCounterName = ""
            self.newCounterCount = ""
            self.counters.append(newCounter)
        }
        self.newCounterDescription = ""
        self.addCounter = !self.addCounter
    }
}

struct CounterDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDashboardView()
    }
}
