//
//  CoinAIError.swift
//  NetworkingCourse
//
//  Created by Yazan Ghunaim on 9/9/23.
//

import Foundation

enum CoinAPIError: Error {
case invalidData
case jsonParsingFailure
case requestFailed(description: String)
case invalidStatusCode(statusCode: Int)
case unknownError(error:Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid Data"
        case .jsonParsingFailure: return "Failed to parse JSON"
        case let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case let .unknownError(error): return "Unknown error: \(error.localizedDescription)"
        }
    }
}
