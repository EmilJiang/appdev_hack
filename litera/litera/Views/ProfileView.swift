//
//  ProfileView.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//
import Foundation
import UIKit
import SwiftUI


//struct ProfileView: View {
//    typealias Body = <#type#>
    
    
    //struct ProfileView: View {
    //    var body: some View {
    //        NavigationStack {
    //            Text("Profile Screen")
    //                .navigationTitle("Profile")
    protocol EditProfileDelegate {
        
        func UpdateProfile(mLabel: String, htLabel: String)
        
    }
    
    //this is what you added
    
    
    
    
    
    
    
    
    
    class ProfileVC: UIViewController {
        
        
        
        
        
        
        
        // MARK: - Properties (view)
        
        let profileImage = UIImageView()
        
        private let firstnameLabel = UILabel()
        
        private let lastnameLabel = UILabel()
        
        private let emailLabel = UILabel()
        
        private let genderLabel = UILabel()
        
        private let numberLabel = UILabel()
        
        private let editprofilebutton = UIButton()
        
        
        
        
        
        
        
        //this is what you added
        
        
        
        // MARK: - viewDidLoad
        
        
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            view.backgroundColor = .white
            
            createProfileImage()
            
            setupFirstNameLabel()
            
            setupLastNameLabel()
            
            setupEmailLabel()
            
            setupGenderLabel()
            
            setupNumberLabel()
            
            title="Profile Settings"
            
            
            
        }
        
        
        
        // MARK: - Set Up Views
        
        
        
        private func createProfileImage() {
            
            profileImage.image = UIImage(named: "profileimage")
            
            profileImage.layer.masksToBounds = true
            
            profileImage.contentMode = .scaleAspectFill
            
            
            
            view.addSubview(profileImage)
            
            profileImage.translatesAutoresizingMaskIntoConstraints = false
            
            //profileImage.layer.cornerRadius=imageWidth/2
            
            profileImage.layer.cornerRadius=128/2
            
            NSLayoutConstraint.activate([
                
                profileImage.widthAnchor.constraint(equalToConstant: 128.0),
                
                profileImage.heightAnchor.constraint(equalToConstant: 128.0),
                
                profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
                
            ])
            
        }
        
        
        
        private func setupFirstNameLabel() {
            
            firstnameLabel.text = "Vin Bui"
            
            firstnameLabel.textColor = UIColor.black
            
            firstnameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            
            firstnameLabel.numberOfLines = 0
            
            firstnameLabel.textAlignment = .center
            
            view.addSubview(firstnameLabel)
            
            firstnameLabel.translatesAutoresizingMaskIntoConstraints=false
            
            
            
            NSLayoutConstraint.activate([
                
                firstnameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
                
                firstnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                
            ])
            
        }
        
        
        
        
        
        
        
        private func setupLastNameLabel() {
            
            lastnameLabel.text = "Vin Bui"
            
            lastnameLabel.textColor = UIColor.black
            
            lastnameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            
            lastnameLabel.numberOfLines = 0
            
            lastnameLabel.textAlignment = .center
            
            view.addSubview(lastnameLabel)
            
            lastnameLabel.translatesAutoresizingMaskIntoConstraints=false
            
            
            
            NSLayoutConstraint.activate([
                
                lastnameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
                
                lastnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                
            ])
            
        }
        
        private func setupEmailLabel() {
            emailLabel.text = "Gender"
            
            emailLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            
            emailLabel.textColor = UIColor.black
            
            view.addSubview(emailLabel)
            
            emailLabel.translatesAutoresizingMaskIntoConstraints=false
            
        }
        
        
        private func setupGenderLabel() {
            
            genderLabel.text = "Gender"
            
            genderLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            
            genderLabel.textColor = UIColor.black
            
            view.addSubview(genderLabel)
            
            genderLabel.translatesAutoresizingMaskIntoConstraints=false
            
            
            NSLayoutConstraint.activate([
                
                numberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor)
            ])
        }
        
        private func setupNumberLabel() {
            
            numberLabel.text = "Major: Information Science"
            
            numberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            
            numberLabel.textColor = UIColor.black
            
            view.addSubview(numberLabel)
            
            numberLabel.translatesAutoresizingMaskIntoConstraints=false
            
            NSLayoutConstraint.activate([
                
                numberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
                numberLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor)
                
                
                
            ])
            
            
            
            
            
        }
        
        //    private func setupEditProfileButton(){
        
        //        editprofilebutton.setTitle("Edit Profile", for: .normal)
        
        //        editprofilebutton.setTitleColor(.white, for: .normal)
        
        //        editprofilebutton.backgroundColor = .red
        
        //        editprofilebutton.layer.cornerRadius=16.00
        
        //        editprofilebutton.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        //        editprofilebutton.translatesAutoresizingMaskIntoConstraints=false
        
        //        view.addSubview(editprofilebutton)
        
        //        NSLayoutConstraint.activate([
        
        //            editprofilebutton.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        
        //            editprofilebutton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        
        //            editprofilebutton.widthAnchor.constraint(equalToConstant: 100),
        
        //            editprofilebutton.heightAnchor.constraint(equalToConstant: 50)
        
        //   ])
        
        
        
    }
    
    
    
    
    
    
    
    
    //
    //            extension ProfileVC: EditProfileDelegate {
    //
    //                func UpdateProfile(mLabel: String, htLabel: String) {
    //
    //
    //
    //                    majorLabel.text = mLabel
    //
    //                    hometownLabel.text =  htLabel
    //
    //
    //
    //
    //
    //                }
    
    
    
    
    


                

            
        
