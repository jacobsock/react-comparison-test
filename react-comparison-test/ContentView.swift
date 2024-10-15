//
//  ContentView.swift
//  react-comparison-test
//
//  Created by Jacob M Sock  on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var elevatedStateButton1Count = 0
    @State var elevatedStateButton2Count = 0
    @State var elevatedSharedStateButtonCount = 0
    
    var body: some View {
        VStack {
            Text("Counters that illustrating state patterns:")
                .font(.title)
                .padding()
            
            SelfContainedStateButton1()
            SelfContainedStateButton2()
            ElevatedStateButton1(count: $elevatedStateButton1Count)
            ElevatedStateButton2(count: $elevatedStateButton2Count)
            HStack{
                ElevatedSharedStateButton(count: $elevatedSharedStateButtonCount)
                ElevatedSharedStateButton(count: $elevatedSharedStateButtonCount)
            }

        }
    }
}

///Example of how state can be contained within the button as in react
struct SelfContainedStateButton1: View {
    @State private var count = 0

    var body: some View {
        Button(action: {
            count += 1
        }) {
            Text("Clicked \(count) times")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

///Example of how state can be contained within the button as in react
struct SelfContainedStateButton2: View {
    @State private var count = 0

    var body: some View {
        Button(action: {
            count += 10
        }) {
            Text("Clicked \(count) times")
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
///Example of how state can be elevated to parent as expected in SwiftUI
struct ElevatedStateButton1: View {
    @Binding  var count : Int

    var body: some View {
        Button(action: {
            count += 1
        }) {
            Text("Clicked \(count) times")
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
///Example of how state can be elevated to parent as expected in SwiftUI
struct ElevatedStateButton2: View {
    @Binding  var count : Int

    var body: some View {
        Button(action: {
            count += 10
        }) {
            Text("Clicked \(count) times")
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

//Example of how state can be elevated cause saming changes among subviews, similar to React.
struct ElevatedSharedStateButton: View {
    @Binding  var count : Int

    var body: some View {
        Button(action: {
            count += 5
        }) {
            Text("Clicked \(count) times")
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}




#Preview {
    ContentView()
}
