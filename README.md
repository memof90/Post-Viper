# Post-Viper

Why Viper Well, viper is the better Clean Arquitecture to create mobile, it's easy to create testing and test the app, very easy to work in teamworks, manage modules and separate layers in each module, dependicy injection etc. 

### Libraries

I'm create all my libraries and manage with me. but if the app need libraries maybe to kinfisher to load images and maybe almofire to dowload images.

### Advantages Viper

- It simplifies complex projects hence making it an ideal choice large teams.
- It makes the process scalable and enables developers to work simultaneously on a project.
- It allows the reusability of codes by decoupling it.
- It segments various applications based on their roles and distributes the responsibilities.
- The new features can be added easily such as writing automated tests.

## How the app works

![alt text](https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Copia%20de%20Simulator%20Screen%20Recording%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.51.21.gif%2013-59-51-150.gif?raw=true)

## Instalation
This project require XCode 13.3, Swift 5.0 and should be run on device with iOS 15+ and then, you should `run` the app.

 ## Screens Apps
 
 <table>
  <tr>
    <td>Contct List</td>
     <td>search Items</td>
     <td>Empty List</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.28.47.png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.28.57.png?raw=true" width=270 height=480></td>
     <td><img src="https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.29.02.png?raw=true" width=270 height=480></td>
  </tr>
 </table>
 
  <table>
  <tr>
    <td>Contct List</td>
     <td>search Items</td>
     <td>Empty List</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.29.17.png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.29.25.png?raw=true" width=270 height=480></td>
     <td><img src="https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202022-03-28%20at%2013.29.35.png?raw=true" width=270 height=480></td>
  </tr>
 </table>
 
 ## Requerimets
 
- [x] Load the posts from the JSON API and populate the view.
- [x] Each cell/row should show the title of the post without clipping.
- [x] Once a post is touched, the user should be taken to its details view.
- [x] The post details screen should contain the user information and the list of comments.
- [x] Add a button in the navigation. It adds/removes the current post to favorites.
- [x] Add a button in the navigation. It removes the current post from the list.
- [x] Add a button to removes all posts.
- [x] Add a button or gesture to load posts from the API.
- [x] Favorite posts should be at the top of the list.
- [x] Favorite posts should have a star indicator.

## Extras 

- [x] Unit Testing 
- [] Core Data 

## Architecture
This project uses VIPER architecture, VIPER is an application of Clean Architecture to iOS apps. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing. Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers. [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/).

![alt text](https://miro.medium.com/max/1021/1*6W73TuYu1DWi9JY4_Uh8aA.png)

This architecture is conformed by 5 layers which have single responsibilities, which represent an opportunity to have a project decoupled, testable, and scalable.

### View
> This layer is responsible to manage the view and the view controller, which allows to have centralized all the components and their behavior. This layer have their UIView components and UIViewControllers.

### Presenter
> The presenter layer is responsible to manage the communication between the View layer, Router layer and Interactor layer. Its main function is handle each visual request, retrieve information from interactor layer or, route the actual view to another one with the Router.

### Router
> This layer is responsible to manage the communication between modules, its allows us changing between views and, create modules for each feature on the app.

### Interactor
> The interactor is the main integral layer, because on it we could manage all the business logic and have communication with the data modules which retrieve us data from local or remote repositories.

### Entity 
> Entity layer provides a model which interactor use to create objects from the fetched data. The Entity is probably the simplest element inside a VIPER structure.

## Good Practices
With the following practices, we've achieved create a product with highly quality.
- **Clean code**
- **SOLID Principles**
- **DRY Principle**
- **Dependency Injection**
- **Modularized architecture**

## Project Structure

### App Folder
> Is a folder which have the appDelegate, sceneDelegate, assets and, LaunchScreenStoryboard).

![alt text](https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Captura%20de%20Pantalla%202022-03-28%20a%20la(s)%201.02.07%20p.%C2%A0m..png?raw=true)

### Modules
> In this folder we have each app module. In this case we have a Movie, and DetailMovie Modules, where we can find a viper architecture for each module. This architecture allow us to define single responsabilities for each layer.

![alt text](https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Captura%20de%20Pantalla%202022-03-28%20a%20la(s)%201.02.55%20p.%C2%A0m..png?raw=true)

### Extensions
> In this folder we can find a multiples extensions. The main idea of this folder is have a transversal module which help us with reusables functions.

![alt text](https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Captura%20de%20Pantalla%202022-03-28%20a%20la(s)%201.03.42%20p.%C2%A0m..png?raw=true)

### Services
> This layer allows us to separate in a single context everything related to networking and web services.

![alt text](https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Captura%20de%20Pantalla%202022-03-28%20a%20la(s)%201.03.54%20p.%C2%A0m..png?raw=true)

### Unit Test
> In this section we have the unit test structure, this folder meets the Viper architecture requirements. To continue, we can find a Test Double approach where we use Mocks, and Stubs doubles to test the differents architecture layers.

![alt text](https://github.com/memof90/screenProjects/blob/master/Swift%20Projects/Captura%20de%20Pantalla%202022-03-28%20a%20la(s)%201.03.54%20p.%C2%A0m..png?raw=true)

