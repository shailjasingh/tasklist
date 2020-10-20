#### Welcome to Task List.

   We provide an interface to add and list tasks with a feature of marking them complete.

#### Prerequisite

   Required ruby-version 2.6 and rails version 6.0.2

   - Command to install ruby version:
   ```
   rvm install ruby-2.6.5
   ```

#### Platform Dependecies
- Ruby - 2.6.5
- Rails - 6.0.2
- Database - Sqlite3

#### Components
###### 1. App Component:
This component provides feature of adding tasks and listing them. In addition to this user can check tasks to mark them complete with a timestamp being shown. The Timestamps are being configured to handle various timezones.

#### Setup
###### 1. Install gem bundler:
  ```
  gem install bundler
  ```
###### 2. Install the application dependencies in the project root directory:
  ```
  bundle install
  ```
###### 3. Create database, run the migrations and seed the initial data for application:
  ```
  rails db:create db:migrate db:seed
  ```

#### Execution:
###### 1. Start the webpacker dev server:
  ```
  WEBPACKER_DEV_SERVER_HOST=0.0.0.0 ./bin/webpack-dev-server
  ```
###### 2. Start the rails server:
  ```
  rails server
  ```

#### Testing
Application uses rspec tests for unit testing.
  ```
  rspec
  ```

#### Asked Questions

##### How did you decide on the technical and architectural choices used as a part of your solution?
* I opted to use ActiveInteration on the architectural level to manage application-specific business logic. I prefer to use such frameworks like Trailblazer, ActiveInteration to shrink my controllers, slim my models, and DRY my code. I believe in following single responsibility principle.
* To manage user timezones while rendering tasks, I added Javascript code.
* To prevent page reloading and better user experience, I added ajax request to mark the task as complete.
* To manage usernames as mentioned in the design I introduced users table as well. Also, added proper migrations and associations between user and tasks.
* To validate avatar URL and to ensure it's content-type must be an image, I added proper checks under lib/UrlParser.
* Used Rspecs to add unit test cases and added gems like factory_bot_rails, faker, rspec-rails, shoulda-matchers to support test framework.
* To analyze ruby code formatting, I used rubocop.

##### Are there any improvements that you can make to you submission?
* User authentication should be added to secure the application and managing user sessions.
* Feature to upload images rather than taking URL as input.
* Add Pagination and introduce infinite scrolling for better user experience and better application performance.
* Make separate tabs for listing Incomplete and Complete tasks. Currently showing them in one place.
* Feature to search specific tasks.
* I ordered incompleted tasks before completed tasks while listing them as it was mentioned in the challenge PDF file but ideally it should be in reversed order as the user would like to see incompleted tasks first in order to complete them.

##### What would you do differently if you were allocated more time?
* Write **integration test** cases for end to end testing.
* Add unit test cases for library files and active interactions.
* Dockerize the application.
* Deploy to Heroku with Postgres.
* Introduce frontend JS framework like ReactJS, VueJS.
* I added alerts if ajax request fails but it needs to be handled by adding toastr notification.
* I used plain JS for date-time operations but it's better to use MomentJS there.

##### How long did it truly take you to complete the challenge?
* It took me around 6 hours to complete the task.
* Firstly, I spent some time planning for architectural and technical aspects of the project including schema design, etc.
* Then, I decided on designing part and business logic along with different edge cases.
* Finally, I started implementing code, with tests and finished implementation.