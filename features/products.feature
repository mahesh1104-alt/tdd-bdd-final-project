Feature: The product store service back-end
    As a Store Manager
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name       | description     | price | available | category    |
        | Hat        | A blue hat      | 59.95 | True      | Cloths      |
        | Pants      | A pair of pants | 64.95 | False     | Cloths      |
        | Shirt      | A red shirt     | 19.95 | True      | Cloths      |
        | Pots       | Cooking pot set | 89.95 | True      | Housewares  |

Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    Then the "Id" field should be empty
    And the "Name" field should be empty
    And the "Category" field should be empty
    When I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A blue hat" in the "Description" field
    And I should see "59.95" in the "Price" field
    And I should see "True" in the "Available" dropdown
    And I should see "Cloths" in the "Category" dropdown

Scenario: Update a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "Cloths" in the "Category" dropdown
    When I change "Name" to "Fedora"
    And I press the "Update" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Fedora" in the "Name" field
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Fedora" in the results
    And I should not see "Hat" in the results

Scenario: Delete a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Delete" button
    Then I should see the message "Product has been Deleted!"
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should not see "Hat" in the results

Scenario: List all products
    When I visit the "Home Page"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should see "Pants" in the results
    And I should see "Shirt" in the results

Scenario: Search by Category
    When I visit the "Home Page"
    And I select "Cloths" in the "Category" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should not see "Pots" in the results

Scenario: Search by Availability
    When I visit the "Home Page"
    And I select "True" in the "Available" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should not see "Pants" in the results

Scenario: Search by Name
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should not see "Pants" in the results
