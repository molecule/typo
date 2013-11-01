Feature: Non-Admin Can't Merge Articles

  As a regular user
  I can't merge articles together
  Too bad

  Background:
    Given the blog is set up 

Scenario: Attempt to merge articles and fail
  Given I am on the new article page
  When I fill in "article_title" with "Fish"
  And I fill in "article__body_and_extended_editor" with "Fish fish eat eat"
  And I press "Publish"
  And I go to the new article page
  And I fill in "article_title" with "Horses"
  And I fill in "article__body_and_extended_editor" with "Horses don't eat horses"
  And I press "Publish"

  When I follow "Fish"
# How to check that you're on the edit page?
  When I am on the edit page for "Fish"
#Then I should see "article__body_and_extended_editor"
  Then I should not see "merge_with"


