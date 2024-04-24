//
//  Animal.swift
//  CatorDog
//
//  Created by Joanne Liu on 4/8/24.
//

import SwiftUI

import CoreML
import Vision

struct Results: Identifiable{
    var imageLabel: String
    var confidence: Double
    var id = UUID() // use instance of time to generate id
}

class Animal {
    // url for the image
    var imageUrl:String
    // image data
    var imageData:Data?
    // results of classifier
    var results: [Results]
    
    // access to mobilenettv2
    let modelFile = try! MobileNetV2(configuration: MLModelConfiguration())
    
    init() {
        self.imageUrl = ""
        self.imageData = nil
        self.results = []
    }
    
    // initialize json
    // input string URL, extra json elements in the input?
    init?(json:[String: Any]) {
        // check for URL
        guard let imageUrl = json["url"] as? String else {
            return nil
        }
        
        self.imageUrl = imageUrl
        self.imageData = nil
        self.results = []
        
        // download image
        getImage()
        
    }
    
    func getImage() {
        // 1. create the url object
        let url = URL(string: imageUrl)
        
        // 2. check that the url is not nil
        guard url != nil else {
            print("could not return url object")
            return
        }
        
        // 3. get a url session
        let session = URLSession.shared
        
        // 4. create a URLSessionDataTask
        let dataTask = session.dataTask(with: url!)
        {(data, response, error) in
            // we do not have to parse the data; it's already available
            // we alr got it in the AnimalModel class
            if error == nil && data != nil {
                self.imageData = data
                // classifcation call made here
                self.classifyAnimal()
            }
        }
        
        // 5. start a datatask
        dataTask.resume()
        
    }
    
    func classifyAnimal() {
        // 1. getting a reference (e.g.
        // any request for third party models you download from online
        // has to go through VNCoreML Model
        // If untested, would not be identified in modelFile?
        let model = try! VNCoreMLModel(for: modelFile.model)
        // 2. getting image handler
        let handler = VNImageRequestHandler(data: imageData!)
        // 3. creating a request
        let request = VNCoreMLRequest(model: model) {
            (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                print("Could not classify the animal.")
                return
            }
            // question mark is there after as so it can be nil
            
            // update the results: if you're here, classification worked and results was produced
            for classification in results {
                // label for image
                var identifier = classification.identifier
                identifier = identifier.prefix(1).capitalized + identifier.dropFirst() // drops the first element in the identifier, makes the label capitalized instead
                
                self.results.append(Results(imageLabel: identifier, confidence: Double(classification.confidence)))
                
            }
        }
    
        // 4. execute the request
        // try catch is used BEFORE we initialize any functions, for something very basic
        // do-catch for AFTER important functions
        do {
            try handler.perform([request])
        } catch {
            print("Invalid Image")
        }
    }
    
}
