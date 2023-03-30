Local Scout is a rails web application that acts as a travel and budget planner that allows you to browse trips, allocate PTO and comment on tours. Additionally, there is a VIP Trips section that holds all trips over $1000 for those with a more luxurious taste.

This RoR web app includes has_many, belongs_to and has_many :through associations through a join table that is a user-submittable attribute. My models include validations to defend against invalid data, classes that include chainable scope methods to differentiate data and standard user authentication (signup, login, logout, and passwords).

The controllers include reasonable DRY and SOLID principles. Any logic presented in my controllers is encapsulated as methods in my models. My routes include nested resources using RESTful URLs and my forms correctly display validation errors that describe the error in the views. 

My views make use of helper methods and partials where appropriate.

You can find a walkthrough video of this app on youtube at: https://youtu.be/4gfXUzA6p60

If you would like to run the code, please clone the project and bundle install. The app runs on ruby 2.6 and rails 6. Then run rails db:migrate and rails s to start the server. The app should start the server at http://localhost:3000/.


Copyright (c) 2023 Robinson Regalado

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



