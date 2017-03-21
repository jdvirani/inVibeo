//
//  ContentViewController.swift
//  GSignIn
//
//  Created by Gabriel Theodoropoulos on 8/7/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController//, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tblContent: UITableView!
    
    
    var peopleDataArray: Array<Dictionary<NSObject, AnyObject>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
      //  tblContent.delegate = self
      //  tblContent.dataSource = self
        
        //getPeopleList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: IBAction method implementation
    
    @IBAction func signOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func disconnect(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().disconnect()
    }

    
    // MARK: UITableView method implementation
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else {
            return peopleDataArray.count
        }
    }
    
    
   /* func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Personal Info"
        }
        else {
            return "People in Circles"
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if (indexPath as NSIndexPath).section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "idCellPersonalInfo", for: indexPath) 
            
            if (indexPath as NSIndexPath).row == 0 {
                cell.textLabel?.text = GIDSignIn.sharedInstance().currentUser.profile.name
                cell.detailTextLabel?.text = "Name"
            }
            else {
                cell.textLabel?.text = GIDSignIn.sharedInstance().currentUser.profile.email
                cell.detailTextLabel?.text = "Email"
            }
            
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "idCellPeople", for: indexPath) 
            
          //  cell.textLabel!
            text = peopleDataArray[row]["displayName"]
            as ? String.imageView! : image
            
           // cell.textLabel?.text = peopleDataArray[(indexPath as IndexPath).row]["displayName"] as? String
          //  cell.imageView?.image = UIImage(data: peopleDataArray[(indexPath as IndexPath).row]["imageData"] as! Data)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    */
    
    // MARK: Custom method implementation
    
    func performGetRequest(_ targetURL: URL!, completion: @escaping (_ data: Data?, _ HTTPStatusCode: Int, _ error: NSError?) -> Void) {
        let request = NSMutableURLRequest(url: targetURL)
        request.httpMethod = "GET"
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data!, response: URLResponse!, error: NSError!) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                completion(data, (response as! HTTPURLResponse).statusCode, error)
            })
        } as! (Data?, URLResponse?, Error?) -> Void)
        task.resume()
    }
    
    
  /*  func getPeopleList() {
        let urlString = ("https://www.googleapis.com/plus/v1/people/me/people/visible?access_token=\(GIDSignIn.sharedInstance().currentUser.authentication.accessToken)")
        let url = URL(string: urlString)
        
        performGetRequest(url, completion: { (data, HTTPStatusCode, error) -> Void in
            if HTTPStatusCode == 200 && error == nil {
                let resultsDictionary = JSONSerialization.JSONObjectWithData(data!, options: nil, error: error) as! Dictionary<NSObject, AnyObject>
                
                // Get the array with people data dictionaries.
                let peopleArray = resultsDictionary["items"] as! Array<Dictionary<NSObject, AnyObject>>
                
                // For each item get the display name and download the picture.
                // Store these values in a new dictionary, and then in the peopleDataArray array.
                for item in peopleArray {
                    var dictionary = Dictionary<NSObject, AnyObject>()
                    dictionary["displayName"] = item["displayName"] as! String
                    
                    let imageURLString = (item["image"] as! Dictionary<NSObject, AnyObject>)["url"] as! String
                    dictionary["imageData"] = NSData(contentsOfURL: NSURL(string: imageURLString)!)
                    
                    self.peopleDataArray.append(dictionary)
                }
                
                // Reload the tableview data.
                self.tblContent.reloadData()
            }
            else {
                print(HTTPStatusCode)
                print(error)
            }
        })
    }
    */
    
}
