//
//  ViewController.swift
//  Colours App
//
//  Created by Umar Pirmahomed on 20/02/2023.
//

import UIKit


class ViewController: UIViewController {
    
    var colours: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomColours()
        // Do any additional setup after loading the view.
    }
    
    
    func createRandomColours(){
        for _ in 0..<50{
            colours.append(randomColourGenerator())
        }
    }
    
    func randomColourGenerator() -> UIColor{
        let randomColour = UIColor(red: CGFloat.random(in: 0...1),
                                   green: CGFloat.random(in: 0...1),
                                   blue: CGFloat.random(in: 0...1),
                                   alpha: CGFloat(1))
        return randomColour
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! RandomColours
        destVC.colour = sender as? UIColor
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colours[indexPath.row]
        cell.largeContentTitle = "hello"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colour = colours[indexPath.row]
        performSegue(withIdentifier: "toRandomColours", sender: colour)
    }
}

