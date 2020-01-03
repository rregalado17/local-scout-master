# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# local-scout-master
Requirements
Use the Ruby on Rails framework.

Your models must:

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

Your application must provide standard user authentication, including signup, login, logout, and passwords.

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

Your forms should correctly display validation errors.

a. Your fields should be enclosed within a fields_with_errors class

b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

Example Domains
A Recipe Manager - Should provide the ability to browse recipes by different filters such as date created, ingredient count, rating, comments, whatever your domain provides. Additionally ingredients would need to be unique so that the first user that adds Chicken to their recipe would create the canonical (or atomic/unique/individual) instance of Chicken (the only row to ever have the name Chicken in the ingredients table). This will force a join model between ingredients and recipes and provide an easy way to group recipes by ingredients, which would be a great view to implement. Associating some user-centric data regarding recipes such as ratings or comments would further fill out the domain and provide some great learning experiences.

A Group Task Manager - An application that allowed the creation of task lists with individual tasks that can be assigned to a user would flex the majority of the requirements of this assessment. You would be able to create a list of tasks, add tasks to that list, assign those tasks to a user, and allow users to change the statuses of their tasks.

Restricted Domains
A Basic Blog App - We've used a Blog domain design for a lot of the rails lessons and code-alongs. The blog must have unique features/approaches and solve problems in different ways.

An Amusement Park - This is the domain design for one of the final Rails projects. Try to find inspiration from this project and build something unique and different.