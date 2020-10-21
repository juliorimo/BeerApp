class BeersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Vars
    
    private let disposeBag = DisposeBag()
    private var viewModel = BeersViewModel()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewModel()
        
        loadBeers()
    }

    // MARK: - Private
    
    fileprivate func setupView() {
        navigationItem.title = NSLocalizedString("LIST_TITLE")
    }
    
    fileprivate func setupViewModel() {
        // Source view
        viewModel.setSourceViewController(self)
        
        // Table
        viewModel.beers
            .bind(to: tableView.rx.items(cellIdentifier: BeerTableViewCell.nameOfClass, cellType: BeerTableViewCell.self)) { (_, beer, cell) in
                cell.beer = beer
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Beer.self)
            .subscribe(onNext: { (beer) in
                DLog("Beer selected: \(beer.name)")
                // TODO: push detail
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { (indexPath) in
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        
        // SearchBar
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { (text) in
                self.searchBeers(text)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Get data
    
    func loadBeers() {
        viewModel.getBeers()
    }
    
    func searchBeers(_ text: String) {
        viewModel.getBeers(text)
    }
}
