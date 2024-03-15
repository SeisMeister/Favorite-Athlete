//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Cesar Fernandez on 3/12/24.
//

import UIKit

class AthleteFormViewController: UIViewController {
    @IBOutlet weak var favoriteAthleteNameTextField: UITextField!
    @IBOutlet weak var favoriteAthleteAgeTextField: UITextField!
    @IBOutlet weak var favoriteAthleteLeagueTextField: UITextField!
    @IBOutlet weak var favoriteAthleteTeamTextField: UITextField!
    @IBAction func saveButtonAction(_ sender: Any) {
        guard let name = favoriteAthleteNameTextField.text,
              let ageString = favoriteAthleteAgeTextField.text,
              let age = Int(ageString),
              let league = favoriteAthleteLeagueTextField.text,
              let team = favoriteAthleteTeamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "exitToMyFavoriteAthletes", sender: self)
    }
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
        //        Page 71, Step 4 paragraph 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    
    func updateView() {
        if let athlete = athlete {
            favoriteAthleteNameTextField.text = athlete.name
            favoriteAthleteAgeTextField.text = "\(athlete.age)"
            favoriteAthleteLeagueTextField.text = athlete.league
            favoriteAthleteTeamTextField.text = athlete.team
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
