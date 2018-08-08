Feature: Sample

    Background:
        Given I have deployed the business network definition ..
        And I have added the following participants of type org.example.mynetwork.Holder
            | holderId | firstName | lastName |
            | aliceId  | Alice     | A        |
            | bobId    | Bob       | B        |
        And I have added the following assets of type org.example.mynetwork.Account
            | accountId      | holder  | balance |
            | alice_account1 | aliceId | 500     |
            | bob_account1   | bobId   | 200     |
        And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
        And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1

    Scenario: Alice can add assets that she owns
        When I use the identity alice1
        And I add the following asset of type org.example.mynetwork.Account
            | accountId      | holder  | balance |
            | alice_account2 | aliceId | 300     |
        Then I should have the following assets of type org.example.mynetwork.Account
            | accountId      | holder  | balance |
            | alice_account2 | aliceId | 300     |

    Scenario: Alice cannot add assets that Bob owns
        When I use the identity alice1
        And I add the following asset of type org.example.mynetwork.Account
            | accountId    | holder  | balance |
            | bob_account2 | bobId   | 50      |
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Bob can add assets that he owns
        When I use the identity bob1
        And I add the following asset of type org.example.mynetwork.Account
            | accountId    | holder | balance |
            | bob_account3 | bobId  | 400     |
        Then I should have the following assets of type org.example.mynetwork.Account
            | accountId    | holder | balance |
            | bob_account3 | bobId  | 400     |

    Scenario: Bob cannot add assets that Alice owns
        When I use the identity bob1
        And I add the following asset of type org.example.mynetwork.Account
            | accountId      | holder  | balance |
            | alice_account3 | aliceId | 400     |
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Alice can submit a transaction from her account to Bob account
        When I use the identity alice1
        And I submit the following transaction of type org.example.mynetwork.FundsTransfer
            | sender         | recipient    | amount |
            | alice_account1 | bob_account1 | 100    |
        Then I should have the following asset of type org.example.mynetwork.Account
            | accountId      | holder  | balance |
            | alice_account1 | aliceId | 400     |
            | bob_account1   | bobId   | 300     |

    Scenario: Bob cannot submit a transaction due to Insufficient funds. from his account to Alice account
        When I use the identity bob1
        And I submit the following transaction of type org.example.mynetwork.FundsTransfer
            | sender         | recipient      | amount |
            | bob_account1   | alice_account1 | 1000   |
        Then I should get an error matching /Insufficient funds./