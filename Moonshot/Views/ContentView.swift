import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var showingGrid: Bool = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                if showingGrid {
                    Grid(missions: missions, astronauts: astronauts)
                        .padding([.horizontal, .bottom])
                } else {
                    ListView(missions: missions, astronauts: astronauts)
                        .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showingGrid = true
                    } label: {
                        Image(systemName: "square.grid.2x2")
                    }

                    Button {
                        showingGrid = false
                    } label: {
                        Image(systemName: "list.bullet")
                    }

                }
            }
            .background(.darkBackground)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

