//
//  TriviaService.swift
//  Trivia
//
//  Created by 윤다영 on 3/18/24.
//

import Foundation

enum TriviaService {
    static func getQuestion(status: @escaping ([TriviaQuestion]) -> Void) {
        let url = URL(string: "https://opentdb.com/api.php?amount=5&category=32")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ResponseObject.self, from: data!)
                DispatchQueue.main.async {
                    status(response.results)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
