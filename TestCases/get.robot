*** Settings ***
Library   RequestsLibrary
Library   Collections

*** Variables ***
${basrurl}   https://reqres.in
${users}     /api/users?page=2
${singleuser}  /api/users/2
${listresources}  /api/unknown
${singleresources}  /api/unknown/2
${postuser}     /api/users
${putuser}    /api/users/2
${register}  /api/register
${login}    /api/login
${deleteapi}  /api/users/2

*** Test Cases ***

GetlistUsers
    [Tags]    Demo
    create session   session  ${basrurl}
   ${response}=   get on session  session    ${users}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200
   ${content}=   convert to string  ${response.content}
   should contain  ${content}   2
   ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
   should be equal  ${contenttypevalue}    application/json; charset=utf-8
####################TC2
GetSingleUser
    [Tags]   singleuser
       create session   session  ${basrurl}
       ${response}=   get on session  session    ${singleuser}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   janet.weaver@reqres.in
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8
###########################TC3
ListResources
    [Tags]  listresources
       create session   session  ${basrurl}
       ${response}=   get on session  session    ${listresources}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   cerulean
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8

###############TC4
SingleResources
    [Tags]  singleresources
       create session   session  ${basrurl}
       ${response}=   get on session  session    ${singleresources}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   fuchsia rose
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8
####################TC5
PostUser
    [Tags]  postuser
       create session   session  ${basrurl}
       ${body}=  Create Dictionary  name=mohamed job=tester
       ${response}=   post on session  session    ${postuser}  ${body}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   201
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   mohamed
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8



####################TC6
PutUser
    [Tags]  putuser
       create session   session  ${basrurl}
       ${body}=  Create Dictionary  name=walled job=developer
       ${response}=   put on session  session    ${putuser}  ${body}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   walled
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8
####################TC7
Register
    [Tags]  register
       create session   session  ${basrurl}
       ${body}=  Create Dictionary  email=eve.holt@reqres.in  password=pistol
       ${response}=   post on session  session    ${register}  ${body}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   QpwL5tke4Pnpja7X4
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8
####################TC8
Login
    [Tags]  login
       create session   session  ${basrurl}
       ${body}=  Create Dictionary  email=eve.holt@reqres.in  password=cityslicka
       ${response}=   post on session  session    ${login}  ${body}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
       ${content}=   convert to string  ${response.content}
       should contain  ${content}   QpwL5tke4Pnpja7X4
       ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
       should be equal  ${contenttypevalue}    application/json; charset=utf-8
###############################TC9
Delete
    [Tags]  deleteapi
       create session   session  ${basrurl}
       ${response}=   delete on session  session    ${deleteapi}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   204



