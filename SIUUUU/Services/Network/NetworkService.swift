//
//  NetworkService.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import SwiftyJSON

final class NetworkService {
    func request(
        constant: NetworkConstant,
        completion: @escaping (Result<JSON, Error>) -> ()
    ) {
        let req = constant.request
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                // handle response
                if let data = data {
                    do {
                        let result = try JSON(data: data)
                        completion(.success(result))
                    } catch (let e) {
                        completion(.failure(e))
                    }
                }
            }
        }
        task.resume()
    }
}
