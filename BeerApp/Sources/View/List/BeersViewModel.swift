class BeersViewModel {
    
    // MARK: - Inputs
    
    // MARK: - Outputs
    
    let beers: Observable<[Beer]>
    
    // MARK: - Private
    
    private var sourceViewController: BeersViewController?
    private let disposeBag = DisposeBag()
    private let privateBeers = PublishSubject<[Beer]>()
    private var dataManager = DataManager()
    
    // MARK: - Init
    
    init() {
        beers = privateBeers.asObserver()
    }
    
    // MARK: - Public methods
    
    func setSourceViewController(_ viewController: BeersViewController) {
        self.sourceViewController = viewController
    }

    func getBeers() {
        dataManager.getBeers()
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (beers) in
                self.privateBeers.onNext(beers)
            }, onError: { (error) in
                self.privateBeers.onError(error)
            })
            .disposed(by: disposeBag)
    }
    
    func getBeers(_ text: String) {
        dataManager.getBeers(text)
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (beers) in
                self.privateBeers.onNext(beers)
            })
            .disposed(by: disposeBag)
    }
}
