# Pseudo Flutter application which would let users help search and analyze GitHub users conveniently.

### Deployment instructions
~Step 1: Clone the repo OR in android studio File > New > Project from version control > Git

~Setp 2: Enter repo URL

~Step 3: Get dependencies when it asks

~Step 4: In Android Studio go to > File > Project Structure > Select Project SDK -Android API 29 Platforms(9)

## Screen shots

![LCO Mascot](https://github.com/him123/nitorAssignment/blob/master/nitor_assignment/newss/12.PNG)
![LCO Mascot](https://github.com/him123/nitorAssignment/blob/master/nitor_assignment/newss/23.PNG)


## How it works

~When App loads, you just need to enter Github user name. Once you start entering username it will start calling apis. I have tried making elastic search with this app. File Name: `home_screen.dart`

~From the popuped list you can tap on any user and it will redirect to next screen. Here I have used Hero animation to just making transaction smooth and with image animation. File Name: `user_details_screen.dart`

~In the details screen user big image, name, followers, following and other infonformation you can see. `File Name: user_details_screen.dart`

~In the details screen there is a share button at the top right corner of the screen. With this button you can share current profile with your social networks. File Name: `user_details_screen.dart`

~In the same screen if you want to see more details about the user, you can click on the link and you will redirect to the web browser for your phone and it displays a complete details of the selected user. File Name: `user_details_screen.dart`

~In the details page there are two button in the Green color. Follower and Following. By clicking on this button you will be redirected to the Following-Follower screen. Here you can have the whole list of user's followers and followings. `File Name: follower_list_screen.dart`

## Code Information

~App is mainly divided by 4 packages 

constants|modes|screens|widgets
|---|---|---|---|

~constancs contains desings and url infromation which are shaing by whole app.

~models contains user.dart and user_details.dart. This are two model classes to catch the api response.

~screen package contains all screen UI files.

~widgets package contains list item widget of user which is used to make list for homescreen.dart.

~`main.dart` theme is configured. Root of the app is defined in this file.


_P S I have develope this app in order to submit the interview assignment for Nitor Infotech_


