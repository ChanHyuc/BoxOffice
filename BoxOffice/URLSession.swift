import Foundation

struct URLSession {
    func fetchDailyBoxOffice(targetDate: String, apiKey: String) async throws -> [DailyBoxOffice] {
        // URL 생성
        guard let url = URL(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=\(targetDate)") else {
            throw URLError(.badURL)
        }
        
        // 네트워크 요청
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // JSON 디코딩
        let response = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
        return response.boxOfficeResult.dailyBoxOfficeList
    }
    
    // 호출 예시
    Task {
        do {
            let apiKey = "발급받은_API_키"
            let targetDate = "20241017" // 조회할 날짜
            
            let boxOfficeList = try await fetchDailyBoxOffice(targetDate: targetDate, apiKey: apiKey)
            
            // 결과 출력
            for movie in boxOfficeList {
                print("순위: \(movie.rank), 영화: \(movie.movieNm), 개봉일: \(movie.openDt), 누적 관객수: \(movie.audiAcc)")
            }
        } catch {
            print("에러 발생: \(error)")
        }
    }
    
}
