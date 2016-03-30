*** Settings ***
Library  Selenium2Screenshots
Library  String
Library  DateTime
Library  etender_service.py

*** Variables ***
${locator.tenderId}                                            id=tenderidua
${locator.title}                                               jquery=tender-subject-info>div.row:contains("Назва закупівлі:")>:eq(1)>
${locator.description}                                         jquery=tender-subject-info>div.row:contains("Детальний опис закупівлі:")>:eq(1)>
${locator.minimalStep.amount}                                  xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[9]
${locator.procuringEntity.name}                                jquery=customer-info>div.row:contains("Найменування:")>:eq(1)>
${locator.value.amount}                                        id=totalvalue
${locator.tenderPeriod.startDate}                              xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[3]
${locator.tenderPeriod.endDate}                                xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[4]
${locator.enquiryPeriod.startDate}                             xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[1]
${locator.enquiryPeriod.endDate}                               xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[2]
${locator.items[0].description}                                xpath=//div[6]/div[4]/div[2]/p
${locator.items[0].deliveryDate.endDate}                       xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[14]
${locator.items[0].deliveryLocation.latitude}                  id=delivery_latitude0
${locator.items[0].deliveryLocation.longitude}                 id=delivery_longitude0
${locator.items[0].deliveryAddress.postalCode}                 xpath=//div[@class='col-sm-8']//span[@ng-if='item.deliveryAddress.postIndex']
${locator.items[0].deliveryAddress.countryName}                xpath=//div[@class='col-sm-8']//span[@ng-if='item.deliveryAddress.country.title']
${locator.items[0].deliveryAddress.region}                     xpath=//div[@class='col-sm-8']//span[@ng-if='item.deliveryAddress.region.title']
${locator.items[0].deliveryAddress.locality}                   xpath=//div[@class='col-sm-8']//span[@ng-if='item.deliveryAddress.city.title']
${locator.items[0].deliveryAddress.streetAddress}              xpath=//div[@class='col-sm-8']//span[@ng-if='item.deliveryAddress.addressStr']
${locator.items[0].classification.scheme}                      xpath=//div[6]/div[2]/div/p
${locator.items[0].classification.id}                          xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[10]
${locator.items[0].classification.description}                 xpath=(//div[@class = 'col-sm-8']/p[@class='ng-binding'])[10]
${locator.items[0].additionalClassifications[0].scheme}        xpath=//div[6]/div[3]/div/p
${locator.items[0].additionalClassifications[0].id}            id=additionalClassification_id0
${locator.items[0].additionalClassifications[0].description}   id=additionalClassification_desc0
${locator.items[0].unit.code}                                  id=item_unit_symb0
${locator.items[0].quantity}                                   id=item_quantity0
${locator.questions[0].title}                                  id=question_title_0
${locator.questions[0].description}                            id=question_descr_0
${locator.questions[0].date}                                   id=question_date_0
${locator.questions[0].answer}                                 id=question_answer_0
${locator.value.currency}                                      id=id_UAH
${locator.value.valueAddedTaxIncluded}                         xpath=//div[2]/p/i
${locator.items[0].unit.name}                                  id=item_unit_symb0
${locator.bids}                                                id=ParticipiantInfo_0
*** Keywords ***
Підготувати дані для оголошення тендера
  ${INITIAL_TENDER_DATA}=  prepare_test_tender_data
  ${INITIAL_TENDER_DATA}=  Add_data_for_GUI_FrontEnds  ${INITIAL_TENDER_DATA}
  [return]   ${INITIAL_TENDER_DATA}

Підготувати клієнт для користувача
  [Arguments]  ${username}
  [Documentation]  Відкрити браузер, створити об’єкт api wrapper, тощо
  Open Browser  ${USERS.users['${username}'].homepage}  ${USERS.users['${username}'].browser}  alias=${username}
  Set Window Size  @{USERS.users['${username}'].size}
  Set Window Position  @{USERS.users['${username}'].position}
  Run Keyword If  '${username}' != 'E-tender_Viewer'  Login  ${username}

Login
  [Arguments]  ${username}
  Wait Until Page Contains Element   id=linkLogin     180
  Sleep    1
  Click Link    d=linkLogin
  Sleep    1
  Wait Until Page Contains Element   id=inputUsername   180
  Sleep  1
  Input text   id=inputUsername      ${USERS.users['${username}'].login}
  Wait Until Page Contains Element   id=inputPassword   180
  Sleep  1
  Input text   id=inputPassword      ${USERS.users['${username}'].password}
  Click Button   id=btn_submit
  Go To  ${USERS.users['${username}'].homepage}

Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ${tender_data}=  Add_data_for_GUI_FrontEnds  ${ARGUMENTS[1]}
  ${tender_data}=  procuring_entity_name  ${tender_data}
  ${items}=         Get From Dictionary   ${tender_data.data}               items
  ${title}=         Get From Dictionary   ${tender_data.data}               title
  ${description}=   Get From Dictionary   ${tender_data.data}               description
  ${budget}=        Get From Dictionary   ${tender_data.data.value}         amount
  ${step_rate}=     Get From Dictionary   ${tender_data.data.minimalStep}   amount
  ${items_description}=   Get From Dictionary   ${items[0]}         description
  ${quantity}=      Get From Dictionary   ${items[0]}                        quantity
  ${cpv}=           Get From Dictionary   ${items[0].classification}         id
  ${unit}=          Get From Dictionary   ${items[0].unit}                   name
  ${latitude}       Get From Dictionary   ${items[0].deliveryLocation}    latitude
  ${longitude}      Get From Dictionary   ${items[0].deliveryLocation}    longitude
  ${postalCode}    Get From Dictionary   ${items[0].deliveryAddress}     postalCode
  ${streetAddress}    Get From Dictionary   ${items[0].deliveryAddress}     streetAddress
  ${deliveryDate}   Get From Dictionary   ${items[0].deliveryDate}        endDate
  ${deliveryDate}   convert_date_to_etender_format        ${deliveryDate}
  ${start_date}=    Get From Dictionary   ${tender_data.data.tenderPeriod}   startDate
  ${start_date}=    convert_date_to_etender_format   ${start_date}
  ${start_time}=    Get From Dictionary   ${tender_data.data.tenderPeriod}   startDate
  ${start_time}=    convert_time_to_etender_format   ${start_time}
  ${end_date}=      Get From Dictionary   ${tender_data.data.tenderPeriod}   endDate
  ${end_date}=      convert_date_to_etender_format   ${end_date}
  ${end_time}=      Get From Dictionary   ${tender_data.data.tenderPeriod}   endDate
  ${end_time}=   convert_time_to_etender_format      ${end_time}
  ${enquiry_end_date}=   Get From Dictionary         ${tender_data.data.enquiryPeriod}   endDate
  ${enquiry_end_date}=   convert_date_to_etender_format   ${enquiry_end_date}
  ${enquiry_end_time}=   Get From Dictionary              ${tender_data.data.enquiryPeriod}   endDate
  ${enquiry_end_time}=   convert_time_to_etender_format   ${enquiry_end_time}

  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Wait Until Page Contains          Мої закупівлі   10
  Sleep  1
  Click Element                     xpath=//a[contains(@class, 'ng-binding')][./text()='Мої закупівлі']
  Sleep  5
  Wait Until Page Contains Element  xpath=//a[contains(@class, 'btn btn-info')]
  Click Element                     xpath=//a[contains(@class, 'btn btn-info')]
  Wait Until Page Contains Element  id=title
  Input text    id=title                  ${title}
  Input text    id=description            ${description}
  Input text    id=value                  ${budget}
  Click Element                     xpath=//div[contains(@class, 'form-group col-sm-6')]//input[@type='checkbox']
  Input text    id=minimalStep            ${step_rate}
  Input text    id=itemsDescription0      ${items_description}
  Input text    id=itemsQuantity0         ${quantity}
  Input text    name=delStartDate0        ${deliveryDate}
  Sleep  2
  Input text    name=delEndDate0          ${deliveryDate}
#  Input text    name=latitude             ${latitude}
#  Input text    name=longitude            ${longitude}
  Click Element   xpath=//select[@name='region']//option[@label='Київська']
  Sleep  2
  Click Element   xpath=//select[@name='city']//option[@label='Київ']
  Input text    name=addressStr   ${streetAddress}
  Input text    name=postIndex    ${postalCode}
  Wait Until Page Contains Element  xpath=//select[@name="itemsUnit0"]/option[@value='kilogram']
  Click Element  xpath=//select[@name="itemsUnit0"]/option[@value='kilogram']
  Input text    xpath=//div[contains(@class, 'form-group col-sm-8')]//input[@name='enqPEndDate']   ${enquiry_end_date}
  Input text    xpath=//div[contains(@class, 'form-group col-sm-8')]//div[contains(@class, 'col-sm-2')]//input[@ng-model='data.enquiryPeriod.endDate']   ${enquiry_end_time}
  Input text    xpath=//div[contains(@class, 'form-group col-sm-8')]//input[@name='startDate']   ${start_date}
  Input text    xpath=//div[contains(@class, 'form-group col-sm-8')]//div[contains(@class, 'col-sm-2')]//input[@ng-model='data.tenderPeriod.startDate']   ${start_time}
  Input text    xpath=//div[contains(@class, 'form-group col-sm-8')]//input[@name='endDate']   ${end_date}
  Input text    xpath=//div[contains(@class, 'form-group col-sm-8')]//div[contains(@class, 'col-sm-2')]//input[@ng-model='data.tenderPeriod.endDate']   ${end_time}
  Sleep  2
  Click Element  xpath=//input[starts-with(@ng-click, 'openClassificationModal')]
  Sleep  1
  Input text     xpath=//div[contains(@class, 'modal-content')]//input[@ng-model='searchstring']  ${cpv}
  Wait Until Element Is Visible  xpath=//td[contains(., '${cpv}')]
  Sleep  2
  Click Element  xpath=//td[contains(., '${cpv}')]
  Sleep  1
  Click Element  xpath=//div[@id='classification']//button[starts-with(@ng-click, 'choose(')]
  Sleep  1
  Додати предмет   ${items[0]}   0
  Run Keyword if   '${mode}' == 'multi'   Додати багато предметів   items
  Sleep  1
  Wait Until Page Contains Element   xpath=//div[contains(@class, 'form-actions')]//button[@type='submit']
  Click Element   xpath=//div[contains(@class, 'form-actions')]//button[@type='submit']
  Sleep  1
  Wait Until Page Contains    [ТЕСТУВАННЯ]   10
  Sleep   20
  Click Element   xpath=//*[text()='${title}']
  Sleep   5
  ${tender_UAid}=  Get Text  xpath=//div[contains(@class, "panel-heading")]
  ${tender_UAid}=  Get Substring  ${tender_UAid}   10
  ${Ids}=   Convert To String   ${tender_UAid}
  Run keyword if   '${mode}' == 'multi'   Set Multi Ids   ${ARGUMENTS[0]}   ${tender_UAid}
  [return]  ${Ids}

Set Multi Ids
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  ${tender_UAid}
  ${current_location}=      Get Location
  ${id}=    Get Substring   ${current_location}   10
  ${Ids}=   Create List     ${tender_UAid}   ${id}

Додати предмет
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  items
  ...      ${ARGUMENTS[1]} ==  ${INDEX}
  ${dkpp_desc}=     Get From Dictionary   ${ARGUMENTS[0].additionalClassifications[0]}   description
  ${dkpp_id}=       Get From Dictionary   ${ARGUMENTS[0].additionalClassifications[0]}   id
  Sleep  2
  Click Element                      xpath=(//input[starts-with(@ng-click, 'openAddClassificationModal')])[${ARGUMENTS[1]}+1]
  Wait Until Element Is Visible      xpath=//div[contains(@id,'addClassification')]
  Sleep  1
  Input text                         xpath=//div[contains(@class, 'modal fade ng-scope in')]//input[@ng-model='searchstring']    ${dkpp_desc}
  Wait Until Element Is Visible      xpath=//td[contains(., '${dkpp_id}')]
  Sleep  2
  Click Element                      xpath=//td[contains(., '${dkpp_id}')]
  Click Element                      xpath=//div[@id='addClassification']//button[starts-with(@ng-click, 'choose(')]
  Sleep  2

Додати багато предметів
  [Arguments]  @{ARGUMENTS}
  [Documentation]e '${question.data.id}' failed: AttributeError: 'NoneType' object has no attribute 'data'

  ...      ${ARGUMENTS[0]} ==  items
  ${Items_length}=   Get Length   ${items}
  : FOR    ${INDEX}    IN RANGE    1    ${Items_length}
  \   Click Element   xpath=.//*[@id='myform']/tender-form/div/button
  \   Додати предмет   ${items[${INDEX}]}   ${INDEX}

Клацнути і дочекатися
  [Arguments]  ${click_locator}  ${wanted_locator}  ${timeout}
  [Documentation]
  ...      click_locator: Where to click
  ...      wanted_locator: What are we waiting for
  ...      timeout: Timeout
  Click Link  ${click_locator}
  Wait Until Page Contains Element  ${wanted_locator}  ${timeout}

Шукати і знайти
  Клацнути і дочекатися  jquery=a[ng-click='search()']  jquery=a[href^="#/tenderDetailes"]  5

Пошук тендера по ідентифікатору
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  Switch browser   ${ARGUMENTS[0]}
  Go To  ${USERS.users['${ARGUMENTS[0]}'].homepage}
  Wait Until Page Contains   Прозорі закупівлі    60
  sleep  1
  Wait Until Page Contains Element    xpath=//input[@type='text']    180
  sleep  1
  Wait Until Element Is Visible    xpath=//input[@type='text']    180
  sleep  3  
  Input Text    xpath=//input[@type='text']    ${ARGUMENTS[1]}
  sleep  1
  ${timeout_on_wait}=  Get Broker Property By Username  ${ARGUMENTS[0]}  timeout_on_wait
  ${passed}=  Run Keyword And Return Status  Wait Until Keyword Succeeds  ${timeout_on_wait} s  0 s  Шукати і знайти
  Run Keyword Unless  ${passed}  Fatal Error  Тендер не знайдено за ${timeout_on_wait} секунд
  sleep  3
  Wait Until Page Contains Element    jquery=a[href^="#/tenderDetailes"]    180
  sleep  1
  Click Link    jquery=a[href^="#/tenderDetailes"]
  Wait Until Page Contains    ${ARGUMENTS[1]}   60
  sleep  1
  Capture Page Screenshot

Завантажити документ в ставку
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${Complain}
  Pass   Manual test

Змінити документ в ставці
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${Complain}
  Pass   Manual test

Подати скаргу
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${Complain}
  Fail  Не реалізований функціонал

порівняти скаргу
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${file_path}
  ...      ${ARGUMENTS[2]} ==  ${TENDER_UAID}
  Fail  Не реалізований функціонал

Подати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${test_bid_data}
  Log  ${ARGUMENTS[0]}
  Log  ${ARGUMENTS[1]}
  Log  ${ARGUMENTS[2]}
  ${amount}=    Get From Dictionary     ${ARGUMENTS[2].data.value}         amount
  sleep  60
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Page Contains          Інформація про процедуру закупівлі    10
  sleep  5
  Wait Until Page Contains Element          xpath=//input[@name='amount0']    30
  Input text    xpath=//input[@name='amount0']                  ${amount}
  Click Element                     xpath=//div[@id='addBidDiv']/form/div/div[2]/div[3]/button
  sleep  3
  Click Element    xpath=//div[@id='modalAddBidWarning']/div/div/div[3]/div[2]/button
  sleep  10

Змінити цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${test_bid_data}
  Log  ${ARGUMENTS[2]}
  ${amount}=    Get From Dictionary     ${ARGUMENTS[2].data.value}    amount
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Page Contains          Інформація про процедуру закупівлі    10
  Wait Until Page Contains Element          id=amount   10
  Input text    id=amount                  ${amount}
  Click Element                     xpath=//button[contains(@class, 'btn btn-success')][./text()='Реєстрація пропозиції']
  DEBUG
  Click Element               xpath=//div[@class='row']/button[@class='btn btn-success']
  sleep  10

скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element               xpath=//div[3]/button[2]
  sleep  10

Оновити сторінку з тендером
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  etender.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Reload Page

Задати питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = question_data

  ${title}=        Get From Dictionary  ${ARGUMENTS[2].data}  title
  ${description}=  Get From Dictionary  ${ARGUMENTS[2].data}  description

  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  3
  Page Should Contain Link    xpath=//a[contains(@href,'#/addQuestion/')]    50 
  Click Element                      xpath=//a[contains(@href,'#/addQuestion/')]
  Wait Until Page Contains Element   id=title
  Sleep  2
  Input text                         id=title                 ${title}
  Input text                         id=description           ${description}
  Click Element                      xpath=//button[@type='submit']

Відповісти на питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data

  ${answer}=     Get From Dictionary  ${ARGUMENTS[3].data}  answer

  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Page Contains Element   xpath=//pre[@class='ng-binding'][text()='Додати відповідь']   10
  Click Element                      xpath=//pre[@class='ng-binding'][text()='Додати відповідь']
  Input text                         xpath=//div[@class='editable-controls form-group']//textarea            ${answer}
  Click Element                      xpath=//span[@class='editable-buttons']/button[@type='submit']

Внести зміни в тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ${period_interval}=  Get Broker Property By Username  ${ARGUMENTS[0]}  period_interval
  ${ADDITIONAL_DATA}=  prepare_test_tender_data  ${period_interval}  single
  ${tender_data}=   Add_data_for_GUI_FrontEnds   ${ADDITIONAL_DATA}
  ${items}=         Get From Dictionary   ${tender_data.data}               items
  ${description}=   Get From Dictionary   ${tender_data.data}               description
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Page Contains Element   xpath=//a[@class='btn btn-primary ng-scope']   10
  Click Element              xpath=//a[@class='btn btn-primary ng-scope']
  Sleep  2
  Input text               id=description    ${description}
  Click Element              xpath=//button[@class='btn btn-info ng-isolate-scope']
  Capture Page Screenshot

додати предмети закупівлі
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} =  3
  ${period_interval}=  Get Broker Property By Username  ${ARGUMENTS[0]}  period_interval
  ${ADDITIONAL_DATA}=  prepare_test_tender_data  ${period_interval}  multi
  ${tender_data}=   Add_data_for_GUI_FrontEnds   ${ADDITIONAL_DATA}
  ${items}=         Get From Dictionary   ${tender_data.data}               items
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Run keyword if   '${TEST NAME}' == 'Можливість додати позицію закупівлі в тендер'   додати позицію
  Run keyword if   '${TEST NAME}' != 'Можливість додати позицію закупівлі в тендер'   видалити позиції

додати позицію
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  2
  Click Element                     xpath=//a[@class='btn btn-primary ng-scope']
  Sleep  2
  : FOR    ${INDEX}    IN RANGE    1    ${ARGUMENTS[2]} +1
  \   Click Element   xpath=.//*[@id='myform']/tender-form/div/button
  \   Додати предмет   ${items[${INDEX}]}   ${INDEX}
  Sleep  2
  Click Element   xpath=//div[@class='form-actions']/button[./text()='Зберегти зміни']
  Wait Until Page Contains    [ТЕСТУВАННЯ]   10

видалити позиції
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element                     xpath=//a[@class='btn btn-primary ng-scope']
  Sleep  2
  : FOR    ${INDEX}    IN RANGE    1    ${ARGUMENTS[2]} +1
  \   Click Element   xpath=(//button[@class='btn btn-danger ng-scope'])[last()]
  \   Sleep  1
  Sleep  2
  Wait Until Page Contains Element   xpath=//div[@class='form-actions']/button[./text()='Зберегти зміни']   10
  Click Element   xpath=//div[@class='form-actions']/button[./text()='Зберегти зміни']
  Wait Until Page Contains    [ТЕСТУВАННЯ]   10

Отримати інформацію із тендера
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  fieldname
  Switch browser   ${ARGUMENTS[0]}
  Run Keyword And Return  Отримати інформацію про ${ARGUMENTS[1]}

Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  sleep  3
#  відмітити на сторінці поле з тендера   ${fieldname}   ${locator.${fieldname}}
  Wait Until Page Contains Element    ${locator.${fieldname}}    180
  Sleep  1
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [return]  ${return_value}

Отримати інформацію про title
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [return]  ${return_value}

Отримати інформацію про description
  ${return_value}=   Отримати текст із поля і показати на сторінці   description
  [return]  ${return_value}

Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [return]  ${return_value}

Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці  value.amount
##  ${return_value}=   Evaluate   "".join("${return_value}".split(' ')[:-3])
  log  ${return_value}
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryLocation.latitude
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryLocation.latitude
##  ${return_value}=   Evaluate   "".join("${return_value}".split(' ')[:-3])
  log  ${return_value}
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryLocation.longitude
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryLocation.longitude
##  ${return_value}=   Evaluate   "".join("${return_value}".split(' ')[:-3])
  log  ${return_value}
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.currency
  [return]  ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded  
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  Log  ${return_value}  
  ${return_value}=	Run Keyword If	'ПДВ' in '${return_value}'	Set Variable	True
		...  ELSE	Set Variable	False
  Log  ${return_value} 
  ${return_value}=   Convert To Boolean   ${return_value}
  Log  ${return_value} 
  [return]  ${return_value}

Отримати інформацію про items[0].unit.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.name
  Run Keyword And Return If  '${return_value}'== 'кг.'   Convert To String  кілограм
  [return]  ${return_value}

Отримати інформацію про bids
  ${return_value}=   Отримати текст із поля і показати на сторінці   bids
  Log  ${return_value}  
  ${return_value}=	Run Keyword If	 in '${return_value}'	Set Variable	True
		...  ELSE	Set Variable	False
  Log  ${return_value}  
  [return]  ${return_value}


Відмітити на сторінці поле з тендера
  [Arguments]   ${fieldname}  ${locator}
  ${last_note_id}=  Add pointy note   ${locator}   Found ${fieldname}   width=200  position=bottom
  Align elements horizontally    ${locator}   ${last_note_id}
  sleep  1
  Remove element   ${last_note_id}

Отримати інформацію про tenderId
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderId
  [return]  ${return_value}

Отримати інформацію про procuringEntity.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   procuringEntity.name
  [return]  ${return_value}

Отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  tenderPeriod.startDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

Отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  tenderPeriod.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

Отримати інформацію про enquiryPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  enquiryPeriod.startDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  enquiryPeriod.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

Change_date_to_month
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]}  ==  date
  ${day}=   Get Substring   ${ARGUMENTS[0]}   0   2
  ${month}=   Get Substring   ${ARGUMENTS[0]}  3   6
  ${year}=   Get Substring   ${ARGUMENTS[0]}   5
  ${return_value}=   Convert To String  ${month}${day}${year}
  [return]  ${return_value}

Отримати інформацію про items[0].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].description
  [return]  ${return_value}

Отримати інформацію про items[0].unit.code
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.code
  Run Keyword And Return If  '${return_value}'== 'кг.'   Convert To String  KGM
  [return]  ${return_value}

Отримати інформацію про items[0].quantity
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].quantity
 ## ${return_value}=   Get Substring  ${return_value}   0   4
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}

Отримати інформацію про items[0].classification.scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.scheme
  ${return_value}=   Get Substring  ${return_value}   0   -1
  [return]  ${return_value.split(' ')[1]}

Отримати інформацію про items[0].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.description
  ${return_value}=   Get Substring  ${return_value}   11
  Run Keyword And Return If  '${return_value}' == 'Картонки'   Convert To String  Cartons
  [return]  ${return_value}

Отримати інформацію про items[0].additionalClassifications[0].id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}

Отримати інформацію про items[0].additionalClassifications[0].scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  ${return_value}=   Get Substring  ${return_value}   0   -1
  [return]  ${return_value.split(' ')[1]}

Отримати інформацію про items[0].additionalClassifications[0].description
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].description
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.postalCode
  Run Keyword And Return  Get Substring  ${return_value}  0  5

Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.countryName
  Run Keyword And Return  Get Substring  ${return_value}  0  7

Отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.region
  Run Keyword And Return  Remove String  ${return_value}  ,

Отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.locality
  Run Keyword And Return  Remove String  ${return_value}  ,

Отримати інформацію про items[0].deliveryAddress.streetAddress
  Run Keyword And Return  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.streetAddress

Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryDate.endDate
  ${time}=  Отримати текст із поля і показати на сторінці  enquiryPeriod.startDate
  ${time}=  Get Substring  ${time}  11
  ${day}=  Get Substring  ${return_value}  16  18
  ${month}=  Get Substring  ${return_value}  18  22
  ${year}=  Get Substring  ${return_value}  22
  Run Keyword And Return  Convert To String  ${year}${month}${day}${time}

Отримати інформацію про questions[0].title
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].title
  Log   ${return_value}
  [return]  ${return_value}

Отримати інформацію про questions[0].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].description
  Log   ${return_value}
  [return]  ${return_value}

Отримати інформацію про questions[0].date
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].date
  Run Keyword And Return  Change_date_to_month  ${return_value}

Отримати інформацію про questions[0].answer
  Run Keyword And Return  Отримати текст із поля і показати на сторінці  questions[0].answer

Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  2
  Page Should Contain Element  xpath=//a[@id='lot_auctionUrl_0']
  ##Click Element  xpath=//a[@id='lot_auctionUrl_0']
  ##Sleep  3
  ${url}=  Get Element Attribute  xpath=//*[@id="lot_auctionUrl_0"]@href
  Log   ${url}
  [return]  ${url}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  2
  Page Should Contain Element  xpath=//a[@id='participationUrl_0']
  ##Click Element  xpath=//a[@id='lot_auctionUrl_0']
  ##Sleep  3
  ${url}=  Get Element Attribute  xpath=//*[@id="participationUrl_0"]@href
  Log   ${url}
  [return]  ${url}
       

  

