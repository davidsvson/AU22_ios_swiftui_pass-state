//
//  ContentView.swift
//  State-repetion
//
//  Created by David Svensson on 2023-01-12.
//

import SwiftUI

class Counter : ObservableObject {
    @Published var count : Int = 0
    
    func increase() {
        count += 1
    }
    
    func decrease() {
        count -= 1
    }
    
}



struct ContentView: View {
    
   // @State var count : Int = 0
    @State var isShowingCountSheet : Bool = false
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(counter.count)")
            Button(action: {
                counter.increase()
            }) {
                Text("click")
            }
            Spacer()
            Button(action: {isShowingCountSheet = true }, label: { Text("Sheet")})
        }
        .fullScreenCover(isPresented: $isShowingCountSheet) {
            CountSheet(counter: counter, isShowing: $isShowingCountSheet)
        }
    }
}

struct CountSheet : View {
  //  @Binding var count : Int
    @ObservedObject var counter : Counter
    @Binding var isShowing : Bool
    
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
            Button(action: {
                counter.decrease()
            }, label: {Text("click")})
            Button(action: {
                isShowing = false
            }, label: {Text("tillbaka")})
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
