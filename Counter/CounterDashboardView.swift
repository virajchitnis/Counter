//
//  CounterDashboardView.swift
//  Counter
//
//  Created by Viraj Chitnis on 7/13/20.
//  Copyright © 2020 Viraj Chitnis. All rights reserved.
//

import SwiftUI

let iCloudContainerIdentifier: String = "iCloud.com.virajchitnis.Counter"
let plistFile: String = "counters.plist"

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
                    CounterItemView(counter: counter, saveCallBack: self.saveCountersToFile)
                        .frame(maxWidth: .infinity)
                        .contextMenu {
                            Button(action: {
                                self.counters.removeAll(where: { $0.id == counter.id })
                                self.saveCountersToFile()
                            }) {
                                HStack {
                                    Image(systemName: "trash")
                                    Text("Delete")
                                }
                            }
                        }
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
                    .frame(maxWidth: .infinity)
                } else {
                    Button(action: {
                        self.addCounter = !self.addCounter
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Counter")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitle("Counters")
        }.onAppear(perform: readCountersFromFile)
    }
    
    func readCountersFromFile() {
        let documentsPath = (FileManager.default.url(forUbiquityContainerIdentifier: iCloudContainerIdentifier)?.appendingPathComponent("Documents"))!
        let path = documentsPath.appendingPathComponent(plistFile)
        do {
            let xmlData = try Data(contentsOf: path)
            let savedCounters: [CodableCounter] = try! PropertyListDecoder().decode(CodableCounters.self, from: xmlData)
            var newCounters: [Counter] = []
            for counter in savedCounters {
                let newCounter = Counter(id: counter.id, name: counter.name, description: counter.description, count: counter.count)
                newCounters.append(newCounter)
            }
            self.counters = newCounters
        } catch {
            print("No saved counters found")
        }
    }
    
    func saveCountersToFile() {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let documentsPath = (FileManager.default.url(forUbiquityContainerIdentifier: iCloudContainerIdentifier)?.appendingPathComponent("Documents"))!
        let path = documentsPath.appendingPathComponent(plistFile)
        var tempCounters: [CodableCounter] = []
        for currCounter in self.counters {
            let newCurrCounter = CodableCounter(id: currCounter.id, name: currCounter.name, description: currCounter.description, count: currCounter.count)
            tempCounters.append(newCurrCounter)
        }
        do {
            let data = try encoder.encode(tempCounters)
            try data.write(to: path)
        } catch {
            print(error)
        }
    }
    
    func addNewCounter() {
        if !self.newCounterName.isEmpty {
            let newCounter = Counter(name: self.newCounterName, description: self.newCounterDescription, count: Int(self.newCounterCount) ?? 0)
            self.newCounterName = ""
            self.counters.append(newCounter)
            self.saveCountersToFile()
        }
        self.newCounterCount = ""
        self.newCounterDescription = ""
        self.addCounter = !self.addCounter
    }
}

struct CounterDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDashboardView()
    }
}
