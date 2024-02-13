*** Settings ***
Library     Browser
Library     ..//config//utility.py
Resource    vars.robot



*** Keywords ***
Login to imBook
    New Browser                    chromium    #headless=false
    New Context                    viewport={'width': 1920, 'height': 1080}
    New Page                       ${URL}
    Wait Until Network Is Idle
    Fill Text                      ${input-username}    ${User_name}
    Fill Secret                    ${input-password}    ${Pass_word}
    Click                          ${btn-login}
    Wait Until Network Is Idle

Choose Parkplatz
    Select Options By    ${Niedersachsen_path}        label    Niedersachsen
    Select Options By    ${Kattreppeln_path}          label    Kattreppeln 20
    Select Options By    ${NDS_Parkplatz_path}        label    NDS Parkplatz
    Select Options By    ${Parkplatz_path}            label    Parkplatz
    

Choose Katterppeln
    Select Options By    ${Niedersachsen_path}        label    Niedersachsen
    Select Options By    ${Kattreppeln_path}          label    Kattreppeln 20


Reserve parking if available
    ${text}               Check OrNo

    ${count}              Get Element Count    //*[count(p) = 1 and contains(p, '${text}')]

    ${successful_ico}     Get AbsPath    ico_name=successful.ico
    ${unsuccessful_ico}   Get AbsPath    ico_name=unsuccessful.ico

    IF  ${count} > 0

        Log      You saved a place for parking       level=WARN
        Click    (//div[@class='is-align-self-center'][count(p) = 1 and contains(p, '${text}')])[1]
        Show Notification    Reservation successful    You have successfully saved a parking slot for OrNo    ${successful_ico}
    
    ELSE
        Log    No place for parking       level=WARN
        Show Notification    Reservation unsuccessful    You couldn't save a place for your car.    ${unsuccessful_ico}
    END


Reserve a desk-place 
    
    ${successful_ico}     Get AbsPath    ico_name=successful.ico
    ${unsuccessful_ico}   Get AbsPath    ico_name=unsuccessful.ico

    ${text}               Get Next Day
    ${day_number}         Get Current Day Number    ${text[0:2]}

    ${count}              Get Element Count    //div[@id='location_0_building_0_room_1_workspace_4_${day_number}_container']/div//*[count(p) = 1 and contains(p, '${text}')]
    

    IF  ${count} > 0
        Click    //div[@id='location_0_building_0_room_1_workspace_4_${day_number}_container']/div//*[count(p) = 1 and contains(p, '${text}')]
        Show Notification    title=Reservation successful    message=Your reservation was successful for tomorrow ${text} on the right Office   _icon=${successful_ico}
    
    ELSE
        Show Notification    title=Reservation unsuccessful    message=Your reservation was NOT successful for tomorrow ${text} on the right Office   _icon=${unsuccessful_ico}

        
    END
    

*** Test Cases ***

Open imBook and reserve a parking spot
    Login to imBook
    Choose Parkplatz
    Reserve parking if available
    

Get available seats
    Login to imBook
    Choose Katterppeln
    Reserve a desk-place
