cd C:\Users\gonzalo.morenoc\AppData\Roaming\npm

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%" 

call newman run POC_API.postman_collection.json -e poc.postman_environment.json -r cli,html,junit --reporter-html-export C:\datos\POC_API\reportsHtml\report_%fullstamp%.html --reporter-junit-export C:\datos\POC_API\reportsJunit\reportJunit_%fullstamp%.xml 
