# AddIt

A simple addition game built with Flutter. Just answer if the addition displayed is right or wrong within 3 seconds.

<p align="center"><img src="https://github.com/suchoX/addIt/blob/master/Art/preview.gif" height="300"></p>

This is the `master` branch, the Mobile version of the application to build android and ios apps.


AddIt also has a web version using `flutter-web`. As it is a technical preview, the changes required to migrate you code to web is not smooth. There are some changes that makes it impossible to have the same codebase for the app and web version evn though the changes required are minimal and doesn't affect your business logic and UI components

To checkout the web version try the [web-support](https://github.com/suchoX/addIt/tree/web-support) branch

### Tech-Stack
This project is completely built with flutter and has the following properties
1. It follows BLOC pattern. UI components are stateless and StreamBuilder is used to update only the required views
2. A basic Data Injection procedure has been implemented for injecting objects.
3. This project showcases a basic Flutter BLOC architecture and can be used as the base of other flutter projects

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
