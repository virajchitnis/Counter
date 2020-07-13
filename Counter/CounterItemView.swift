//
//  CounterItemView.swift
//  Counter
//
//  Created by Viraj Chitnis on 7/13/20.
//  Copyright © 2020 Viraj Chitnis. All rights reserved.
//

import SwiftUI

struct CounterItemView: View {
    @ObservedObject var counter: Counter
    var saveCallBack: () -> Void
    
    var body: some View {
        VStack {
            Text("\(self.counter.name)")
                .font(.headline)
            Text("\(self.counter.description)")
                .foregroundColor(Color.gray)
            HStack {
                Button(action: {
                    self.counter.decrement(by: 1)
                    self.saveCallBack()
                }) {
                    Image(systemName: "minus.circle")
                }
                .font(.title)
                Text("\(self.counter.count)")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.horizontal)
                Button(action: {
                    self.counter.increment(by: 1)
                    self.saveCallBack()
                }) {
                    Image(systemName: "plus.circle")
                }
                .font(.title)
            }
        }
        .padding(.all)
    }
}

struct CounterItemView_Previews: PreviewProvider {
    static var previews: some View {
        CounterItemView(counter: Counter(name: "Counter Name"), saveCallBack: {})
    }
}
