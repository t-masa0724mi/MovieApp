import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
        
            .onAppear {
                HTTPClient().getMoviesBy(search: "batman") { result in
                    switch result {
                    case .success(let movies):
                        print(movies as Any)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
