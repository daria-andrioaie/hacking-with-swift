//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Daria Andrioaie on 21.07.2022.
//

import SwiftUI

/// structs are an element of performance over claases, so that is one of the reasons swiftUI uses structs for its views
/// also, they isolate state in a really clean way -> their are simpler to use
// swift u renders your view after every modifier

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct WaterMark:  ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct ContentView: View {
    @State private var useRedText = false
    var motto1: some View {
        Text("Motivating motto")
    }
    let motto2 = Text("Sad motto")
    
    // if you want to wrap several views inside a property, you have 3 options:
    
    // -- 1 -- putting them in a stack
    
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
            Text("Hocus Pocus")
        }
    }
    
    // -- 2 -- put them in a group
    // if you choose to put them in a group, the layout will depend on the acatual place that you put them in (inside a vstack, hstack or zstack)
    
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
            Text("Hocus Pocus")
        }
    }
    
    // -- 3 -- using the property wrapper @ViewBuilder, wrapping the view up in a TupleView
    // this is preffered over the other 2 options, but you must be aware to not cram up to much functionality inside a single view and try to break it into pieces as much as possible
    @ViewBuilder var spells3: some View {
        Text("Lumos")
        Text("Obliviate")
        Text("Hocus Pocus")
    }
    
    var body: some View {
        VStack{
            // modifier order matters
            Button("Hello, world!"){
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)
            .foregroundColor(.black)
            
            // conditional modifiers with the ternary operator
            
            // this is preferred over checking the condition inside the if and cretaing 2 different separate views, because it's more overhead for swiftui and that may be a problem in big applications
            Button("Hi"){
                useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            // environment modifiers are applied to a parent view and flow downwards to each of its children. Some environment modifiers can be overidden by the child modifier, so the inner-most modifier is taken into consideration, while others only add-up to the parent modifier, so you have to read the documentation to see how an actual modifier behaves attached to the child, over to the parent
            VStack {
                Button("Button1"){ }
                Button("Button2"){ }.foregroundColor(.blue)
            }
            .foregroundColor(.red)
            
            // environment modifiers help remove duplication
            VStack {
                Button("alala"){ }
                Button("ceqd"){ }.blur(radius: 20)
            }
            .blur(radius: 5)
            
            // views as properties
            
            // you can save a view as a property and you can use it inside other views just lik you would do normally
            // they avoid repetition and help keep the body property nice and clean
            // you cannot make a stored property depend on another property, unless they are computed properties
            VStack {
                motto1.foregroundColor(.blue)
                motto2.foregroundColor(.red)
            }
            
            // view composition
            // it is used to break up the view into smaller views
            VStack(spacing: 10) {
                CapsuleText(text: "first").foregroundColor(.yellow)
                CapsuleText(text: "second").watermarked(with: "Hacking with Swift")
            }
            
            // creating your own custom modifiers
            // 1. you make a new struct that conforms to the ViewModifier protocol
            // 2. inside the body fuction, you apply to the content all the modifiers that you mwant to add
            // 3. you can now append this modifier to any view with .modifier(MyModifier())
            
            // optionaly, you can create an extension on the view protocol with a function that wraps up your modifier, to make it simpler to call, just like any otehr modifier
            Text("This is a title").modifier(Title())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
