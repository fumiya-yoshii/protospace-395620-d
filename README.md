# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 3.2.0
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

********************************
________________________________________________________________
## users table
| Column | Type | Options                     |
|--------|------|-----------------------------|
| email  | string | NOT NULL, unique: true    |
| encrypted_password | string | NOT NULL      |
| name   | string    | NOT NULL               |
| profile     | text | NOT NULL               |
| occupation  | text | NOT NULL               |
| position    | text | NOT NULL               |

## Association information

- has_many : prototypes
- has_many : comments
________________________________________________________________
## comments table
| Column | Type | Options                     |
|--------|------|-----------------------------|
| content | text | NOT NULL                   |
| prototype | reference | NOT NULL,foreign_key: true  |
| user | reference | NOT NULL,foreign_key: true|

## Authentication information

- belongs_to : user
- belongs_to :prototype

________________________________________________________________
## prototype table
| Column   | Type | Options                      |
|-------------|----------------------------------|
| title       | string    | NOT NULL             |
| catch_copy  | text      | NOT NULL             |
| concept     | text      | NOT NULL             |
| user        | reference | NOT NULL,foreign_key: true |

## Association information
- has_many : comments
- belongs_to : user