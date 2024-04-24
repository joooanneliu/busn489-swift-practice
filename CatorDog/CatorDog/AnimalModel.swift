//
//  AnimalModel.swift
//  CatorDog
//
//  Created by Joanne Liu on 4/8/24.
//

import SwiftUI

// observable is for when you want the view to update when the object’s published properties change.
class AnimalModel: ObservableObject {
    @Published var animal = Animal()
    // @Published is one of the property wrappers in SwiftUI that allows us to trigger a view redraw whenever changes occur. You can use the wrapper combined with the ObservableObject protocol, but you can also use it within regular classes.


    
    func getAnimal() {
        let stringUrl = Bool.random() ? catUrl: dogUrl
        // 1. create a url object
        let url = URL(string:stringUrl)
        
        // 2. check if url is not nil
        guard url != nil else {
            print("Couldn't create the url object")
            return
        }
        // 3. get the url session
        let session = URLSession.shared
        
        // 4. create a data task
        let dataTask = session.dataTask(with: url!)
        {(data, response, error) in
            // check for error
            if error == nil && data != nil {
                do{
                    // parses data into json
                    if let json = try
                        JSONSerialization.jsonObject(with: data!,
                                                     options: []) as? [[String: Any]] {
                        
                        // if we have got so far, the json has been pared
                        let item = json.isEmpty ? [:] : json[0]
                        // json gives us the first response
                        
                        if let animal = Animal(json: item) {
                            DispatchQueue.main.async {
                                // wait until results is not empty
                                while animal.results.isEmpty {
                                    
                                }
                                self.animal = animal
                            }
                        }
                    } // end of try
                } catch {
                    print("could not parse JSON")
                }
            }
        }
        
        // 5. start the data task
        dataTask.resume()
    }
}
