
*** Variables ***
${URL}                           https://arbeitsplatz.imbus.de/reservation

${User_name}                     %{USERNAME}
${Pass_word}                     %PASSWORD

${input-username}                \#input-username
${input-password}                \#input-password
${btn-login}                     \#btn-login

${Niedersachsen_path}            //*[@id="filterBar"]/div/span[2]/div/select
${Kattreppeln_path}              //*[@id="filterBar"]/div/span[3]/div/select
${NDS_Parkplatz_path}            //*[@id="filterBar"]/div/span[4]/div/select
${Parkplatz_path}                //*[@id="filterBar"]/div/span[5]/div/select