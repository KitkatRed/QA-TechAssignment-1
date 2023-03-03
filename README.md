# QA TechAssignment 1
The Oppenheimer Project for QA Tech Assignment 1

# The Oppeheimer Project
## BACKGROUND
In the year 1969, the City of Carson is a growing city that housed close to
millions of working class heroes^. To support the growing city population, a
bill was passed that:
‘ each working class hero is to contribute a fraction of their yearly
income towards city building ’
This year, as part of the governor’s initiative to pony up surplus cash in
the vault, each working class hero is gifted with taxation relief as
recognition for their voluntary contribution to city building efforts.
To facilitate this, the governor has drafted out the Oppenheimer Project.
This is a software system that has to support 3 features:
- Enable Clerks to populate a list of working class heroes to the system
- Enable Bookkeepers to retrieve the payable taxation relief for each
working class
- Enable Governor to dispense the money to each working class hero at her
discretion
^: also known as employees

## How to setup the application and database
### To start the application you can run the following commands in your terminal

1. docker-compose -f {path-to-this-docker-file}/local-docker-compose.yml up -d
2. Verify that your database is up and running. The credentials are
   - a. Url: jdbc:mariadb://localhost:3306/testdb
   - b. Username: user
   - c. Password: pwd
3. Run java -Dspring.profiles.active=maria -jar
{path-to-this-jar}/OppenheimerProjectDev.jar
- You may download the Jar file from the Link: https://drive.google.com/file/d/1Ocvp2i5fkZnqNoAKD7GUwxSpJ9kpGuli/view?usp=share_link
  
4. Verify that you can access the login page via http://localhost:9997/login
5. Login credentials for various roles:

| Role       | Username | Password |
|------------|---------:|---------:|
| Clerk      | clerk    | pwd      |
| BookKeeper | bk       | pwd      |
| Governor   | gov      | pwd      |

Tips:
- Focus more on the functionality of the application
- Automation
- Exploratory testing

-------

## USER STORIES
### (User Story 1) Application allows the creation of a single working class hero via API call.

AC1: POST request /api/v1/hero with the following payload:
#### Payload 
``` 
{
    "natid": <natid>,
    "name": <name>,
    "gender": <gender>,
    "birthDate": <birthDate>,
    "deathDate": <deathDate>,
    "salary": <salary>,
    "taxPaid": <taxPaid>,
    "browniePoints": <browniePoints>
 } 
``` 
#### Example
``` 
{
        "natid": natid-12,
        "name": hello,
        "gender": MALE,
        "birthDate": 2020-01-01,
        "deathDate": null,
        "salary": 10.00,
        "taxPaid": 1.00,
        "browniePoints": 9
} 
```

AC2: Field validations are as follow
- natid must be in this format - natid- number , where number is between 0 to
9999999
- name must contain alphabets and spaces and length of name between 1 and 100
- gender must be either MALE or FEMALE
- birthDate format is in yyyy-mm-dd and cannot be a future date.
- deathDate format is in yyyy-mm-dd
- salary is a decimal and cannot be negative
- taxPaid is a decimal and cannot be negative
- browniePoints and deathDate are nullable

AC3: If the natid already exists in the database, return error status code 400 . No changes
should be made to the existing record.

AC4 : Verify record is created in database table WORKING_CLASS_HEROES .

-------


### (User Story 2) As the Clerk, I should be able to upload a csv file through the portal so that I can populate the database from a UI.

AC1: When I Iog in as a Clerk, I should be able to upload a csv file to create multiple heroes
when I click on "Upload a CSV file" button.
![US2AC1](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US2_AC1.png)

AC2 : The CSV file format is as follows which contains the data to be inserted :
```
< natid >, < name >, < gender >, < birthDate >, < deathDate >, < salary >, < taxPaid >, < browniePoints>
```

AC3 : When I click on Create after I upload the csv file, I should see a success notification.
All records are persisted successfully into the database table WORKING_CLASS_HEROES.
![USAC3](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US2_AC3.png)

AC4 : There is an erroneous record in the csv file. When I click on Create after I upload the
csv file, I should see a failure notification stating that the SUT failed to persist that record. All
records which passed validation will still be persisted in WORKING_CLASS_HEROES .
![US2AC4](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US2_AC4.png)


-------

### (User Story 3) As the Book Keeper, I should be able to generate a Tax Relief Egress File from the UI

AC1: When I Iog in as a Book Keeper, I should be able to generate a tax relief egress file
taxrelief .txt by clicking the Generate Tax Relief File button
![US3AC1](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US3_AC1.png)

AC2: File contain a body where each line is in the format: 
```
<natid>, <tax relief amount>
```
,followed by a footer which is a number that indicates the total number of records written to the
file

AC3: If there are no records to be generated, a file is still being generated containing only the
footer

AC4: Each time a file process is being triggered, a file of FILE_TYPE: TAX_RELIEF record
is being persisted into a database table FILE containing the file status, total count of records
being written into file. File statuses are PROCESSING , COMPLETED , ERROR


-------


### (User Story 4) As the Governor, I want to search for a hero using name or natid.

AC1: When I login as a Governor, I should be able to click on the List All button to
see the heroes.
![US4AC1](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US4_AC1.png)

AC2: I can search for any hero by typing their natid into the search bar.
![US4AC2](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US4_AC2.png)

AC3: I can search for any hero by typing their name into the search bar.
![US4AC3](https://github.com/KitkatRed/QA-TechAssignment-1/blob/main/images/US4_AC3.png)