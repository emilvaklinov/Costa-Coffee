# Costa-Coffee

### Task
The demonstration app should take a minimum viable product approach to show how you
approach the problem. We want to be able to see how you would structure your code, unit tests &
design your user interface. Provide us with enough of an example without spending too much of
your time. API - https://developer.foursquare.com/docs/api-reference/venues/

### Rules:
1. Please use the latest stable versions of Xcode, Swift & iOS.
2. Your code must be written in Swift and should use the most modern/recent conventions and
dependencies.
3. Feel free to use Google, Stack Overflow, and any other websites or tutorials for inspiration
but ensure the submitted code is your own solution.
4. Your code must be provided in a GitHub repository.
5. Your project must compile and run without requiring 3rd party dependencies to be
downloaded separately.
6. The README.md should contain instructions on where in the code we should add our own
Foursquare Client ID & Client Secret.
7. When you submit your test, you must send a summary (or have it as your project’s
README.md) explaining the approach you have taken.
8. Your code should contain some appropriate unit tests.

### Development Platform
- iOS 14.0 (Minimum deployment traget) and XCode 11.3/12+
- Swift 5.0+, SwiftUI
- UIKit, Unit Testing
- Combine, CoreLocation
- Documentation added


### Running App locally
- The app can be runed by Xcode simulator.
- The keys can be exchaged to new one because the fetching of images has dayly limit!
- The key is implemented and there is a second one in Constant.swift file. **Keep in mind the images have day limit calling from the API.**
- The Unit test can be run but because of the limit of the images API it can go to red if the API call is overused which is very fast. To make new call you need to change the key or use your own one.

### Version Control
- The app is under a git hub repository.

### Swift architecture
- The application is built with an MVVM design pattern.

### Tech details and visualisation
- Getting users location printed in the console
"locationManager(_:didUpdateLocations:) <+51.50998000,-0.13370000> +/- 5.00m (speed -1.00 mps / course -1.00) @ 4/1/21, 12:14:57 PM British Summer Time"

## Populating data
![Screenshot 2021-04-01 at 12 30 11](https://user-images.githubusercontent.com/30974420/113289772-941e1700-92e8-11eb-91f1-3cf4b377779a.png)
