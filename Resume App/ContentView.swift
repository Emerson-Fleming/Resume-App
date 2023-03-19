import SwiftUI
import UIKit

struct ContentView: View {
    @State var currentTab: Int = 0
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {
        VStack {
            Spacer()
            TabView(selection: self.$currentTab) {
                View1().tag(0)
                View2().tag(1)
                View3().tag(2)
                View4().tag(3)
                View5().tag(4)
                View6().tag(5)
                View7().tag(6)
            }
            //.tabViewStyle(.page)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.bottom, 10) // add bottom padding to make room for tab bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    TabBarView(currentTab: $currentTab)
                        .frame(height: 25) // adjust height as needed
                        .offset(x: dragOffset.width)
                        .gesture(
                            DragGesture().updating($dragOffset, body: { (value, state, _) in
                                state = value.translation
                            }).onEnded({ (value) in
                                if value.predictedEndTranslation.width < -50 {
                                    currentTab += 1
                                    if currentTab > 6 {
                                        currentTab = 6
                                    }
                                }
                                if value.predictedEndTranslation.width > 50 {
                                    currentTab -= 1
                                    if currentTab < 0 {
                                        currentTab = 0
                                    }
                                }
                            })
                        )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
        //.edgesIgnoringSafeArea(.bottom) // ignore bottom safe area to move tab bar to bottom
    }
}


struct TabBarView: View{
    var tabBarOptions: [String] = ["Who Am I?", "Work Experience", "Projects", "Education", "Skills", "Achievements", "Links"]
    @Binding var currentTab: Int
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 20){
                ForEach(Array(zip(self.tabBarOptions.indices,self.tabBarOptions)), id: \.0) { index, name in
                    TabBarItem(currentTab: $currentTab, tabName: name, tab: index)
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct TabBarItem: View{
    @Binding var currentTab: Int
    var tabName: String
    var tab: Int
    var body: some View{
        Button(action: {
            self.currentTab = self.tab
        }) {
            VStack{
                Spacer()
                Text(tabName)
            }
        }
        .foregroundColor(currentTab == tab ? .blue : .gray)
    }
}

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
        ContentView()
     }
 }
