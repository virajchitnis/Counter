//
//  CounterDashboardView.swift
//  Counter
//
//  Created by Viraj Chitnis on 7/13/20.
//  Copyright © 2020 Viraj Chitnis. All rights reserved.
//

import SwiftUI

struct CounterDashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Counter One")
                        .font(.headline)
                    Text("More info about the counter")
                        .foregroundColor(Color.gray)
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "plus.circle")
                        }
                        .font(.title)
                        Text("34")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .padding(.horizontal)
                        Button(action: {}) {
                            Image(systemName: "minus.circle")
                        }
                        .font(.title)
                    }
                }
                .padding(.all)
                VStack {
                    Text("Counter Two")
                        .font(.headline)
                    Text("More info about the second counter")
                        .foregroundColor(Color.gray)
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "plus.circle")
                        }
                        .font(.title)
                        Text("345")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .padding(.horizontal)
                        Button(action: {}) {
                            Image(systemName: "minus.circle")
                        }
                        .font(.title)
                    }
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
        }
    }
}

struct CounterDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDashboardView()
    }
}
