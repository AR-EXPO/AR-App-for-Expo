# Showcasing Advancements In Technology
Augmented Reality application for Oregon State University Engineering Expo


The goal of this project is to showcase new and emerging technologies, this year we will be working on showcasing Augmented Reality through an iOS application. Specifically iOS since there is a greater advancement in the librarys available for development and the wider availability of tools we can use to develop the AR app.

This app will help attendees of the Engineering Expo have a more interactive experience through AR. The app for this round of development will focus on creating the functionality for overlaying a teams video ontop of thier posters. Meaning that a team will upload an image of their poster to our site (being developed seperately by the online postbac team) and they will also upload their teams video along with it.

The job of our project is to create the app that will allow for a user to use their camera to point at a teams poster at the expo and pull up that teams video by overlaying the video on the poster in AR so they can easily view it through the application.

Design considerations:
  - There is the option of having the app recognize the image and link out to a third party application (like YouTube) and have it open that third party app (YouTube) and play the video that way, but that is not taking advantage of Augmented Reality. We wanted to make sure that we were working within the design requirements and thus have chosen to persue the video overlay. This will allow a user to stay within the app and view the video as if it was infront of their camera lens to enhance and elevate the user experience.

Development considerations:
  - There was questions about crossplatrom compatibility. The best solution we found was developing in iOS since there were more packages and tools for developmetn of the application. We were able to find more established tools for wireframing and developing our application in iOS though it limits not only our users, but also our ability to develop (since not everyone has a mac for programming in swift).

## The App:
The app will have a few main components, the main one being the AR video overlay. It will also have:
  1. A homescreen with a few intuitive menues - The Video feature access menu, a tab for viewing colleges presenting, and a tab for viewing all projects. More information on the video aspect below.
  2. The app will have to communicate with the online portal (becing developed seperately by the online team). The online portal is where presenters (the students) will upload their posters and videos. That is being hosted on an AWS server which we will have to connect to our application so we can access the images and corresponding videos.
  
## Video
The AR application will use image recognition to identify posters and overlay that teams videos. This is the main goal of our project this term.

How this works is by using image recognition software built into Swift that allows our application to use a users camera to scan a scene infront of the camera lense. Once the scan is complete if an object is recognizable the application will pop up a video. The user will be able to view the video through their phone.

## Team Members
The AR app will also allow users to view more information about each groups team members. This is for later development if we can get to it.

## Map (Postponed)
There will be a map feature that will allow attendees to locate project teams. This is for later development if we can get to it.

Specifically the application should in the future allow users to choose a booth that they want to visit and the application will display some arrows on their phones screen through a camera and using arrows direct the user to the booth in question. For this the application will need to:
  1. access the users current location
  2. Be able to identify the ground and place virtual arrows in the users camera field of view.
  3. Will have to have have a database with the location of all booths and the project names.
