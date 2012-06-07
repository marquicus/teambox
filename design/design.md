## TeamBox: Design Analysis ##
*Note: this document was written using markdown, as it will be appended to the existing ReadMe contained within the Git repository*

TeamBox is a social project management suite that is written with Ruby on Rails. The platform itself is only about 12k lines of code, however, Ruby is a language that prides itself on accomplishing a lot with very few lines of code.

The general functionality of the application was eay to follow as I have prior experience with the Rails framework, however, creating meaningful, readable, and full-featured diagrams became a challenge.

### Architectural Styles ##
The general architectural style that was used throughout the project was the client-server achitecture known as REST (or RESTful). This is very common among most web-based applications. The other "style" would be centered around the Rails framework itself, and the varios patterns and conventions enforced by the framework. I'm not sure if "framework" is an architectural style, but in this case something along those lines would definitely be the best way to describe the structure of this application.

### Design Patterns ###
The most prevalent pattern was Model-View-Controller (MVC). The Rails framework has two purposes: 1) to provide a full-featured framework for web-development and 2) to provide a MVC infused web-development structure.