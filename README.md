Deep
====

Simple iOS app to demonstrate deep-linking

Instructions
============

- Open both Deep and Link in Xcode 7 or higher

- Run both on simulator so that both are installed on the simulator

- Run Deep (the blue app) first and click on "Go to Green" button

- This should launch Link (the green app)

- On the homescreen of green app, perform any calculation and click on button to send the total computed back to blue app 

Screenshots
===========

Screenshot of Blue app
![alt text](https://github.com/arunabhdas/Deep/blob/master/screenshots/screenshot_blue.png "Screenshot Blue")

Screenshot of Green app
![alt text](https://github.com/arunabhdas/Deep/blob/master/screenshots/screenshot_green.png "Screenshot Green")

The below steps from the following link were followed : 

http://stackoverflow.com/questions/4115744/how-to-share-keychain-data-between-ios-applications




App1:

Open your App's target Capabilities and enable KeyChain Sharing.
Add a identifier. (eg : com.example.sharedaccess)
Add "UICKeyChainStore" to your project.
Be sure you have a team id added to your App1 project.
Add Security.framework to your App1 project.
And add these codes to somewhere you need.

[UICKeyChainStore setString:@"someValue" forKey:@"someKey" service:@"someService"];
App2:

Open your App's target Capabilities and enable KeyChain Sharing.
Add a identifier. (eg : com.example.sharedaccess)
Add "UICKeyChainStore" to your project.
Be sure you have a team id added to your App2 project.
Add Security.framework to your App2 project.
And add these codes to somewhere you need.

NSString *string = [UICKeyChainStore stringForKey:@"someKey" service:@"someService"];
Your TeamIDs should be same for both projects.

I tried these steps on a real iPhone device.
I also tried these steps with Automatic and iOs Development provisioning profile.
My apps' bundle identifiers were like that : com.example.app1, com.example.app2.


