//
//  ContentView.swift
//  SwiftUI_available
//
//  Created by kazunori.aoki on 2021/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    
//        AvailableIniOS16View() // iOS15以下だとErrorが出る
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Available {
    
    init() {
        
        if #available(iOS 15, *) {
            iOS15Later()
        } else { }
        
//        functionDeprecated() // Warningが出る
//        functionObsoleted()  // Errorが出る
//        functionOldName()    // Errorかつ、リプレイスが出る
    }
    
    @available(iOS 15, *)
    func iOS15Later() {
        print("iOS 15 later only")
    }
    
    @available(iOS, deprecated: 13, message: "We no longer fetch data this way from iOS13 and up")
    func functionDeprecated() {
        print("We no longer fetch data this way from iOS13 and up")
    }
    
    @available(iOS, deprecated: 13, obsoleted: 14,  message: "We no longer fetch data this way from iOS13 and up: use")
    func functionObsoleted() {
        print("We no longer fetch data this way from iOS13 and up: use iOS15Later insted")
    }
    
    @available(*, unavailable, renamed: "fetchData")
    func functionOldName() {
        print("'functionOldName()' has been renamed to 'fetchData'")
    }
}

@available(iOS 16, macOS 13, *)
struct AvailableIniOS16View: View {
    var body: some View {
        Text("Is only available in iOS 16 or newer")
    }
}
