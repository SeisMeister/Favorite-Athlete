import UIKit

class AthleteTableViewController: UITableViewController {
//    MARK: - functions section
    
    @IBSegueAction func addAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        return AthleteFormViewController(coder: coder, athlete: nil)
    }
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
//        Interpretation of Pg.72 pp. 2
        let athleteToEdit: Athlete?
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
        } else {
            athleteToEdit = nil
        }
        return AthleteFormViewController(coder: coder, athlete: athleteToEdit)
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
//        guard let AthleteTableViewController as? AthleteFormViewController else {return}
//        Intepretation of Pg. 72 pp. 1
        guard let athleteFormViewController = unwindSegue.source as? AthleteFormViewController, let athlete = athleteFormViewController.athlete else {
            return
        }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }
    }
    
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
}
