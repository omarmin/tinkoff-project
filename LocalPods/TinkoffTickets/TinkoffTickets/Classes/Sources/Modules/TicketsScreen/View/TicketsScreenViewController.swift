import UIKit

final class TicketsScreenViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var output: TicketsScreenViewOutput!
    var tickets: [TicketCellViewModel] = []

    // MARK: Life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        output.didTriggerViewReadyEvent()
    }
}

// MARK: - TicketsScreenViewInput
extension TicketsScreenViewController: TicketsScreenViewInput {

    func setupInitialState() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        let cellNib = UINib(resource: R.nib.ticketCell)
        tableView.register(cellNib, forCellReuseIdentifier: "TicketCell")
    }
    
    func show(_ tickets: [TicketCellViewModel]) {
        self.tickets = tickets
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension TicketsScreenViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ticket = tickets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as? TicketCell
        cell?.setup(with: ticket)
        // TODO: ("temp")
        return cell ?? UITableViewCell()
    }
}
