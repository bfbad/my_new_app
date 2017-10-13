Feature: User can Login
  In order to buy products or leave reviews
  As a user who has already created an account
  I want to be able to log in.

  Scenario: Successful Login
  Given there is a user with an email of abrfergus2@gmail.com
  When that user puts in their accurate user name and password
  Then I should see logout 
  And they should be able to leave reviews.
