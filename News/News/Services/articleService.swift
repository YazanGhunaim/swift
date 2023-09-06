import Foundation

struct ArticleService {
    
    enum FetchError: Error {
        case invalidURL
        case invalidData
        case decodingError
    }
    
    func fetchNewsArticles() async -> Result<NewsResponse, Error> {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=245a959b5a6b4b6c84c02339f68d0a83") else {
            return .failure(FetchError.invalidURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            return .success(decodedResponse)
        } catch {
            return .failure(error)
        }
    }
}
