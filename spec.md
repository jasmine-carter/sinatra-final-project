# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used the sinatra gem in gemfile (using the corneal gem to scaffold out the project)
- [x] Use ActiveRecord for storing information in a database - Used 'activerecord' gem and required it in the gemfile, as well as the 'sinatra-activerecord' gem
- [x] Include more than one model class (e.g. User, Post, Category) - Created 3 models: [User, Games, Consoles]
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)  - User model has many consoles, and has many games.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)- Console and Game models belong to Users.
- [x] Include user accounts with unique login attribute (username or email) - Users must login with a username and email address and password. Form requires all three to ensure they cannot login/signup with any param missing.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Consoles and Games have /show /new, /edit, and /delete routes.
- [x] Ensure that users can't modify content created by other users - Consoles and Games GET /edit action both verify that the game a user is trying to edit, belongs to that user by comparing game.user_id to current_user.id
- [x] Include user input validations - On user signup and login forms, I require username, email, and password fields, and if the user enters " " for any of them, I reroute them to signup with feedback. Console and Game create and update actions validate against empty strings or nil values
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - I utilized the rack-flash3 gem to enable flash messages. I've used rack flash messages on the User, Consoles, and Games controllers as validation failure messages for login/signup, and create/update actions for Consoles and Games.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - README.md includes a description, install instructions, license link and contributors guide.

Confirm
- [x] You have a large number of small Git commits - As of writing this 9/28, 55 commits were made to build this.
- [x] Your commit messages are meaningful - Balanced short with descriptive messages, and tried to make commits smaller over time.
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
