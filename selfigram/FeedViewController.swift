//
//  FeedViewController.swift
//  selfigram
//
//  Created by Lauren  Kemp on 2016-11-15.
//  Copyright © 2016 Lauren  Kemp. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var words = ["Hello", "my", "name", "is", "Lauren"]

   
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=3c74d74676583b013455c677347b65ec&tags=wolf")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            
            print ("inside dataTaskWithURL with data = \(data!)")
            
        })
        
        // this is called to start (or restart, if needed) our task
        task.resume()
        
        print ("outside dataTaskWithURL")


    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        // UIImage has an initializer where you can pass in the name of an image in your project to create an UIImage
        // UIImage(named: "Grumpy-Cat") can return nil if there is no image called "grumpy-cat" in your project
        // Our definition of Post did not include the possibility of a nil UIImage
        // so, therefore we have to add a ! at the end of it
        
        
        
        let me = User(aUsername: "Lauren", aProfileImage: UIImage(named: "Werewolf")!)
        
        
        let post0 = Post(image: UIImage(named: "Werewolf")!, user: me, comment: "Werewolf 0")
        let post1 = Post(image: UIImage(named: "Werewolf")!, user: me, comment: "Werewolf 1")
        let post2 = Post(image: UIImage(named: "Werewolf")!, user: me, comment: "Werewolf 2")
        let post3 = Post(image: UIImage(named: "Werewolf")!, user: me, comment: "Werewolf 3")
        let post4 = Post(image: UIImage(named: "Werewolf")!, user: me, comment: "Werewolf 4")

        posts = [post0, post1, post2, post3, post4]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! SelfieCell
        
    
        let post = self.posts[indexPath.row]
        

    
        cell.selfieImageView.image = post.image
        cell.usernameLabel.text = post.user.username
        cell.commentLabel.text = post.comment

        return cell
    }

    @IBAction func cameraButtonPressed(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        
     
        
        pickerController.delegate = self
        
        if TARGET_OS_SIMULATOR == 1 {
            
            pickerController.sourceType = .photoLibrary
        } else {
            
            pickerController.sourceType = .camera
            pickerController.cameraDevice = .front
            pickerController.cameraCaptureMode = .photo
        }
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // 1. When the delegate method is returned, it passes along a dictionary called info.
        //    This dictionary contains multiple things that maybe useful to us.
        //    We are getting an image from the UIImagePickerControllerOriginalImage key in that dictionary
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //2. We create a Post object from the image
            let me = User(aUsername: "Lauren", aProfileImage: UIImage(named: "Werewolf")!)
            let post = Post(image: image, user: me, comment: "My Selfie")
            //3. Add post to our posts array
            //    Adds it to the very top of our array
            posts.insert(post, at: 0)

    }
        
        //3. We remember to dismiss the Image Picker from our screen.
        dismiss(animated: true, completion: nil)
        
        //5. Now that we have added a post, reload our table
        tableView.reloadData()
    
    }



        // Configure the cell...



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
