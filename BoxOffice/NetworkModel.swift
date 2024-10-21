import Foundation

struct Network {
    var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kobis.or.kr"
        components.path = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        components.queryItems = [
            URLQueryItem(name: "key", value: "82ca741a2844c5c180a208137bb92bd7"),
            URLQueryItem(name: "targetDt", value: "20241020")
        ]
        return components
    }()
    
    var url: URL? {
        return urlComponents.url
    }
    
}
