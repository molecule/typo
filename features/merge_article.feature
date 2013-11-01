Feature: Admin Merge Articles

  As a blog administrator
  In order to merge some articles
  I want to be able to merge some articles on my blog

  Background:
    Given the blog is set up 


Scenario: When articles are merged, the merged article should contain the text of both previous articles

  Given I am logged into the admin panel
  #And I am on the admin content page
  And I am on the new article page 

  When I fill in "article_title" with "Fish"
  And I fill in "article__body_and_extended_editor" with "Fish fish eat eat"
  And I press "Publish"
  And I go to the new article page
  And I fill in "article_title" with "Horses"
  And I fill in "article__body_and_extended_editor" with "Donkies don't eat donkies"
  And I press "Publish" 

  When I follow "Fish"
  When I am on the edit page for "Fish"
  When I fill in "merge_with" with the id for "Horses"
  And I press "Merge"
  Then I should see "Fish fish eat eat"
  And I should see "Donkies don't eat donkies"
  When I go to the home page
  Then I should see "Fish"
  And I should not see "Horses"


Scenario: Fail to merge article with itself
  Given I am logged into the admin panel
  And I am on the new article page

  When I fill in "article_title" with "Monkies"
  And I fill in "article__body_and_extended_editor" with "Monkies throw their own shit!"
  And I press "Publish"

  When I follow "Monkies"
  And I am on the edit page for "Monkies"
  And I fill in "merge_with" with the id for "Monkies"
  And I press "Merge"
  Then I should see "Cannot merge an article with itself!"


Scenario: fail to merge with an article that does not exist
  Given I am logged into the admin panel
  And I am on the new article page

  When I fill in "article_title" with "Fruit bats"
  And I fill in "article__body_and_extended_editor" with "Fruit bats look super cuddly"
  And I press "Publish"

  When I follow "Fruit bats"
  And I am on the edit page for "Fruit bats"

  And I fill in "merge_with" with the id for "Pineapples"
  And I press "Merge"
  Then I should see "There is no article with that id"

Scenario: A non-admin cannot merge two articles
  Given I am logged in as a non-admin 
  Then I should not see "Users" 
  
