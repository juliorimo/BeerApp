enum DataManagerError: Int, Error {
    case error = 400
    case unAuthorized = 401
    case notFound = 404
}

class DataManager: NSObject {

    func getBeers() -> Observable<[Beer]> {
        let url = Constants.BaseUrl.main+Constants.Endpoints.beers
        
        return Observable.create { observer -> Disposable in
            
            Alamofire.request(url, method: HTTPMethod.get).validate().responseJSON { response in
                
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        observer.onError(response.error ?? DataManagerError(rawValue: 400)!)
                        return;
                    }
                    do {
                        let beers = try JSONDecoder().decode([Beer].self, from: data)
                        observer.onNext(beers)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func getBeers(_ food: String) -> Observable<[Beer]> {
        let url = Constants.BaseUrl.main+Constants.Endpoints.beers
        var parameters: [String: Any] = [:]
        parameters["food"] = food
        
        return Observable.create { observer -> Disposable in
            
            Alamofire.request(url, method: HTTPMethod.get, parameters: parameters).validate().responseJSON { response in
                
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        observer.onError(response.error ?? DataManagerError(rawValue: 400)!)
                        return;
                    }
                    do {
                        let beers = try JSONDecoder().decode([Beer].self, from: data)
                        observer.onNext(beers)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }

    }
}
