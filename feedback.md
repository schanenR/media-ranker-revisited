# MediaRanker Revisted

<!-- Instructors: The checkmarks are already there, so just delete them for any line items that aren't met. -->

## Major Learning Goals/Code Review

<!-- Instructors: Feel free to practice creating specific feedback by referencing a line of code if you'd like. For example, you may say something like "nice custom method in `calculator.rb` line 42." This is optional. -->

<!--

What did you need to configure and setup to make OAuth installed and work?
  - Gemfile, env, initializers (if this includes routes, controller files, etc, or any of the below files, that's okay)

What areas of Rails app code did you need to create/write/modify in order to change logging in to use OAuth?
  - Routes, controllers, models, views (if this includes migrations, tests, etc, or any of the above files, that's okay)

What was one controller test you updated?
  - Anything reasonable, use best judgment.
  - The obvious answer is: The `index` and `show` actions for work require authorization for Wave 3

Why did we need to mock OAuth for testing?
  - To avoid using the GitHub as a dependency
  - Anything concrete about reducing risk around using actual GitHub accounts, resources, reducing complexity, etc. is fine too

NOTES ABOUT TESTS:
At project time, we give them:
61 tests, 140 assertions, 0 failures, 0 errors, 21 skips
At project submission, we expect more tests/assertions, and 0 skips

 -->
<!--
| Criteria | yes/no, and optionally any details/lines of code to reference |
| --- | --- |
| There are tests around the `User` model for validations, relationships, and custom methods (such as `build_from_github`) | ✔️?
| There are tests for `UsersController#login` and `UsersController#logout` that use OAuth mocks | ✔️?
| There are tests for `WorksController#upvote` that use OAuth mocks. There are separate tests for logged-in users and guest users. | ✔️?
-->
## Functional Requirements

| Functional Requirement | yes/no |
| --- | --- |
| Completed OAuth: Logging in goes through GitHub | ✔️?
| Logged-in users can access the index and show pages, guest users get redirected | ✔️?

## Overall Feedback

| Overall Feedback | Criteria | yes/no |
| --- | --- | --- |
| Green (Meets/Exceeds Standards) | 2 in Functional Requirements and controller methods are cleanly written with appropriate model methods for Oauth | 
| Yellow (Approaches Standards) | 1 in Functional Requirements, or the instructor judges that this project needs special attention | 
| Red (Not at Standard) |  0 in Functional Reqs, or assignment is breaking/doesn’t run with less than 5 minutes of debugging, or the instructor judges that this project needs special attention | 

<!-- ### Additional Feedback -->

<!-- Instructors, feel free to ignore this section if there's nothing else to add. -->
