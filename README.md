# hyperledger-composer-bank

This is a minimal implementation of a bank as a business network using Hyperledger Composer.

In case you haven't done yet, please, clone this repository running:
```language-bash
git clone https://github.com/immontilla/hyperledger-composer-bank.git && cd hyperledger-composer-bank
```

Install
```language-bash
npm install
```

Run the tests - test/logic.js & features/sample.feature file
```language-bash
npm test
```

You should see something like
```language-bash
> nyc mocha -t 0 test/*.js && cucumber-js



  #org.example.mynetwork
    ✓ Alice can add assets that she owns
    ✓ Alice cannot add assets that Bob owns
    ✓ Bob can add assets that he owns
    ✓ Bob cannot add assets that Alice owns
    ✓ Alice can submit a transaction from her assets
    ✓ Bob cannot submit a transaction due to Insufficient funds. from his account to Alice account


  6 passing (2s)

----------|----------|----------|----------|----------|-------------------|
File      |  % Stmts | % Branch |  % Funcs |  % Lines | Uncovered Line #s |
----------|----------|----------|----------|----------|-------------------|
All files |        0 |        0 |        0 |        0 |                   |
----------|----------|----------|----------|----------|-------------------|
Feature: Sample

  Scenario: Alice can add assets that she owns
  ✔ Given I have deployed the business network definition ..
  ✔ And I have added the following participants of type org.example.mynetwork.Holder
      | holderId | firstName | lastName |
      | aliceId  | Alice     | A        |
      | bobId    | Bob       | B        |
  ✔ And I have added the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 500     |
      | bob_account1   | bobId   | 200     |
  ✔ And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
  ✔ And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1
  ✔ When I use the identity alice1
  ✔ And I add the following asset of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account2 | aliceId | 300     |
  ✔ Then I should have the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account2 | aliceId | 300     |

  Scenario: Alice cannot add assets that Bob owns
  ✔ Given I have deployed the business network definition ..
  ✔ And I have added the following participants of type org.example.mynetwork.Holder
      | holderId | firstName | lastName |
      | aliceId  | Alice     | A        |
      | bobId    | Bob       | B        |
  ✔ And I have added the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 500     |
      | bob_account1   | bobId   | 200     |
  ✔ And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
  ✔ And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1
  ✔ When I use the identity alice1
  ✔ And I add the following asset of type org.example.mynetwork.Account
      | accountId    | holder | balance |
      | bob_account2 | bobId  | 50      |
  ✔ Then I should get an error matching /does not have .* access to resource/

  Scenario: Bob can add assets that he owns
  ✔ Given I have deployed the business network definition ..
  ✔ And I have added the following participants of type org.example.mynetwork.Holder
      | holderId | firstName | lastName |
      | aliceId  | Alice     | A        |
      | bobId    | Bob       | B        |
  ✔ And I have added the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 500     |
      | bob_account1   | bobId   | 200     |
  ✔ And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
  ✔ And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1
  ✔ When I use the identity bob1
  ✔ And I add the following asset of type org.example.mynetwork.Account
      | accountId    | holder | balance |
      | bob_account3 | bobId  | 400     |
  ✔ Then I should have the following assets of type org.example.mynetwork.Account
      | accountId    | holder | balance |
      | bob_account3 | bobId  | 400     |

  Scenario: Bob cannot add assets that Alice owns
  ✔ Given I have deployed the business network definition ..
  ✔ And I have added the following participants of type org.example.mynetwork.Holder
      | holderId | firstName | lastName |
      | aliceId  | Alice     | A        |
      | bobId    | Bob       | B        |
  ✔ And I have added the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 500     |
      | bob_account1   | bobId   | 200     |
  ✔ And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
  ✔ And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1
  ✔ When I use the identity bob1
  ✔ And I add the following asset of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account3 | aliceId | 400     |
  ✔ Then I should get an error matching /does not have .* access to resource/

  Scenario: Alice can submit a transaction from her account to Bob account
  ✔ Given I have deployed the business network definition ..
  ✔ And I have added the following participants of type org.example.mynetwork.Holder
      | holderId | firstName | lastName |
      | aliceId  | Alice     | A        |
      | bobId    | Bob       | B        |
  ✔ And I have added the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 500     |
      | bob_account1   | bobId   | 200     |
  ✔ And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
  ✔ And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1
  ✔ When I use the identity alice1
  ✔ And I submit the following transaction of type org.example.mynetwork.FundsTransfer
      | sender         | recipient    | amount |
      | alice_account1 | bob_account1 | 100    |
  ✔ Then I should have the following asset of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 400     |
      | bob_account1   | bobId   | 300     |

  Scenario: Bob cannot submit a transaction due to Insufficient funds. from his account to Alice account
  ✔ Given I have deployed the business network definition ..
  ✔ And I have added the following participants of type org.example.mynetwork.Holder
      | holderId | firstName | lastName |
      | aliceId  | Alice     | A        |
      | bobId    | Bob       | B        |
  ✔ And I have added the following assets of type org.example.mynetwork.Account
      | accountId      | holder  | balance |
      | alice_account1 | aliceId | 500     |
      | bob_account1   | bobId   | 200     |
  ✔ And I have issued the participant org.example.mynetwork.Holder#aliceId with the identity alice1
  ✔ And I have issued the participant org.example.mynetwork.Holder#bobId with the identity bob1
  ✔ When I use the identity bob1
  ✔ And I submit the following transaction of type org.example.mynetwork.FundsTransfer
      | sender       | recipient      | amount |
      | bob_account1 | alice_account1 | 1000   |
  ✔ Then I should get an error matching /Insufficient funds./

6 scenarios (6 passed)
48 steps (48 passed)
0m01.876s

```

If everything went OK, run this scripts in strict order
```language-bash
sh scripts/start-dev-environment.sh 
sh scripts/generate-bna.sh
sh scripts/deploy-bna.sh
sh scripts/start-bna.sh
```

If you want to check if everything went OK, run:
```language-bash
composer network list --card admin@hyperledger-composer-bank
```

You should see something like
```
✔ List business network from card admin@hyperledger-composer-bank
models: 
  - org.hyperledger.composer.system
  - org.example.mynetwork
scripts: 
  - lib/logic.js
registries: 
  org.example.mynetwork.Account: 
    id:           org.example.mynetwork.Account
    name:         Asset registry for org.example.mynetwork.Account
    registryType: Asset
  org.example.mynetwork.Holder: 
    id:           org.example.mynetwork.Holder
    name:         Participant registry for org.example.mynetwork.Holder
    registryType: Participant

Command succeeded

```

Finally, run this script
```language-bash
sh scripts/publish-rest-server.sh
```

Now you play, opening http://localhost:3000/explorer in a web browser. You will see the "Hyperledger Composer REST server", a SwaggerUI-styled web.

Additionally, you can run the curl command.

Create one holder
```language-bash
curl -iX POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"$class": "org.example.mynetwork.Holder", "holderId": "1234", "firstName": "bart", "lastName": "simpson" }' 'http://localhost:3000/api/Holder'
```
and set a bank account to him
```language-bash
curl -iX POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.example.mynetwork.Account", "accountId": "BART", "holder": "org.example.mynetwork.Holder#1234", "balance": 300 }' 'http://localhost:3000/api/Account'
```

Create another holder
```language-bash
curl -iX POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"$class": "org.example.mynetwork.Holder", "holderId": "7890", "firstName": "sideshow", "lastName": "bob" }' 'http://localhost:3000/api/Holder'
```
and set a bank account to him too
```language-bash
curl -iX POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.example.mynetwork.Account", "accountId": "BOB", "holder": "org.example.mynetwork.Holder#7890", "balance": 100 }' 'http://localhost:3000/api/Account'
```

You could check the holders running
```language-bash
curl -iX GET --header 'Accept: application/json' 'http://localhost:3000/api/Holder'
```

or check the accounts running
```language-bash
curl -iX GET --header 'Accept: application/json' 'http://localhost:3000/api/Account'
```

To transfer 200 from Bart to Sideshow Bob, run
```language-bash
curl -iX POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.example.mynetwork.FundsTransfer", "sender": "org.example.mynetwork.Account#BART", "recipient": "org.example.mynetwork.Account#BOB", "amount": 200 }' 'http://localhost:3000/api/FundsTransfer'
```

Finally, if you run:
```language-bash
curl -iX GET --header 'Accept: application/json' 'http://localhost:3000/api/Account'
```

You will get
```language-bash
HTTP/1.1 200 OK
Vary: Origin, Accept-Encoding
Access-Control-Allow-Credentials: true
X-XSS-Protection: 1; mode=block
X-Frame-Options: DENY
X-Download-Options: noopen
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Content-Length: 260
ETag: W/"104-ltIIum7o/SCzicWQnkDGczPLxF4"
Date: Wed, 08 Aug 2018 21:02:48 GMT
Connection: keep-alive

[{"$class":"org.example.mynetwork.Account","accountId":"BART","holder":"resource:org.example.mynetwork.Holder#1234","balance":100},{"$class":"org.example.mynetwork.Account","accountId":"BOB","holder":"resource:org.example.mynetwork.Holder#7890","balance":300}]
```
