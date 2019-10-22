*** Settings ***
Library  Selenium2Screenshots
Library  Selenium2Library
Library  String
Library  DateTime
Library  etender_service.py

*** Variables ***
${locator.tenderId}                                            xpath=//*[@id='tenderidua']/b
${locator.title}                                               id=tenderTitle
${locator.status}                                              id=tenderStatus
${locator.description}                                         id=tenderDescription
${locator.minimalStep.amount}                                  id=lotMinimalStep_0
${locator.procuringEntity.name}                                id=tenderOwner
${locator.procuringEntity.address.countryName}                 id=customer_country
${locator.procuringEntity.address.locality}                    id=customer_city
${locator.procuringEntity.address.postalCode}                  id=customer_postIndex
${locator.procuringEntity.address.region}                      id=customer_region
${locator.procuringEntity.address.streetAddress}               id=customer_addressStr
${locator.procuringEntity.contactPoint.name}                   id=contactPoint_name
${locator.procuringEntity.contactPoint.telephone}              id=contactPoint_telephone
${locator.procuringEntity.contactPoint.url}                    id=contactPoint_url
${locator.procuringEntity.identifier.legalName}                id=tenderOwner
${locator.procuringEntity.identifier.scheme}                   id=organization_scheme
${locator.procuringEntity.identifier.id}                       id=organization_identifier
${locator.value.amount}                                        id=tenderBudget
${locator.tenderPeriod.startDate}                              id=tenderStart
${locator.tenderPeriod.endDate}                                id=tenderEnd
${locator.enquiryPeriod.startDate}                             id=enquiryStart
${locator.enquiryPeriod.endDate}                               id=enquiryEnd
${locator.causeDescription}                                    id=causeDescription
${locator.cause}                                               id=cause
${locator.qualificationPeriod.endDate}                         id=qualificationPeriod_endDate
${locator.qualifications[0].status}                            xpath=(//div[@ng-controller="qualificationsCtrl"]//div[@class = "row"]/div[contains(.,"Статус:")]/following-sibling::div)[1]
${locator.qualifications[1].status}                            xpath=(//div[@ng-controller="qualificationsCtrl"]//div[@class = "row"]/div[contains(.,"Статус:")]/following-sibling::div)[2]
${locator.items[0].description}                                id=item_description_00
${locator.items[0].deliveryLocation.latitude}                  id=delivery_latitude0
${locator.items[0].deliveryLocation.longitude}                 id=delivery_longitude0
${locator.items[0].classification.id}                          id=classification_code_00
${locator.items[0].classification.description}                 id=classification_name_00
${locator.items[0].additionalClassifications[0].scheme}        id=additionalClassification_scheme0
${locator.items[0].additionalClassifications[0].id}            id=additionalClassification_id0
${locator.items[0].additionalClassifications[0].description}   id=additionalClassification_desc0
${locator.items[0].unit.code}                                  id=item_unit_00
${locator.items[0].quantity}                                   id=item_quantity_00
${locator.items[0].unit.name}                                  id=item_unit_00
${locator.awards[0].status}                                    xpath=//div[@class = 'row']/div[contains(.,'Статус:')]/following-sibling::div
${locator.awards[0].value.valueAddedTaxIncluded}               xpath=//div[@class = 'row']/div[contains(.,'Остаточна пропозиція:')]/following-sibling::div/span/i
${locator.awards[0].value.currency}                            xpath=//div[@class = 'row']/div[contains(.,'Остаточна пропозиція:')]/following-sibling::div/span
${locator.awards[0].value.amount}                              xpath=//div[@class = 'row']/div[contains(.,'Остаточна пропозиція:')]/following-sibling::div/span
${locator.awards[0].suppliers[0].address.countryName}          id=awardCountry_0
${locator.awards[0].suppliers[0].address.locality}             id=awardCity_0
${locator.awards[0].suppliers[0].address.postalCode}           id=awardIndex_0
${locator.awards[0].suppliers[0].address.region}               id=awardRegion_0
${locator.awards[0].suppliers[0].address.streetAddress}        id=awardAddressStr_0
${locator.awards[0].suppliers[0].name}                         xpath=//span[@id="awardContactPoint"]/u
${locator.awards[0].suppliers[0].contactPoint.telephone}       xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"Телефон:")]
${locator.awards[0].suppliers[0].contactPoint.name}            xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"Контактна особа:")]
${locator.awards[0].suppliers[0].contactPoint.email}           xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"email:")]
${locator.awards[0].suppliers[0].identifier.scheme}            xpath=//span[@id="awardContactPoint"]/following-sibling::div//p/b[contains(.,"Код ")]
${locator.awards[0].suppliers[0].identifier.legalName}         xpath=//span[@id="awardContactPoint"]/u
${locator.awards[0].suppliers[0].identifier.id}                xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"Код ")]
${locator_document_title}                                      xpath=//td[contains(@class,"doc-name")]//a[contains(.,"XX_doc_id_XX")]
${locator_document_href}                                       xpath=//td[contains(@class,"doc-name")]//a[contains(.,"XX_doc_id_XX")]//ancestor::td[contains(@class,"doc-name")]//preceding-sibling::td//a@href
${locator_document_description}                                xpath=//td[contains(@class,"doc-name")]//a[contains(.,"XX_doc_id_XX")]/following-sibling::p
${locator_document_of}                                         xpath=//td[contains(@class,"doc-name")]//a[contains(.,"d-XX_doc_id_XX")]/parent::td@data-document-of
${locator.value.currency}                                      id=tenderCurrency
${locator.value.valueAddedTaxIncluded}                         id=includeVat
${locator.bids}                                                id=ParticipiantInfo_0
${locator_block_overlay}                                       xpath=//div[@class='blockUI blockOverlay']
${locator_question_title}                                      xpath=//span[contains(@id,'quest_title_') and contains(text(),'XX_que_id_XX')]
${locator_feature_title}                                       xpath=//*[contains(@ng-bind,'eature.title') and contains(text(),'XX_feature_id_XX')]
${locator_feature_description}                                 xpath=//*[contains(@ng-bind,'eature.title') and contains(text(),'XX_feature_id_XX')]/../../following-sibling::div//*[contains(@ng-bind,'eature.description')]
${locator_feature_featureOf}                                   xpath=//div[contains(@ng-repeat,"eature")]//span[contains(@ng-bind,"eature.title") and contains(.,"XX_feature_id_XX")]
${locator_item_description}                                    xpath=//p[contains(.,"XX_item_id_XX")]
${locator_item_classification.id}                              xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"classification_code_")]
${locator_item_classification.description}                     xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"classification_name_")]
${locator_item_additionalClassifications[0].scheme}            xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//b[contains(.,"Класифікатор ")]
${locator_item_additionalClassifications[0].id}                xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"additionalClassification_id")]
${locator_item_additionalClassifications[0].description}       xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"additionalClassification_desc")]
${locator_item_quantity}                                       xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"item_quantity_")]
${locator_item_unit.name}                                      xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"item_unit_")]
${locator_item_unit.code}                                      xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"item_unit_")]
${locator_item_deliveryDate.endDate}                           xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_end_")]
${huge_timeout_for_visibility}                                 300
${tenderpage}
${contractpage}
${global_procedure_type}
${global_plan_id}


*** Keywords ***
Підготувати клієнт для користувача
  [Arguments]  ${username}
  [Documentation]  Відкрити браузер, створити об’єкт api wrapper, тощо
  Open Browser  ${USERS.users['${username}'].homepage}  ${USERS.users['${username}'].browser}  alias=${username}
  Set Window Size  @{USERS.users['${username}'].size}
  Set Window Position  @{USERS.users['${username}'].position}
  Run Keyword If  '${username}' != 'Etender_Viewer'  Login  ${username}
  Дочекатись зникнення blockUI
  Return from keyword if  '${tenderpage}'!='${EMPTY}'
  Set Global Variable   ${tenderpage}   ${EMPTY}
  Return from keyword if  '${contractpage}'!='${EMPTY}'
  Set Global Variable   ${contractpage}   ${EMPTY}

Wait Scroll Click
  [Arguments]  ${locator}  ${timeout}=10
  Wait and Click  ${locator}  ${timeout}  True

Wait and Click
  [Arguments]  ${locator}  ${timeout}=7  ${scroll}=False
  [Documentation]  Wait for visibility and then click
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Run Keyword If  '${scroll}'=='True'  scrollIntoView by script  ${locator}
  Click Element  ${locator}

Wait and Select By Label
  [Arguments]  ${locator}  ${data}  ${timeout}=15
  [Documentation]  Wait for visibility and then select by label
  Wait Until Element Is Visible     ${locator}  ${timeout}
  Select From List By Label         ${locator}  ${data}

Wait and Input
  [Arguments]  ${locator}  ${data}  ${timeout}=7
  [Documentation]  Wait for visibility and then input text
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Input text  ${locator}  ${data}

Wait and Get Text
  [Arguments]  ${locator}  ${timeout}=5
  [Documentation]  Wait for visibility and then get text
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Run Keyword And Return  Get Text  ${locator}

Wait and Get Attribute
  [Arguments]  ${locator}  ${attribute}  ${timeout}=5
  [Documentation]  Wait for visibility and then input text
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Run Keyword And Return  Get Element Attribute  ${locator}@${attribute}

Дочекатись зникнення blockUI
  [Arguments]
  Wait Until Keyword Succeeds  15x  0s  Wait Until Page Does Not Contain Element  xpath=//div[@class='blockUI blockOverlay']  2


Підготувати дані для оголошення тендера
  [Arguments]  ${username}  ${tender_data}  ${username_2}
  Log  ${tender_data}

  # Достаем айдишник плана для создания тендера
  ${file_path}=  Get Variable Value  ${ARTIFACT_FILE}  artifact_plan.yaml
  ${ARTIFACT}=  load_data_from  ${file_path}
  Set Global Variable  ${global_plan_id}    ${ARTIFACT.tender_uaid}

  # Если есть объект закупівельника (buyers) - то это план, из за особенностей площадки меняем данные
  ${status}=  Run Keyword And Return Status     Dictionary Should Contain Key   ${tender_data.data}  buyers
  Run Keyword If  '${status}'=='True'  change_buyers_data  ${tender_data}
  Return From Keyword If   '${status}'=='True'  ${tender_data}

  # Обновлять данные создателя тендера, только в случае tender_owner'a
  Run Keyword If  '${username}'=='Etender_Owner'  change_data_for_tender_owner  ${tender_data}
  ${tender_data}=  change_data  ${tender_data}
  Log  ${tender_data}
  Log  ${username}
  Log  ${username_2}
  [Return]  ${tender_data}

Відкрити всі лоти
  ${clicked}=  Wait and Get Attribute  xpath=//*[@id="openAllLots"]     class
  Return From Keyword If  'clicked' in '${clicked}'
  Wait Scroll Click     id=openAllLots
  Дочекатись зникнення blockUI


Login
  [Arguments]  ${username}
  Дочекатись зникнення blockUI
  Wait and Click   id=login     15
  Wait and Input   id=inputUsername     ${USERS.users['${username}'].login}     15
  Wait and Input   id=inputPassword     ${USERS.users['${username}'].password}  15
  Дочекатись зникнення blockUI
  Wait and Click   id=btn_submit
  Sleep  5
  Go To  ${USERS.users['${username}'].homepage}
  Дочекатись зникнення blockUI

Створити тендер
  [Arguments]  ${username}  ${tender_data}
  #Set To Dictionary  ${USERS.users['${username}']}  tender_data=${tender_data}
  ${tender_data}=       Get From Dictionary     ${tender_data}              data
  Log  ${tender_data}
  ${status}  ${methodType}=  Run Keyword And Ignore Error  Get From Dictionary  ${tender_data}  procurementMethodType
  Log To Console  check presence of procurementMethodType in dictionary: ${status}
  ${methodType}=  Set Variable IF  '${status}' != 'PASS'       belowThreshold  ${methodType}
  Set To Dictionary  ${USERS.users['${username}']}  method_type=${methodType}
  Run Keyword If  '${methodType}' == 'esco'  Run Keyword And Return  Створити тендер ESCO  ${username}  ${tender_data}  ${methodType}
  Run Keyword If  '${methodType}' == 'closeFrameworkAgreementUA'  Run Keyword And Return  Створити тендер Framework Agreement  ${username}  ${tender_data}  ${methodType}
  ${items}=             Get From Dictionary     ${tender_data}              items
  ${mainProcurementCategory}=                   Get From Dictionary         ${tender_data}             mainProcurementCategory
  ${title}=             Get From Dictionary     ${tender_data}              title
  ${title_en}=          Get From Dictionary     ${tender_data}              title_en
  ${description}=       Get From Dictionary     ${tender_data}              description
  ${budget}=            Get From Dictionary     ${tender_data.value}        amount
  ${budgetToStr}=       float_to_string_2f      ${budget}      # at least 2 fractional point precision, avoid rounding

  Log  ${items[0]}
  Click Element         id=qa_myTenders  # Мої закупівлі
  Дочекатись зникнення blockUI
  Wait and Click        xpath=//a[@data-target='#procedureType']
  ${procedure_type}=    get_procedure_type  ${methodType}
  Wait and Select By Label  id=chooseProcedureType  ${procedure_type}
  Wait and Click        id=goToCreate
  Дочекатись зникнення blockUI
  Wait and Input        xpath=//input[@name="planExternalId"]          ${global_plan_id}
  Wait and Click  id=searchPlan
  Дочекатись зникнення blockUI
  Input text    id=title    ${title}
  Input text    id=description            ${description}
  Дочекатись зникнення blockUI

  Run Keyword If    '${methodType}' in ('aboveThresholdEU', 'competitiveDialogueEU')   Input text    id=titleEN    ${title_en}
  Run Keyword Unless  '${methodType}' in ('closeFrameworkAgreementUA')   Wait Scroll Click     id=valueAddedTaxIncluded
  Select From List By Value  id=mainProcurementCategory     ${mainProcurementCategory}

  ${status}  ${lots}=  Run Keyword And Ignore Error  Get From Dictionary  ${tender_data}  lots
  Log  ${lots[0]}
  Log to console  presence of lots: ${status}
  ${lots_count}=  Run Keyword IF  '${status}' != 'PASS'  Set Variable  0
  ...             ELSE  Get Length  ${lots}
  Run Keyword If  ${lots_count}>0  Run Keywords  Wait Scroll Click  id=isMultilots  AND  Додати лоти і їх предмети  ${lots_count}  ${lots}  ${items}
  ...           ELSE  Run Keywords  Додати мінімальний крок при наявності  ${tender_data}  AND  Input text  id=lotValue_0  ${budgetToStr}  AND  Додати предмети  ${items}  0
# TODO: убрать костыль ▼, на переговорке создается по 2 лишних айтема для каждого лота
  Додати умови оплати при наявності  ${tender_data}
  Додати причину з описом при наявності  ${tender_data}
  Додати донора при наявності  ${tender_data}
  Додати дати при наявності    ${tender_data}  ${methodType}
  Додати нецінові показники при наявності       ${tender_data}
  Sleep   10
  Wait Scroll Click     id=createTender
  Sleep   60
  Reload Page
  Wait Until Keyword Succeeds        10 min  30 sec  Дочекатися завершення обробки тендера
  Зберегти посилання
  Run Keyword And Return  Get Text  ${locator.tenderId}
  # TODO FIX ELASTIC ISSUES ON UAT and delete ↑


Створити тендер ESCO
  [Arguments]  ${username}  ${tender_data}  ${methodType}
  ${items}=             Get From Dictionary     ${tender_data}              items
  ${mainProcurementCategory}=                   Get From Dictionary         ${tender_data}             mainProcurementCategory
  ${title}=             Get From Dictionary     ${tender_data}              title
  ${title_en}=          Get From Dictionary     ${tender_data}              title_en
  ${description}=       Get From Dictionary     ${tender_data}              description
  ${NBU}=               Get From Dictionary     ${tender_data}   NBUdiscountRate
  ${NBU}=              Evaluate  ${NBU}*100
  ${minimalStepPercentage}=  Get From Dictionary     ${tender_data}  minimalStepPercentage
  ${yearlyStepPercentage}=  Get From Dictionary     ${tender_data}  yearlyPaymentsPercentageRange
  ${fundingKind}=  Get From Dictionary  ${tender_data}  fundingKind
  ${minimalStepPercentageStr}=  float_to_string_2f      ${minimalStepPercentage}
  ${NBUStr}=  float_to_string_3f  ${NBU}
  ${yearlyStepPercentageStr}=  float_to_string_2f  ${yearlyStepPercentage}
  ${fundingKindStr}=  convert_common_string_to_etender_string  ${fundingKind}

  ${status}  ${methodType}=  Run Keyword And Ignore Error  Get From Dictionary  ${tender_data}  procurementMethodType
  Set To Dictionary  ${USERS.users['${username}']}  method_type=${methodType}
  Log  ${items[0]}
  Click Element         id=qa_myTenders  # Мої закупівлі
  Дочекатись зникнення blockUI
  Wait and Click        xpath=//a[@data-target='#procedureType']
  ${procedure_type}=    get_procedure_type  ${methodType}
  Wait and Select By Label  id=chooseProcedureType  ${procedure_type}
  Wait and Click        id=goToCreate
  Дочекатись зникнення blockUI
  Wait And Input  id=planExternalId  ${global_plan_id}
  Wait and Click  id=searchPlan
  Input text    id=title    ${title}
  Input text    id=description            ${description}
  Input text    id=titleEN    ${title_en}
  Input text    id=nbuDiscRate  ${NBUStr}
  Wait and Select By Label  id=fundingKind  ${fundingKindStr}


  Select From List By Value  id=mainProcurementCategory     ${mainProcurementCategory}

  ${status}  ${lots}=  Run Keyword And Ignore Error  Get From Dictionary  ${tender_data}  lots
  Log  ${lots[0]}
  log to console  presence of lots: ${status}
  ${lots_count}=  Run Keyword IF  '${status}' != 'PASS'  Set Variable  0
  ...             ELSE  Get Length  ${lots}
  Run Keyword If  ${lots_count}>0  Run Keywords  Wait Scroll Click  id=isMultilots  AND  Додати лоти і їх предмети  ${lots_count}  ${lots}  ${items}
  ...           ELSE  Run Keywords  Input text  xpath=//input[contains(@name, 'yearlyPaymentsPercentageRange0')]  ${yearlyStepPercentageStr}  AND  Input text  xpath=//input[contains(@name, 'minimalStepPerc0')]  ${minimalStepPercentageStr}  AND  Додати предмети  ${items}  0
  Додати умови оплати при наявності  ${tender_data}
  Додати причину з описом при наявності  ${tender_data}
  Додати донора при наявності  ${tender_data}
  Додати дати при наявності    ${tender_data}  ${methodType}
  Додати нецінові показники при наявності       ${tender_data}
  Sleep   10
  Wait Scroll Click     id=createTender
  Sleep   60
  Reload Page
  Wait Until Keyword Succeeds        10 min  30 sec  Дочекатися завершення обробки тендера
  Run Keyword And Return  Get Text  ${locator.tenderId}
  Зберегти посилання


Створити тендер Framework Agreement
  [Arguments]  ${username}  ${tender_data}  ${methodType}
  ${items}=             Get From Dictionary     ${tender_data}              items
  ${mainProcurementCategory}=                   Get From Dictionary         ${tender_data}             mainProcurementCategory
  ${title}=             Get From Dictionary     ${tender_data}              title
  ${title_en}=          Get From Dictionary     ${tender_data}              title_en
  ${description}=       Get From Dictionary     ${tender_data}              description
  ${description_en}=    Get From Dictionary     ${tender_data}              description_en
  ${budget}=            Get From Dictionary     ${tender_data.value}        amount
  ${budgetToStr}=       float_to_string_2f      ${budget}      # at least 2 fractional point precision, avoid rounding
  ${AwardsCount}=       Get From Dictionary     ${tender_data}              maxAwardsCount
  ${AwardsCountToStr}=       float_to_string_2f      ${AwardsCount}
  ${agreementDuration}=  Get From Dictionary         ${tender_data}  agreementDuration
  ${valueTax}=           Get From Dictionary         ${tender_data.value}  valueAddedTaxIncluded
  Log  ${items[0]}
  Click Element         id=qa_myTenders  # Мої закупівлі
  Дочекатись зникнення blockUI
  Wait and Click        xpath=//a[@data-target='#procedureType']
  ${procedure_type}=    get_procedure_type  ${methodType}
  Wait and Select By Label  id=chooseProcedureType  ${procedure_type}
  Wait and Click        id=goToCreate
  Дочекатись зникнення blockUI
  Wait And Input  id=planExternalId  ${global_plan_id}
  Wait and Click  id=searchPlan
  Input text    id=title    ${title}
  Input text    id=description            ${description}
  Input text    id=titleEN    ${title_en}
  Input text    id=descriptionEN   ${description_en}
  Input text    xpath=//input[@ng-model = 'data.maxAwardsCount']  ${AwardsCountToStr}
  Select From List By Value  id=mainProcurementCategory     ${mainProcurementCategory}

  ${status}  ${lots}=  Run Keyword And Ignore Error  Get From Dictionary  ${tender_data}  lots
  Log  ${lots[0]}
  log to console  presence of lots: ${status}
  ${lots_count}=  Run Keyword IF  '${status}' != 'PASS'  Set Variable  0
  ...             ELSE  Get Length  ${lots}
  Run Keyword If  ${lots_count}>0  Додати лоти і їх предмети  ${lots_count}  ${lots}  ${items}
  ...           ELSE  Run Keywords  Input text  xpath=//input[contains(@name, 'yearlyPaymentsPercentageRange0')]  ${yearlyStepPercentageStr}  AND  Input text  xpath=//input[contains(@name, 'minimalStepPerc0')]  ${minimalStepPercentageStr}  AND  Додати предмети  ${items}  0
  #Run Keyword If  '${valueTax}' == 'True'  Wait Scroll Click     id=valueAddedTaxIncluded
  Додати умови оплати при наявності  ${tender_data}
  Додати причину з описом при наявності  ${tender_data}
  Додати донора при наявності  ${tender_data}
  Додати дати при наявності    ${tender_data}  ${methodType}
  Додати нецінові показники при наявності       ${tender_data}
  ${year}  ${month}  ${day}=  convet_fra_to_variable  ${agreementDuration}
  #Wait and Click  xpath=//div[@ng-model='data.agreementDuration.years']//input[@placeholder='Рік']
  #Wait and Click  xpath=//div[@ng-model='data.agreementDuration.years']//span[@ng-bind-html='years' and text()='${year}']         #//div[@ng-show='$select.open']//div[@class='ui-select-choices-content selectize-dropdown-content']
  #Wait and Click  xpath=//div[@ng-model='data.agreementDuration.months']//input[@placeholder='Місяць']
  #Wait and Click  xpath=//div[@ng-model='data.agreementDuration.months']//span[@ng-bind-html='months' and text()='${month}']
  #Wait and Click  xpath=//div[@ng-model='data.agreementDuration.days']//input[@placeholder='День']
  #Wait and Click  xpath=//div[@ng-model='data.agreementDuration.days']//span[@ng-bind-html='days' and text()='${day}']
  Sleep   10
  Wait Scroll Click     id=createTender
  Sleep   60
  Reload Page
  Wait Until Keyword Succeeds        10 min  30 sec  Дочекатися завершення обробки тендера
  Run Keyword And Return  Get Text  ${locator.tenderId}
  Зберегти посилання



Додати донора при наявності
  [Arguments]  ${data}
  ${status}=  Run Keyword And Return Status     Dictionary Should Contain Key   ${data}  funders
  Run Keyword If    '${status}'=='True'     Вибрати донора  ${data.funders[0]}

Вибрати донора
  [Arguments]  ${funder}
  Натиснути на чекбокс донора
  Wait and Click    xpath=//funder//input[@type="search"]
  Wait and Input    xpath=//funder//input[@type="search"]   ${funder.name}
  Wait and Click    xpath=//div[contains(@class,"selectize-dropdown") and contains(@repeat,"funder")]//div[@role="option" and contains(@class,"active")]

Натиснути на чекбокс донора
  Wait Scroll Click     id=useFunder

Видалити донора
  [Arguments]  ${username}  ${tender_uaid}  ${index}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Натиснути на чекбокс донора
  Зберегти зміни в тендері

Додати донора
  [Arguments]  ${username}  ${tender_uaid}  ${funder}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Вибрати донора    ${funder}
  Зберегти зміни в тендері

Додати умови оплати при наявності
  [Arguments]  ${data}
  ${status}=  Run Keyword And Return Status     Dictionary Should Contain Key   ${data}  milestones
  Run Keyword If    '${status}'=='True'     Додати умови оплати  ${data.milestones}

Додати умови оплати
  [Arguments]  ${milestones}
  ${count}=   Get Length  ${milestones}
  Run Keyword If  '${USERS.users['Etender_Owner']['method_type']}' == 'reporting'  Wait Scroll Click     id=addMilestone
  :FOR  ${i}  IN RANGE  ${count}
  \     Додати умову оплати  ${milestones[${i}]}  ${i}

Додати умову оплати
  [Arguments]  ${milestone}  ${index}
  Log  ${milestone}
  Run Keyword Unless  '${index}'=='0'  Wait Scroll Click     id=addMilestone
  ${status}=    Run Keyword And Return Status   Dictionary Should Not Contain Key   ${milestone}  relatedLot
  ${target}=    Set Variable If     '${status}'=='True'     tender  lot_0  #wait a fix for Framework Agreement ( Milestone tied to the lot, not to the tender )
  Wait and Input                id=milestonePercentage${index}${target}     ${milestone.percentage}
  Input String                  id=milestoneDays${index}${target}           ${milestone.duration.days}
  Select From List By Value     id=milestoneTitle${index}${target}          ${milestone.title}
  Select From List By Value     id=milestoneCode${index}${target}           ${milestone.code}
  Select From List By Value     id=milestoneBaseType${index}${target}       ${milestone.duration.type}
  Run Keyword If    'anotherEvent'=='${milestone.title}'    Input String    id=milestoneDescription${index}${target}   ${milestone.description}

Додати лоти і їх предмети
  [Arguments]  ${lots_count}  ${lots}  ${items}
  Log  ${lots[0]}
  ${items_count}=   Get Length  ${items}
  :FOR  ${i}  IN RANGE  ${lots_count}-1
  \     Натиснути додати лот
  :FOR  ${i}  IN RANGE  ${lots_count}
  \     Заповнити інформацію про лот  ${lots[${i}]}  ${i}
  \     Додати предмети  ${items}  ${i}  ${lots[${i}].id}

Натиснути додати лот
  Wait and Click    id=addLot_

Заповнити інформацію про лот
  [Arguments]  ${lot}  ${index}
  Wait and Input    id=lotTitle_${index}        ${lot['title']}
  Run Keyword If  '${USERS.users['Etender_Owner']['method_type']}' == 'esco'  Run Keyword and Return  Заповнити інформацію про лот ESCO  ${lot}  ${index}
  Run Keyword If  '${USERS.users['Etender_Owner']['method_type']}' in ('aboveThresholdEU', 'aboveThresholdUA.defense', 'closeFrameworkAgreementUA','competitiveDialogueEU')  Input Text   id=lotTitleEn_${index}        ${lot['title_en']}
  Input Text        id=lotDescription_${index}  ${lot['description']}
  Input String      id=lotValue_${index}        ${lot['value']['amount']}
  Run Keyword Unless  '${USERS.users['Etender_Owner']['method_type']}' in ('negotiation')  Input String      id=minimalStep_${index}     ${lot['minimalStep']['amount']}


Заповнити інформацію про лот ESCO
  [Arguments]  ${lot}  ${index}
  ${lot['yearlyPaymentsPercentageRange']}=  Evaluate  ${lot['yearlyPaymentsPercentageRange']}*100
  ${lot['minimalStepPercentage']}=  Evaluate   ${lot['minimalStepPercentage']}*100
  ${minimalStepPercentageStr}=  float_to_string_3f  ${lot['minimalStepPercentage']}
  ${yearlyPaymentsPercentageStr}=  float_to_string_3f  ${lot['yearlyPaymentsPercentageRange']}
  Wait and Input    id=lotTitle_${index}        ${lot['title']}
  Input Text   id=lotTitleEn_${index}        ${lot['title_en']}
  Input Text        id=lotDescription_${index}  ${lot['description']}
  Input String      xpath=//input[contains(@name, 'yearlyPaymentsPercentageRange${index}')]       ${yearlyPaymentsPercentageStr}
  Input String      xpath=//input[contains(@name, 'minimalStepPerc${index}')]     ${minimalStepPercentageStr}

Створити лот із предметом закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${lot}  ${item}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Натиснути додати лот
  ${lots_count}=  Get Length  ${USERS.users['${username}'].initial_data.data['lots']}
  Заповнити інформацію про лот  ${lot.data}  ${lots_count}
  Додати предмет  ${item}  0  ${lots_count}  # len is 1 more than index
  Зберегти зміни в тендері

Отримати індекс лоту
  [Arguments]  ${lot_id}
  ${lot_id}=  Get Element Attribute  xpath=//span[@ng-bind= "::lot.title" and contains(text(), '${lot_id}')]@id
  [return]  ${lot_id[-1]}

Додати предмет закупівлі в лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${item}
  #Log   ${USERS.users['${username}'].lot_data}

  ${lot_index}=  Отримати індекс лоту  ${lot_id}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Wait Scroll Click  id=addLotItem_${lot_index}
  Додати предмет  ${item}  1  ${lot_index}
  Зберегти зміни в тендері

Додати предмет закупівлі в план
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  ${items_description}=  Get From Dictionary    ${item}                     description
  ${cpv_id}=             Get From Dictionary    ${item.classification}          id
  ${unit}=               Get From Dictionary    ${item.unit}                    name
  ${quantity}=           Get From Dictionary    ${item}                     quantity
  ${quantityStr}=  float to string 3f  ${quantity}
  Перейти на сторінку плану за потреби
  #Wait and Click  xpath=//a[contains(@href, '#/planDetails/')]
  Wait Scroll Click  xpath=//a[contains(@ng-href, 'updatePlan/')]
  ${items_index}=  Get Matching Xpath Count  //textarea[contains(@id, 'itemsDescription')]
  Wait and Click  xpath=//button[@ng-click= 'addItem()']
  Wait and Input  xpath=//textarea[@id ='itemsDescription${items_index}']  ${items_description}
  Wait and Input  xpath=//input[@id = 'itemsQuantity${items_index}']  ${quantityStr}

  Wait and Click  xpath=//*[@id="unit_${items_index}"]//*[@class="selectize-input"]
  Wait and Input  xpath=//div[@class="selectize-input focus"]/input  ${unit}
  Sleep  3
  Capture Page Screenshot
  Press Key  xpath=//div[@class="selectize-input focus"]/input  \\13
  Capture Page Screenshot
  Wait and Click          xpath=//span[@ng-if = 'createPlanModel.apiId']  10
  Reload Page

Видалити предмет закупівлі плану
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}
  Перейти на сторінку плану за потреби
  Wait Scroll Click  xpath=//a[contains(@ng-href, 'updatePlan/')]  10
  Sleep  5
  Wait Scroll Click  xpath=//h4[contains(text(), '№ 2')]//button[@ng-click = 'removeItem($index)']
  Wait and Click          xpath=//span[@ng-if = 'createPlanModel.apiId']  10
  Reload Page


Додати нецінові показники при наявності
  [Arguments]  ${tender_data}
  ${status}  ${features}=  Run Keyword And Ignore Error  Get From Dictionary  ${tender_data}  features
  log to console  presence of features: ${status}
  ${features_count}=  Run Keyword IF  '${status}' != 'PASS'  Return From Keyword
  ...                 ELSE  Get Length  ${features}
  :FOR  ${i}  IN RANGE  ${features_count}
  \     add feature  ${features[${i}]}  0

Додати мінімальний крок при наявності
  [Arguments]  ${data}
  ${status}  ${step_rate}=  Run Keyword And Ignore Error  Get From Dictionary  ${data.minimalStep}  amount
  log to console  check presence of minimalStep.amount in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  ${step_rateToStr}=  float_to_string_2f  ${step_rate}   # at least 2 fractional point precision, avoid rounding
  Input text  id=minimalStep_0  ${step_rateToStr}

Додати причину з описом при наявності
  [Arguments]  ${data}
  ${status}  ${cause}=  Run Keyword And Ignore Error  Get From Dictionary  ${data}  cause
  log to console  check presence of cause in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  Select From List By Value  id=cause             ${cause}
  Input text                 id=causeDescription  ${data['causeDescription']}

Додати дати при наявності
  [Arguments]  ${tender_data}  ${methodType}
  Run Keyword If  '${methodType}' == 'esco'  Run Keyword and Return  Додати дати при наявності ESCO  ${tender_data}
  ${status}  ${data}=  Run Keyword And Ignore Error  get_all_etender_dates  ${tender_data}
  Return From Keyword If  '${status}' != 'PASS'
  Input text  id=TenderPeriod           ${data.tenderEnd.date}
  Input text  id=TenderPeriod_time      ${data.tenderEnd.time}
  Return From Keyword If  '${methodType}' != 'belowThreshold'
  Input text  id=startDate              ${data.tenderStart.date}
  Input text  id=startDate_time         ${data.tenderStart.time}
  Input text  id=enquiryPeriod          ${data.enquiryEnd.date}
  Input text  id=enquiryPeriod_time     ${data.enquiryEnd.time}


Додати дати при наявності ESCO
  [Arguments]  ${tender_data}
  ${status}  ${data}=  Run Keyword And Ignore Error  get_all_etender_dates  ${tender_data}
  Return From Keyword If  '${status}' != 'PASS'
  Input text  id=tenderPeriod_endDate_day                   ${data.tenderEnd.date}
  Input text  id=tenderPeriod_endDate_time                  ${data.tenderEnd.time}


Додати неціновий показник на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${feature}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  ${feature_index}=  Get Matching Xpath Count  xpath=//add-features[@feature-sector="'tender'"]//div[@ng-repeat="(fIndex, feature) in data"]
  add feature  ${feature}  ${feature_index}
  Зберегти зміни в тендері

add feature
  [Arguments]  ${feature}  ${feature_index}
  ${target}=        Set Variable    ${feature['featureOf'].replace('tenderer', 'tender')}  #strange name from prozorro
  ${add_feature_of}=  Set Variable   ${target}
  ${target}=        Set Variable If  '${target}'==b'lot'  lot_0
  ...               '${target}'==b'tender'  tender
  ...               '${target}'==b'item'  item

  ${options}=       Get From Dictionary  ${feature}  enum
  ${number_of_options}=  Get Length  ${options}

  Wait Scroll Click     xpath=//add-features[contains(@feature-sector,"${add_feature_of}")]//span[@ng-click="addFeature()"]
  Wait and Input        xpath=//input[@name="feature-${target}${feature_index}"]  ${feature['title']}
  Wait and Input        xpath=//input[@name="feature-${target}${feature_index}"]/parent::td/following-sibling::td/input[@type="text"]  ${feature['description']}

  :FOR  ${i}  IN RANGE  ${number_of_options}-2  # 2 already exist
  \     Wait Scroll Click   xpath=(//add-features[contains(@feature-sector,"${add_feature_of}")]//button[@ng-click="addFeatureOption(feature)"])[${feature_index}+1]

  :FOR  ${i}  IN RANGE  ${number_of_options}
  \     ${opt_title}=   Get From Dictionary     ${feature.enum[${i}]}  title
  \     ${opt_value}=   Convert To Number       ${feature.enum[${i}]['value']}
  \     ${opt_value}=   Convert To Integer      ${opt_value*100}
  \     ${opt_value}=   Convert To String       ${opt_value}
  \     ${index}=       Run Keyword If  '${opt_value}'!='0'  Evaluate  ${i}+1
  \     ...     ELSE    Set Variable  0
  \     Wait and Input  xpath=//*[@name="feature-${target}Option${feature_index}${index}"]  ${opt_title}
  \     Run Keyword If  '${opt_value}'!='0'  Input text  id=feature-${target}OptionValue${feature_index}${index}  ${opt_value}

Заповнити інформацію про breakdown плану
  [Arguments]  ${breakdown_list}
  ${number_of_breakdown}=  Get Length  ${breakdown_list}

      :FOR  ${i}  IN RANGE  ${number_of_breakdown}
  \    Run Keyword Unless  '${i}'=='0'  Wait Scroll Click  id=addBreakdown  # present by default
  \    ${breakdown_title}=  Get From Dictionary  ${breakdown_list[${i}]}  title
  \    ${breakdown_title}=  get_breakdown_title_value  ${breakdown_title}
  \    Select From List By Label   id=breakdownTitle${i}  ${breakdown_title}
  \    ${breakdown_description}=  Get From Dictionary  ${breakdown_list[${i}]}  description
  \    Input Text  id=breakdownDescription${i}    ${breakdown_description}
  \    ${breakdown_amount}=  Get From Dictionary  ${breakdown_list[${i}].value}  amount
  \    ${breakdown_amount}=  float_to_string_2f  ${breakdown_amount}
  \    Input Text  id=breakDownValue${i}    ${breakdown_amount}


Створити план
  [Arguments]  ${username}  ${arguments}
  Log  ${arguments}
  ${plan}=              Get From Dictionary     ${arguments}                    data
  ${items}=             Get From Dictionary     ${plan}                         items
  ${description}=       Get From Dictionary     ${plan.budget}                  description
  ${amount}=            Get From Dictionary     ${plan.budget}                  amount
  ${breakdown_list}=    Get From Dictionary     ${plan.budget}                  breakdown
  ${amount}=            float_to_string_2f      ${amount}
  ${number_of_items}=   Get Length              ${items}
  ${cpv_id}=            Get From Dictionary     ${plan.classification}          id
  ${procurementMethodType}=  Get From Dictionary  ${plan.tender}                procurementMethodType
  ${procurementMethodTypeStr}=  get procedure type  ${procurementMethodType}
  Дочекатись зникнення blockUI
  Wait and Click        id=qa_myPlans
  Wait and Click        xpath=//a[@href="createPlan"]
  Дочекатись зникнення blockUI
  Заповнити інформацію про buyers при наявності  ${plan.buyers}

  ${plan_tender_type}=       Get From Dictionary     ${plan.tender}  procurementMethodType
  ${tender_type_value}=             get_procedure_type      ${plan_tender_type}
  Wait and Select By Label  xpath=//select[@name="procedureType"]          ${tender_type_value}

  Wait and Input        id=description          ${description}
  Input text            id=value                ${amount}

  Заповнити інформацію про breakdown плану  ${breakdown_list}

  Select From List By Label     xpath=//select[@ng-model="data.projectBudget.period.startDate"]     2020
  Select From List By Label     xpath=//select[@ng-model="data.projectBudget.period.endDate"]       2020
  Select From List By Index     xpath=//select[@name="startDateMonth"]          6
  Select From List By Label     xpath=//select[@name = 'procedureType']  ${procurementMethodTypeStr}
  Wait and Click        xpath=//input[@ng-click="openClassificationModal(null)"]
  Wait and Input        xpath=//div[@id="planClassification"]//input                           ${cpv_id}
  Дочекатись зникнення blockUI
  Click element         xpath=//td[contains(.,'${cpv_id}')]
  Click element         xpath=//button[contains(.,'Зберегти та вийти')]
  Sleep  5
  :FOR  ${i}  IN RANGE  ${number_of_items}
  \     Wait Scroll Click       xpath=//button[@ng-click='addItem()']
  \     ${item_description}=    Get From Dictionary         ${items[${i}]}          description
  \     Input text              id=itemsDescription${i}     ${item_description}
  \     ${item_quantity}=       Get From Dictionary         ${items[${i}]}          quantity
  \     Input String            id=itemsQuantity${i}        ${item_quantity}
  \     ${item_unit}=           Get From Dictionary         ${items[${i}].unit}     name
  \     Input text              xpath=//unit[@id='unit_${i}']//input[@type="search"]                 ${item_unit}
  \     Press Key               xpath=//unit[@id='unit_${i}']//input[@type="search"]                 \\13
  \     Sleep                   3
  \     Wait and Click          xpath=//div[contains(@ng-model,'unit.selected')]//span[@class="ui-select-highlight"]  10
  \     ${delivery_date}=       Get From Dictionary         ${items[${i}].deliveryDate}      endDate
  \     ${delivery_date}=       convert_date_to_etender_format  ${delivery_date}
  \     Wait and Input          id=deliveryDate${i}         ${delivery_date}

  Wait Scroll Click     xpath=//button[contains(., 'Створити план')]
  Дочекатись зникнення blockUI
  Wait Until Keyword Succeeds   2x  10 sec  Дочекатися завершення обробки плану
  ${plan_id}=  Get Text  id=planId
  Зберегти посилання
  [Return]  ${plan_id}

Заповнити інформацію про buyers при наявності  # Заполнение объекта при создании плана
  [Arguments]  ${buyers}
  Wait and Click  id=newProcuringEntity
  ${buyers_list_len}=  Get Length  ${buyers}
  :FOR  ${b_id}  IN RANGE  ${buyers_list_len}
  \    ${buyer_identifier_id}=     Get From Dictionary     ${buyers[${b_id}].identifier}  id
  \    ${buyer_identifier_legalName}=   Get From Dictionary     ${buyers[${b_id}].identifier}  legalName
  \    Wait and Input  id=procuringEntityEdrpou${b_id}  ${buyer_identifier_id}
  \    Wait and Input  id=procuringEntityName${b_id}  ${buyer_identifier_legalName}


Перейти до редагування плану
  Перейти на сторінку плану за потреби
  Дочекатись зникнення blockUI
  Wait Scroll Click     xpath=//a[text()="Редагувати план"]
  Дочекатись зникнення blockUI

Редагувати поле плану
  [Arguments]  ${field}  ${new_value}
  Run Keyword And Return  Редагувати поле ${field}  ${new_value}

Редагувати поле budget.description
  [Arguments]  ${new_value}
  Wait and Input  id=description  ${new_value}

Редагувати поле budget.amount
  [Arguments]  ${new_value}
  Wait and Input  id=value  ${new_value}

Редагувати поле items[0].deliveryDate.endDate
  [Arguments]  ${new_value}
  ${new_value}=  convert_date_to_etender_format  ${new_value}
  Wait and Input  id=deliveryDate0  ${new_value}

Редагувати поле items[0].quantity
  [Arguments]  ${new_value}
  Wait and Input  id=itemsQuantity0  ${new_value}

Редагувати поле budget.period
  [Arguments]  ${new_value}
  ${start}=  Get From Dictionary  ${new_value}  startDate
  ${start_year}=  get_year_from_full_date  ${start}

  ${end_date}=    Get From Dictionary  ${new_value}  endDate
  ${end_year}=  get_year_from_full_date  ${end_date}
  Wait and Select By Label  xpath=//*[@name="startProjectBudget"]  ${start_year}
  Wait and Select By Label  xpath=//*[@name="endProjectBudget"]  ${end_year}
  Capture Page Screenshot

Внести зміни в план
  [Arguments]  ${username}  ${plan_id}  ${field}  ${new_value}
  Перейти до редагування плану
  Редагувати поле плану  ${field}  ${new_value}
  Wait and Click  xpath=//button[@click-and-block="savePlan()"]  #опублікувати


Опрацювати дотаткові класифікації
  [Arguments]  ${additionalClassifications}  ${index}  ${lot_index}
  # TODO: Обробляти випадок коли є більше однієї додаткової класифікації
  ${scheme}=  Get From Dictionary  ${additionalClassifications[0]}  scheme
  Run Keyword If  '${scheme}' in ('INN', 'ДКПП', 'UA-ROAD', 'GMDN')  Вказати ${scheme} додаткову класифікацію  ${additionalClassifications[0]}  ${index}  ${lot_index}
  ...         ELSE  Вказати додаткову класифікацію  ${additionalClassifications[0]}  ${index}  ${lot_index}  ${scheme}
  Дочекатись зникнення blockUI

Вказати INN додаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}  ${lot_index}
  ${description}=  Get From Dictionary  ${additionalClassification}  description
  Wait Scroll Click     xpath=//input[@id='openAddClassificationInnModal${lot_index}${index}']
  Wait and Input    xpath=//div[@id="addClassificationInn_${lot_index}_${index}" and contains(@class,"top")]//input  ${description}
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//td[contains(., '${description}')]
  Wait and Click    xpath=//div[@id="addClassificationInn_${lot_index}_${index}" and contains(@class,"top")]//button[@id="addClassification_choose"]

Вказати додаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}  ${lot_index}  ${scheme}
  [Documentation]  Works same for all DK0** schemes
  ${description}=   Get From Dictionary  ${additionalClassification}  description
  Wait and Click    id=openAddClassificationModal${lot_index}${index}0
  Wait and Select By Label  xpath=//div[@id="addClassification" and contains(@class,"modal")]//select[@name="dkScheme"]  ${scheme}
  Wait and Input    xpath=//div[@id="addClassification" and contains(@class,"modal")]//input  ${description}
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//td[contains(., '${description}')]
  Wait and Click    xpath=//div[@id="addClassification" and contains(@class,"modal")]//*[@id="addClassification_choose"]

Вказати UA-ROAD додаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}  ${lot_index}
  ${description}=   Get From Dictionary  ${additionalClassification}  description
  ${id}=            Get From Dictionary  ${additionalClassification}  id
  Wait and Click    id=openAddClassificationRoadsModal0${index}
  Wait and Input    xpath=//div[contains(@id, "addClassificationRoads_") and contains(@class,"modal")]//input  ${id}
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//div[contains(@id, "addClassificationRoads_")]//td[contains(., '${id}')]
  Wait and Click    xpath=//div[contains(@id, "addClassificationRoads_") and contains(@class,"modal")]//*[@id="addClassification_choose"]
  Дочекатись зникнення blockUI


Вказати GMDN додаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}  ${lot_index}
  ${description}=   Get From Dictionary  ${additionalClassification}  description
  ${id}=            Get From Dictionary  ${additionalClassification}  id
  Wait and Click    id=openAddClassificationGmdnsModal${lot_index}${index}
  Wait and Input    xpath=//div[contains(@id, "addClassificationGmdns_") and contains(@class,"modal")]//input  ${id}
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//div[contains(@id, "addClassificationGmdns_")]//td[contains(., '${id}')]
  Wait and Click    xpath=//div[contains(@id, "addClassificationGmdns_") and contains(@class,"modal")]//*[@id="addClassification_choose"]
  Дочекатись зникнення blockUI


Вказати ДКПП додаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}  @{arguments}
  log  Це щось старе, і його мають прибрати. Не буду нічого тут робити!  WARN


Дочекатися завершення обробки тендера
  Reload Page
  ${tender_id}=                      Wait and Get Text  ${locator.tenderId}
  Should Match Regexp                ${tender_id}  UA-\\d{4}-\\d{2}-\\d{2}-\\d+.*

Дочекатися завершення обробки плану
  Reload Page
  Дочекатись зникнення blockUI
  Wait Until Element Is Visible      id=planId  30
  ${plan_id}=                        Get Text  id=planId  #id=planId_0
  Log  ${plan_id}
  Should Match Regexp                ${plan_id}  UA-P-\\d{4}-.*

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  Задати запитання на  Тендер  0  ${question}

Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
  Задати запитання на  Предмет  0  ${question}

Задати запитання на лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${question}
  Задати запитання на  Лот  ${lot_id}  ${question}

Задати запитання на
  [Arguments]  ${entity}  ${lot_id}  ${question}
  Відкрити розділ запитань
  Wait and Click    id=askQuestion
  Дочекатись зникнення blockUI
  Run Keyword If  '${entity}'=='Лот'    Вибрати лот запитання  ${lot_id}
  Wait and Input    id=title            ${question.data.title}
  Input text        id=description      ${question.data.description}
  Click Element     id=sendQuestion
  Sleep  15  # wait for export

Вибрати лот запитання
  [Arguments]  ${lot_id}
  Select From List By Label  xpath=//*[@ng-model="vm.questionTo"]  Лоту
  ${lot}=   Get Text    xpath=//option[contains(.,'${lot_id}')]
  Select From List By Label  xpath=//*[@ng-model="vm.question.lot"]     ${lot}

Завантажити док
  [Arguments]  ${username}  ${file}  ${locator}  ${locator2}=-1
  # TODO: Rework this tricky behavior someday?
  # Autotest cannot upload file directly, because there is no INPUT element on page. Need to click on button first,
  # but this will open OS file selection dialog. So we close and reopen browser to get rid of this dialog
  ${tmp_location}=  Get Location
  Wait Scroll Click     ${locator}
  Choose File     xpath=//input[@type="file"]  ${file}
  Run Keyword Unless  '${locator2}'=='-1'  Wait and Click    ${locator2}   #  if need to press key to upload like in awards
  Sleep   5
  Capture Page Screenshot
  ${status}=  Run Keyword And Return Status  Page Should Not Contain  Internal Server Error
  Close Browser
  etender.Підготувати клієнт для користувача  ${username}
  Go To  ${tmp_location}
  Sleep  5
  Run Keyword If  '${status}'=='False'  Fail  There was a problem during document upload

Завантажити документ
  [Arguments]  ${username}  ${file}  ${tender_uaid}
  [Documentation]
  ...   Загрузка дока в тендер
  Wait and Select By Label      xpath=//select[@id="docType"][1]  Інші
  #Wait and Click      xpath=//select[@id="docType"][1]//option[contains(@label, 'Інші')]
  Завантажити док  ${username}  ${file}  id=tend_doc_add

Додати предмети
  [Arguments]  ${items}  ${lot_index}  ${lot_id}=
  ${items_count}=  Get Length  ${items}
  :FOR  ${j}  IN RANGE  ${items_count}-1
  \     Wait Scroll Click  id=addLotItem_${lot_index}

  :FOR  ${j}  IN RANGE  ${items_count}
  \     ${status}  ${relatedLot}    Run Keyword And Ignore Error  Get From Dictionary  ${items[${j}]}  relatedLot
  \     Run Keyword If  '${status}'=='FAIL'  Додати предмет  ${items[${j}]}  ${j}  ${lot_index}         # This behaviour is needed to add only items of new lot
  \     Continue For Loop If    '${status}'=='FAIL'
  \     Run Keyword If  '${lot_id}'=='${items[${j}].relatedLot}'  Додати предмет  ${items[${j}]}  ${j}  ${lot_index}


Додати предмет
  [Arguments]  ${item}  ${index}  ${lot_index}
  ${procedureType}=  set variable  ${USERS.users['${tender_owner}'].method_type}
  log  ${item}
  ${locality}=           convert_common_string_to_etender_string  ${item.deliveryAddress.locality}
  Wait and Input    id=itemsDescription${lot_index}${index}      ${item.description}
  Run Keyword And Ignore Error  Wait and Input    id=itemsDescriptionEN${lot_index}${index}      ${item.description_en}
  run keyword if  '${procedureType}' != 'esco'  Заповнити певні поля за наявності  ${item}  ${index}  ${lot_index}

  Wait Scroll Click     id=openClassificationModal${lot_index}${index}
  #Sleep 2
  Wait and Input        id=classificationCode   ${item.classification.id}
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//td[contains(., '${item.classification.id}')]
  Wait and Click    id=classification_choose
  Дочекатись зникнення blockUI
  ${region}=             Get From Dictionary    ${item.deliveryAddress}     region
  ${status}  ${value}=  Run Keyword And Ignore Error  Get From Dictionary  ${item}  additionalClassifications
  log to console    Attempt to get 1st additonal classification scheme: ${status}
  Run Keyword If    '${status}' == 'PASS'   Опрацювати дотаткові класифікації  ${item.additionalClassifications}  ${index}  ${lot_index}
  run keyword if  '${procedureType}' != 'esco'  Заповнити дату за наявності  ${item}  ${index}  ${lot_index}
  Wait and Select By Label  id=region_${lot_index}${index}  ${item.deliveryAddress.region}
  Run Keyword If  '${item.deliveryAddress.region}' != 'місто Київ'  Input text  xpath=//input[@name="otherCity_${lot_index}${index}"]  ${locality}
  Wait and Input    id=street_${lot_index}${index}   ${item.deliveryAddress.streetAddress}
  Wait and Input    id=postIndex_${lot_index}${index}    ${item.deliveryAddress.postalCode}

Заповнити певні поля за наявності
  [Arguments]  ${item}  ${index}  ${lot_index}
  ${quantity}=           Set Variable           ${item.quantity}
  Input String      id=itemsQuantity0${index}         ${quantity}
  Wait and Click    xpath=//unit[@id="itemsUnit0${index}"]//input[@type="search"]
  #Wait and Click    xpath=(//div[contains(@ng-model,"unit.selected")]//input[@type="search"])[${index}+1]
  ${items_count}=   Get Matching Xpath Count   xpath=//div[contains(@ng-model,"unit.selected")]//input[@type="search"]
  #${items_count}=   Get Length  ${items_count}
  Wait and Input    xpath=(//div[contains(@ng-model,"unit.selected")]//input[@type="search"])[${items_count}]  ${item.unit.name}
  Wait and Click    xpath=//div[contains(@class,"selectize-dropdown") and contains(@repeat,"unit")]//div[@role="option" and contains(@class,"active")]

Заповнити дату за наявності
  [Arguments]  ${item}  ${index}  ${lot_index}
  ${deliveryDateStart}=  convert_date_to_etender_format  ${item.deliveryDate.startDate}
  ${deliveryDateEnd}=    convert_date_to_etender_format  ${item.deliveryDate.endDate}
  Wait and Input    id=delStartDate${lot_index}${index}        ${deliveryDateStart}
  Wait and Input    id=delEndDate${lot_index}${index}          ${deliveryDateEnd}


Видалити предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${index}  ${lot_id}
  ${lot_index}=  Отримати індекс лоту  ${lot_id}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Wait and Click  id=itemRemove_${lot_index}1
  Зберегти зміни в тендері

Додати неціновий показник на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${feature_data}  ${object_id}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  add feature   ${feature_data}  1
  Зберегти зміни в тендері
  Run Keyword And Ignore Error  Click Element  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present

Додати неціновий показник на лот
  [Arguments]  ${username}  ${tender_uaid}  ${feature_data}  ${object_id}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  add feature   ${feature_data}  1
  Зберегти зміни в тендері
  Run Keyword And Ignore Error  Click Element  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present

Видалити неціновий показник
  [Arguments]  ${username}  ${tender_uaid}  ${feature_id}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  ${features}=          Set Variable    ${USERS.users['${username}'].feature_data.feature}
  #${features_count}=    Get Length      ${features}
  Log  ${features}
  Видалити вказаний неціновий показник  ${features['featureOf'].replace('tenderer', 'tender')}  ${feature_id}
#  :FOR  ${i}  IN RANGE  ${features_count}
#  \     Log  ${features[${i}]}
#  \     Run Keyword If  '${feature_id}' in '${features[${i}].title}'  Видалити вказаний неціновий показник  ${features[${i}]['featureOf']}  ${feature_id}
#  Пройти по цінових показниках лотів і видалити за потреби   ${feature_id}
#  Пройти по цінових показниках предметів і видалити за потреби  ${feature_id}
  Зберегти зміни в тендері

Видалити вказаний неціновий показник
  [Arguments]  ${target}  ${feature_id}
  Wait Scroll Click     xpath=//add-features//div[contains(@featuretitle,"${feature_id}")]//button[@ng-click="removeFeature($index)"]


# TODO merge ↕
Пройти по цінових показниках предметів і видалити за потреби
  [Arguments]  ${feature_id}
  ${features}=  Get WebElements  xpath=//input[contains(@name,"feature-item") and @ng-model="feature.title"]
  ${features_count}=  Get Length  ${features}
  :FOR  ${i}  IN RANGE  ${features_count}
  \     ${feature_title}=  Get Value  name=feature-item${i}
  \     ${contains}=  Evaluate   "${feature_id}" in """${feature_title}"""
  \     ${target_feature_index}=  Run Keyword If  '${contains}' == 'True'  Set Variable  ${i}
  Return From Keyword If  '${target_feature_index}' == 'None'
  Видалити вказаний неціновий показник з предмету  ${target_feature_index}  # delete feature

Видалити вказаний неціновий показник з предмету
  [Arguments]  ${feature_index}
  Wait Scroll Click     xpath==(//add-features[contains(@feature-sector,"${target}")]//button[@ng-click="removeFeature($index)"])[${feature_index}+1]

Видалити вказаний неціновий показник з лоту
  [Arguments]  ${feature_index}
  Wait Scroll Click     xpath=(//add-features[contains(@feature-sector,"${target}")]//button[@ng-click="removeFeature($index)"])[${feature_index}+1]

Клацнути і дочекатися
  [Arguments]  ${tender_link}
  Click Link  xpath=//a[@ng-click='search()']
  Дочекатись зникнення blockUI
  Wait Until Page Contains Element   ${tender_link}  5

Зберегти посилання
  Log  ${tenderpage}
  Return From Keyword If  '${tenderpage}'!='${EMPTY}'
  ${page}=    Get Location
  Log   ${page}     WARN
  Set Global Variable     ${tenderpage}  ${page}

Зберегти посилання другого етапу
  Log  ${tenderpage}
  ${page}=    Get Location
  Log   ${page}     WARN
  Set Global Variable     ${tenderpage}  ${page}
  Log  ${tenderpage}

Пошук тендера по ідентифікатору
  [Arguments]  ${username}  ${tender_uaid}  @{ARGUMENTS}
  Reload Page
#  Run Keyword If  '${username}' != 'Etender_Owner'  Run Keyword And Return  Тимчасовий Пошук тендера по ідентифікатору для Viewer  ${username}  ${tender_uaid}
  # TODO FIX ELASTIC ISSUES ON UAT, uncomment ↑ and delete ↓
  Run Keyword And Return  Тимчасовий Пошук тендера по ідентифікатору для Viewer  ${username}  ${tender_uaid}
  Go To  ${USERS.users['${username}'].homepage}
  Дочекатись зникнення blockUI
  Перейти на вкладку іншого типу процедур за потреби  ${username}
  Wait and Input    xpath=//input[@type='text' and @placeholder='Пошук закупівлі']    ${tender_uaid}
  ${tender_link}=   Set Variable    xpath=//td[contains(.,'${tender_uaid}')]//a
  Дочекатись зникнення blockUI
  ${passed}=  Run Keyword And Return Status  Wait Until Keyword Succeeds  120 s  30 s  Клацнути і дочекатися  ${tender_link}
  Run Keyword Unless  ${passed}  Fatal Error  Тендер не знайдено за 30 секунд
  Click Link    ${tender_link}
  #Дочекатись зникнення blockUI
  Wait Until Page Contains    ${tender_uaid}   10
  Зберегти посилання

Тимчасовий Пошук тендера по ідентифікатору для Viewer
  [Arguments]  ${username}  ${tender_uaid}
  # TODO: У майбутньому треба буде запровадити більш коректне рішення
  # Виникла необхідність обійти пошук по ідентифікатору через особливість тестового оточення майданчика
  Log  ${TENDER_UAID}
  Sleep  5
  Go To  ${USERS.users['${username}'].homepage.split('#')[0]}tender?tenderid=${TENDER_UAID}
  Дочекатись зникнення blockUI
  Wait Until Page Contains    ${tender_uaid}   10
  Run Keyword And Return If  '.' in '${tender_uaid}'  Зберегти посилання другого етапу
  Зберегти посилання

Перейти на сторінку тендера за потреби
  ${page}=    Get Location
  Return From Keyword If  '${page}'=='${tenderpage}'
  Go To  ${tenderpage}
  Дочекатись зникнення blockUI

Перейти на сторінку плану за потреби
  ${page}=    Get Location
  Return From Keyword If  '${page}'=='${tenderpage}'
  Go To  ${tenderpage}
  Дочекатись зникнення blockUI

Перейти на сторінку контракту
  Перейти на сторінку тендера за потреби
  Run Keyword And Ignore Error  Wait Scroll Click     id=qa_EditContractInfo
  Run Keyword And Ignore Error  Wait Scroll Click     id=qa_FillContractInfo
  Дочекатись зникнення blockUI
  ${page}=    Get Location
  Set Global Variable  ${contractpage}  ${page}


Перейти на сторінку контракту за потреби
  Run Keyword And Return If  '${contractpage}'=='${EMPTY}'  Перейти на сторінку контракту
  ${page}=    Get Location
  Return From Keyword If  '${page}'=='${contractpage}'
  Go To  ${contractpage}
  Дочекатись зникнення blockUI

Перейти на вкладку іншого типу процедур за потреби
  [Arguments]  ${username}
  ${methodType}=  Get From Dictionary  ${USERS.users['${username}']}  method_type
  Return From Keyword If  '${methodType}' != 'negotiation'
  Wait Scroll Click     id=naviTitle1
  Дочекатись зникнення blockUI

Пошук плану по ідентифікатору
  [Arguments]  ${username}  ${TENDER_UAID}
  Log  ${username}
  Go To  ${USERS.users['${username}'].homepage}
  Sleep  30
  Wait and Click    xpath=//li[@id = 'naviTitle2']//span[@class = 'w100 ng-binding']  20
  Дочекатись зникнення blockUI
  Wait and Input    xpath=//input[@type='text' and @placeholder='Пошук за номером плану']   ${TENDER_UAID}
  Wait and Click    xpath=//span[@class = 'icon search']
  Дочекатись зникнення blockUI
  Wait Until Page Contains  ${TENDER_UAID}  10

Завантажити документ в ставку
  [Arguments]  ${username}  ${file}  ${tender_uaid}  ${doc_type}=1  ${doc_name}=
  Перейти на сторінку тендера за потреби
  Відкрити розділ Деталі Закупівлі
  Reload Page
  Sleep  5
  Натиснути редагувати пропозицію
  Run Keyword And Ignore Error  Обрати конфіденційність документа
  ${doc_type}=          get_doc_type_index          ${doc_type}
  Select From List By Index     id=bidDocType_      ${doc_type}
  Завантажити док  ${username}  ${file}  id=addBidDoc_

Обрати конфіденційність документа
  [Arguments]  ${conf}=1
  #Reload Page
  #Sleep  5
  Натиснути редагувати пропозицію
  Select From List By Index     id=bidDocConf_   ${conf}

Змінити документацію в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${privat_doc}  ${doc_id}
  Log  ${privat_doc}
  #Відкрити розділ Деталі Закупівлі
  #Click Element     xpath=//label[@for="showBidDocs00"]
  #Click Element     id=changeDoc_0
  #Select From List By Index  id=bidDocConf_    1    #No implementation yet
  #Input Text        xpath=//textarea[@ng-model="document.confidentialityRationale"]  ${privat_doc.data.confidentialityRationale}
  #Wait and Click     xpath=//button[@ng-click="updateBidDocument(document, tender, bid)"]
  Reload Page

Змінити документ в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${file}  ${doc_id}
  Log  ${doc_id}
  Sleep     3
  Відкрити розділ Деталі Закупівлі
  #Reload Page
  Wait and Click     xpath=//label[@for="showBidDocs00"]
  Wait and Click     id=changeDoc_0
  #Sleep     3
  Завантажити док  ${username}  ${file}  id=updateBidDoc_0

Завантажити документ в лот
  [Arguments]  ${username}  ${file}  ${tender_uaid}  ${lot_id}
  Дочекатись зникнення blockUI
  Wait and Select By Label  xpath=//div[@id="treeDocs0"]//select[@id="docType"]  Інші
  Завантажити док  ${username}  ${file}  xpath=//button[contains(@id, "lot_doc")]

Заповнити нецінові критерії
  [Arguments]  ${features_ids}  ${parameters}
  ${count}=  Get Length  ${features_ids}
  ${i}=  Set Variable  0
  :FOR  ${i}  IN RANGE  ${count}
  \     Run Keyword  Вибрати неціновий критерій  ${features_ids[${i}]}  ${parameters[${i}]['value']}

Вибрати неціновий критерій
  [Arguments]  ${feature_id}  ${value}
  ${index}=  get_feature_index  ${value}
  Select From List By Index  xpath=//span[contains(.,'${feature_id}')]/../..//select  ${index}
  Sleep  1

Пітдвердити чекбокси пропозиції
  Select Checkbox  id=selfEligible
  Select Checkbox  id=selfQualified

Подати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${bid_data}  ${lots_ids}  ${features_ids}
  Перейти на сторінку тендера за потреби
  sleep  5
  Відкрити розділ Деталі Закупівлі
  ${methodType}=  Get Text  id=procedureType
  ${methodType}=  get_method_type   ${methodType.lower()}
  Run Keyword If  '${methodType}' == 'esco'  Run Keyword And Return  Подати цінову пропозицію ESCO  ${username}  ${tender_uaid}  ${bid_data}  ${lots_ids}  ${features_ids}

  ${amount}=    Run Keyword If  ${lots_ids} is None  Set Variable  ${bid_data.data.value.amount}
  ...           ELSE  Set Variable  ${bid_data.data.lotValues[0].value.amount}
  Run Keyword And Ignore Error      Input String      id=amount0      ${amount}
  Run Keyword And Ignore Error      Пітдвердити чекбокси пропозиції

  ${x}=  Run Keyword  Отримати інформацію про procurementMethodType
  Set Global Variable  ${global_procedure_type}  ${x}
  Run Keyword And Return If  '${global_procedure_type}' in ('competitiveDialogueUA', 'competitiveDialogueEU')  Пропустити заповнення нецінових показників
  Run Keyword Unless  ${features_ids} is None  Заповнити нецінові критерії  ${features_ids}  ${bid_data.data.parameters}
  Click Element     id=createBid_0
  Дочекатись зникнення blockUI
  sleep  3

Пропустити заповнення нецінових показників
  Click Element     id=createBid_0
  Дочекатись зникнення blockUI
  sleep  3


Подати цінову пропозицію ESCO
  [Arguments]  ${username}  ${tender_uaid}  ${bid_data}  ${lots_ids}  ${features_ids}
  ${bid_data}=  Get From Dictionary  ${bid_data}  data
  ${years}=     Get From Dictionary  ${bid_data.lotValues[0].value.contractDuration}  years
  ${days}=      Get From Dictionary  ${bid_data.lotValues[0].value.contractDuration}  days
  ${annualCostsReduction}=  Get From Dictionary  ${bid_data.lotValues[0].value}  annualCostsReduction
  ${yearlyPaymentsPercentage}=  Get From Dictionary  ${bid_data.lotValues[0].value}  yearlyPaymentsPercentage
  ${index} =    Set Variable    0
  ${i}=  get length  ${annualCostsReduction}
  :FOR   ${index}    IN RANGE  ${i}
  \      Input String  id=annualCostsReduction0${index}  ${annualCostsReduction[${index}]}
  ${yearlyPaymentsPercentage}=  Evaluate  ${yearlyPaymentsPercentage}*100
  Input String  id=yearlyPaymentsPercentage0  ${yearlyPaymentsPercentage}
  Input String  id=contractPeriod_years0  ${years}
  Input String  id=contractPeriod_days0  ${days}
  Пітдвердити чекбокси пропозиції
  Run Keyword Unless  ${features_ids} is None  Заповнити нецінові критерії  ${features_ids}  ${bid_data.parameters}
  Click Element     id=createBid_0
  Дочекатись зникнення blockUI
  sleep  3


Отримати інформацію із плану
  [Arguments]  ${username}  ${plan_id}  ${field}
  Run Keyword and Ignore Error  Wait and Click  xpath=//td[@data-title="\'Номер плану\'"]/span[.="${plan_id}"]/parent::td//following-sibling::td[@data-title="\'Конкретна Назва\'"]/a
  Дочекатись зникнення blockUI
  Run Keyword And Return  Отримати інформацію із плану про ${field}

#TODO: добавить локаторы в проект для элементов ниже
Отримати інформацію із плану про tender.procurementMethodType
  ${text}=  Get Element Attribute  //div[@class="infoPlanBlock"]//div[text()="Тип процедури:"]/following-sibling::div@outerText
  Run Keyword And Return  get_method_type  ${text.lower()}

Отримати інформацію із плану про budget.amount
  ${return_value}=   Get Text  tenderBudget
  ${return_value}=   Set Variable  ${return_value.replace(u'\xa0','')}  # nbsp converting attempt
  ${return_value}=   Set Variable  ${return_value.replace(' ','')}
  Run Keyword And Return  Convert To Number   ${return_value.replace(',','.')}


Отримати інформацію із плану про budget.currency
  Run Keyword And Return  Get Text  id=tenderCurrency

Отримати інформацію із плану про budget.id
  # поидее должны убрать данный кейворд

Отримати інформацію із плану про budget.description
  Run Keyword And Return  Get Text  id=qa_projectBudget_description


Отримати інформацію із плану про procuringEntity.name
  Run Keyword And Return  Get Text  id=tenderOwner


Отримати інформацію із плану про procuringEntity.identifier.scheme
  ${return_value}=  Get Text   id=organization_scheme
  ${return_value}=  Set Variable   ${return_value[:-1]}
  ${return_value}=  Set Variable   ${return_value.replace(u"Код ","")}
  Run Keyword and Return  Set Variable   ${return_value.replace(u"ЄДРПОУ","UA-EDR")}


Отримати інформацію із плану про procuringEntity.identifier.id
  Run Keyword And Return  Get Text  id=organization_identifier


Отримати інформацію із плану про procuringEntity.identifier.legalName
  Run Keyword And Return  Get Text  id=tenderOwner


Отримати інформацію із плану про classification.description
  Run Keyword And Return  Wait and Get Text  xpath=//*[contains(@id,'classification_name')]


Отримати інформацію із плану про classification.scheme
  ${return}=  Wait and Get Text  xpath=//table[contains(@class,"itemTable")]//th[contains(.,"Класифікатор ")]
  Run Keyword And Return  convert_etender_string_to_common_string  ${return}


Отримати інформацію із плану про classification.id
  Run Keyword And Return  Wait and Get Text  xpath=//*[contains(@id,'classification_code')]


Отримати інформацію із плану про tender.tenderPeriod.startDate
  # TODO: кейворд некорректный, цбд ждет 2019-08-20T00:00:00+03:00, которую мы никак не заполним
  ${tender_period_month}=  Wait and Get Text   id=qa_planTenderPeriodStartMonth
  ${tender_period_year}=  Wait and Get Text  id=qa_planTenderPeriodStartYear
  return from keyword  ${tender_period_year} + ${tender_period_month}

Отримати інформацію із плану про items[${n}].description
  Run Keyword And Return  Wait and Get Text  xpath=//*[contains(@id,'item_description_0${n}')]


Отримати інформацію із плану про items[${n}].quantity
  ${quantity}=  Wait and Get Text  xpath=//*[contains(@id,'item_quantity_0${n}')]
  Run Keyword And Return  Convert To Number  ${quantity}


Отримати інформацію із плану про items[${n}].deliveryDate.endDate
  ${return_value}=  Wait and Get Text  xpath=//*[contains(@id,'item_deliveryDate_0${n}')]
  Run Keyword And Return    convert_etender_date_to_iso_format   ${return_value.replace(u'по ','')}, 00:00

Отримати інформацію із плану про items[${n}].unit.code
  ${return_value}=  Wait and Get Text  xpath=//*[contains(@id,'item_unit_0${n}')]
  Run Keyword And Return  convert_unit_name_to_unit_code  ${return_value}


Отримати інформацію із плану про items[${n}].unit.name
  Run Keyword And Return  Wait and Get Text  xpath=//*[contains(@id,'item_unit_0${n}')]


Отримати інформацію із плану про items[${n}].classification.description
  Run Keyword And Return  Wait and Get Text  xpath=//*[contains(@id,'classification_name_0${n}')]


Отримати інформацію із плану про items[${n}].classification.scheme
  ${return}=  Wait and Get Text  xpath=//table[contains(@class,"itemTable")]//th[contains(.,"Класифікатор ")]
  Run Keyword And Return  convert_etender_string_to_common_string  ${return}


Отримати інформацію із плану про items[${n}].classification.id
  Run Keyword And Return  Wait and Get Text  xpath=//*[contains(@id,'classification_code_0${n}')]


Отримати інформацію про agreements[${n}].agreementID



Отримати інформацію про items[${n}].quantity
  run keyword and return  Wait and Get Text  xpath=//td[@class='itemQuantity']//span[contains(@id, 'item_quantity_0${n}')]


Отримати інформацію про lots[${n}].value.amount
  run keyword and return  Wait and Get Attribute  xpath=//span[@id='lotValue_${n}' and @class='hidden-xs fwn pl15 ng-binding']  value


Отримати інформацію про lots[${n}].minimalStep.amount
  ${result}=  Wait and Get Text  id=lotMinimalStep_${n}
  run keyword and return  parse_currency_value_with_spaces  ${result}

Отримати інформацію про features[${n}].title
  run keyword and return  wait and get text  xpath=//div[@id='item-futers-0-${n}']//span[@name='item']


Отримати інформацію про features[${n}].description
  run keyword and return  wait and get text  xpath=//div[@id='item-futers-0-${n}']//span[@ng-bind='::feature.description']

Отримати інформацію про features[${n}].featureOf
 #run keyword and return  wait and get text  xpath=//div[@id='item-futers-0-${n}']//span


Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  Перейти на сторінку тендера за потреби

  Відкрити розділ Деталі Закупівлі
  Run Keyword And Return If  'value' in '${field}'  Отримати інформацію про value пропозиції
  Run Keyword And Return  Отримати інформацію про ${field} пропозиції

Отримати інформацію про value пропозиції
  ${value}=     Get Text        id=bidAmount0
  ${value}=     parse_currency_value_with_spaces    ${value}
  Run Keyword And Return  Convert To Number  ${value}

Отримати інформацію про status пропозиції
  ${value}=     Get Text        id=bidStatus0
  Run Keyword And Return  convert_etender_string_to_common_string  ${value}

Змінити цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${field}  ${value}
  Перейти на сторінку тендера за потреби
  Sleep    5
  Run Keyword If  '${field}'=='status'  Підтвердити пропозицію
  Run Keyword If  'value' in '${field}'  Редагувати суму пропозиції  ${value}
  Дочекатись зникнення blockUI

Редагувати суму пропозиції
  [Arguments]  ${value}
  Натиснути редагувати пропозицію
  Input String      id=amount0       ${value}
  Click Element     id=updateBid_0

Отримати інформацію про maxAwardsCount
  ${maxAwardsCount}=  Wait and Get Text  //p[contains(text(), 'Кількість учасників, з якими буде укладено рамкову угоду:')]
  Run Keyword And Return  convert to integer  ${maxAwardsCount.split(' ')[-1]}

Редагувати поле maxAwardsCount
  [Arguments]  ${maxAwardsCount}
  Wait and Input      xpath=//input[@ng-model = 'data.maxAwardsCount']       ${maxAwardsCount}


Підтвердити пропозицію
  Wait and Click     id=confirmBid_0

Натиснути редагувати пропозицію
  Reload Page
  Wait and Click     id=editBid_0

Скасувати цінову пропозицію
  [Arguments]  ${username}  ${TENDER_UAID}
  Перейти на сторінку тендера за потреби
  Wait and Click    xpath=//button[contains(@class, 'btn-sm btn-danger')]
  sleep  5

Оновити сторінку з тендером
  [Arguments]  ${username}  ${TENDER_UAID}
  Reload Page
  Дочекатись зникнення blockUI

Оновити сторінку з планом
  [Arguments]  @{ARGUMENTS}
  Reload Page

Створити вимогу про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${file}
  Run Keyword And Return  Створити вимогу про виправлення умов  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${file}

Створити вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${file}
  Run Keyword And Return  Створити вимогу про виправлення умов  ${username}  ${tender_uaid}  ${claim}  тендер  ${file}

Створити вимогу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}  ${file}
  Run Keyword And Return  Створити вимогу про виправлення умов  ${username}  ${tender_uaid}  ${claim}  award  ${file}  ${award_index}

Створити скаргу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${complaint}  ${award_index}  ${file}
  Run Keyword And Return  Створити скаргу про виправлення умов  ${username}  ${tender_uaid}  ${complaint}  award  ${file}  ${award_index}

Створити вимогу про виправлення умов
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${target}  ${file}  ${award_index}=0
  Перейти на сторінку тендера за потреби
  ${complaintID}=  Створити чернетку вимоги  ${username}  ${tender_uaid}  ${claim}  ${target}  ${award_index}
  Завантажити док  ${username}  ${file}  xpath=//div[contains(@id,"${complaintID}")]//button[@id="addClaimDoc"]
  Відкрити розділ вимог і скарг
  Wait Scroll Click     id=qa_SetClaimActiveStatus
  Sleep  15
  [Return]  ${complaintID}

Створити скаргу про виправлення умов
  [Arguments]  ${username}  ${tender_uaid}  ${complaint}  ${target}  ${file}  ${award_index}=0
  Перейти на сторінку тендера за потреби
  ${complaintID}=  Створити чернетку вимоги  ${username}  ${tender_uaid}  ${complaint}  ${target}  ${award_index}
  Завантажити док  ${username}  ${file}  xpath=//div[contains(@id,"${complaintID}")]//button[@id="addClaimDoc"]
  Відкрити розділ вимог і скарг
  Wait Scroll Click     id=qa_escalateClaimToComplaint
  Sleep  15
  [Return]  ${complaintID}

Створити чернетку вимоги
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${target}  ${award_index}=-1
  Відкрити розділ вимог і скарг
  Wait Scroll Click     id=addClaim
  Sleep  1
  Wait and Input        id=title            ${claim.data.title}
  Input Text            id=description      ${claim.data.description}
  ${award_index}=   Evaluate            ${award_index}+${1}
  ${award_index}=   Convert To String   ${award_index}
  Run Keyword If        '${target}'=='award'    Select From List By Index             id=complaintFor  ${award_index}
  Run Keyword Unless    '${target}'=='award'    Select From List By Partial Label     id=complaintFor  ${target}
  Wait and Click     id=btnAddComplaint
  Sleep  10
  Дочекатись зникнення blockUI
  Run Keyword And Return  Get text  xpath=//complaint[contains(.,"${claim.data.description}")]//div[@id='complaintid']

Створити чернетку вимоги про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}   ${claim}  ${target}
  Run Keyword And Return  Створити чернетку вимоги  ${username}  ${tender_uaid}   ${claim}  ${target}

Створити чернетку вимоги про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}   ${claim}
  Run Keyword And Return  Створити чернетку вимоги  ${username}  ${tender_uaid}   ${claim}  тендер

Створити чернетку вимоги про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}   ${claim}  ${award_index}
  Run Keyword And Return  Створити чернетку вимоги  ${username}  ${tender_uaid}   ${claim}  award  ${award_index}

Скасувати вимогу
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
  Перейти на сторінку тендера за потреби
  Відкрити розділ вимог і скарг
  Click Element  xpath=//div[@id='${complaintID}']//*[@name='CancelComplaint']
  Sleep  1  # wait for full input
  Wait and Input    id=cancellationReason      ${cancellation_data.data.cancellationReason}
  Click Element     id=btnCancelComplaint
  Sleep  5

Скасувати скаргу
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
  Перейти на сторінку тендера за потреби
  Відкрити розділ вимог і скарг
  Click Element  xpath=//div[@id='${complaintID}']//*[@id='qa_SetStoppingComplaint']
  Sleep  1  # wait for full input
  Wait and Input    xpath=//form[@name='setStoppingComplaint']//textarea[@placeholder='Причини відхилення']      ${cancellation_data.data.cancellationReason}
  Click Element     xpath=//form[@name='setStoppingComplaint']//*[@id='btnSetStoppingComplaint']

Скасувати вимогу про виправлення умов закупівлі
  [Arguments]  @{arguments}
  Скасувати вимогу  @{arguments}

Скасувати вимогу про виправлення умов лоту
  [Arguments]  @{arguments}
  Скасувати вимогу  @{arguments}

Скасувати вимогу про виправлення визначення переможця
  [Arguments]  @{arguments}
  #last is award_index which is not needed
  Run Keyword And Return If  '${arguments[-2].data.status}'=='stopping'  Скасувати скаргу  @{arguments[:-1]}
  Скасувати вимогу  @{arguments[:-1]}

Select From List By Partial Label
  [Arguments]  ${locator}  ${label}
  [Documentation]  If more than one option is given for a single-selection list, the first value will be selected.
  ${targets_list}=  Get List Items      ${locator}
  ${label}=        Get Matches         ${targets_list}     regexp=.*${label}.*
  Select From List By Label     ${locator}     ${label[0]}

Отримати інформацію із документа до скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${field}
  ${raw_value}=  Get Text  xpath=//a[contains(.,'${doc_id}')]
  [Return]  ${raw_value.split(', ')[-1]}

Отримати інформацію із скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${field}  ${award_index}
  Відкрити розділ вимог і скарг
  ${status}=  Run Keyword And Return Status  Розкрити інформацію про скаргу  ${complaintID}
  Run Keyword If  '${status}'=='FAIL'  Run Keywords  Reload Page  AND  Відкрити розділ вимог і скарг  AND  Розкрити інформацію про скаргу  ${complaintID}
  Run Keyword And Return  Отримати інформацію із скарги про ${field}  ${complaintID}

Розкрити інформацію про скаргу
  [Arguments]  ${complaintID}
  ${is_expanded}=  Get Element Attribute  xpath=//div[@id='${complaintID}']/div@aria-selected
  Run Keyword If  '${is_expanded}'=='false'  Click Element  xpath=//div[@id='${complaintID}']/div

Отримати інформацію із скарги про title
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Element Attribute  xpath=//div[@id='${complaintID}']//*[@name='title']@title

Отримати інформацію із скарги про description
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Text  xpath=//div[@id='${complaintID}']//*[@name='description']

Отримати інформацію із скарги про resolutionType
  [Arguments]  ${complaintID}
  ${resolutionType}=      Wait and Get Text  xpath=//div[@id='${complaintID}']//*[@name='resolutionType']
  Run Keyword And Return  convert_etender_string_to_common_string  ${resolutionType.lower()}

Отримати інформацію із скарги про resolution
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Text  xpath=//div[@id='${complaintID}']//*[@name='resolution']

Отримати інформацію із скарги про satisfied
  [Arguments]  ${complaintID}
  ${satisfied}=  Wait and Get Text  xpath=//div[@id='${complaintID}']//*[@name='satisfied']
  ${satisfied}=  Set Variable  ${satisfied.replace(u'Так', u'True')}
  ${satisfied}=  Set Variable  ${satisfied.replace(u'Ні', u'False')}
  Run Keyword And Return  Convert To Boolean  ${satisfied}

Отримати інформацію із скарги про status
  [Arguments]  ${complaintID}
  Reload Page
  Відкрити розділ вимог і скарг
  ${status}=  Wait and Get Text  xpath=//div[@id='${complaintID}']//*[@name='status']
  Run Keyword And Return  convert_etender_string_to_common_string  ${status.lower()}

Отримати інформацію із скарги про cancellationReason
  [Arguments]  ${complaintID}
  Run Keyword And Return  Wait and Get Text  xpath=//div[@id='${complaintID}']//*[@name='cancellationReason']

Підтвердити вирішення вимоги про виправлення умов закупівлі
  [Arguments]  @{arguments}
  Підтвердити вирішення вимоги про виправлення умов  @{arguments}

Підтвердити вирішення вимоги про виправлення умов лоту
  [Arguments]  @{arguments}
  Підтвердити вирішення вимоги про виправлення умов  @{arguments}

Підтвердити вирішення вимоги про виправлення визначення переможця
  [Arguments]  @{arguments}
  Підтвердити вирішення вимоги про виправлення умов  @{arguments[:-1]}

Підтвердити вирішення вимоги про виправлення умов
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${data}
  Reload Page
  Відкрити розділ вимог і скарг
  ${satisfied}=  Get From Dictionary  ${data}  data
  ${satisfied}=  Get From Dictionary  ${satisfied}  satisfied
  ${satisfied}=  Convert To String    ${satisfied}
  Click Element  xpath=//div[@id='${complaintID}']//button[contains(@click-and-disable,'${satisfied.lower()}')]

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
  ${answer}=     Get From Dictionary  ${answer_data.data}  answer
  Reload Page
  Дочекатись зникнення blockUI
  Відкрити розділ запитань
  Wait Scroll Click     xpath=//*[contains(@id, "addAnswer_")]  # id=addAnswer_0
  Wait and Input        xpath=//*[@name="questionContainer"]/form/div/textarea            ${answer}
  Wait Scroll Click     xpath=//*[@name="questionContainer"]/form/div/span/button[1]
  Sleep  5

Відкрити розділ запитань
  JavascriptClick  '//li[@id="naviTitle1"]/span'
  Дочекатись зникнення blockUI

scrollIntoView by script
  [Arguments]  ${locator}
  [Documentation]  use xpath or id
  ${locator}=       prepare_locator_to_scroll   ${locator}  # convert id to xpath and cut xpath=
  Execute JavaScript  document.evaluate('${locator}', document.documentElement, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).scrollIntoView();
  JavaScript scrollBy  0  -100

JavaScript scrollBy
  [Arguments]  ${x_offset}  ${y_offset}
  Execute JavaScript  window.scrollBy(${x_offset}, ${y_offset})

JavascriptClick
  [Arguments]     ${element_xpath}
  # escape " characters of xpath
  #${element_xpath}=       Replace String      ${element_xpath}        \"  \\\"
  Execute JavaScript  document.evaluate(${element_xpath}, document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

Input String
  [Arguments]  ${locator}  ${value}
  [Documentation]  Converts value to string and inputs to locator field
  ${value}=     Convert To String       ${value}
  Input text    ${locator}              ${value}


Внести зміни в тендер
  [Arguments]  ${username}  ${tender_uaid}  ${field}  ${new_value}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Редагувати поле тендера  ${field}  ${new_value}
  Зберегти зміни в тендері

Редагувати поле тендера
  [Arguments]  ${field}  ${new_value}
  Run Keyword And Return  Редагувати поле ${field}  ${new_value}

Редагувати поле tenderPeriod.endDate
  [Arguments]  ${new_value_isodate}
  ${date}=  convert_date_to_etender_format  ${new_value_isodate}
  run keyword if  '${global_procedure_type}'!='esco'  Input text  id=TenderPeriod  ${date}
  ...              ELSE                    Input text  id=tenderPeriod_endDate_day  ${date}
  ${time}=  convert_time_to_etender_format  ${new_value_isodate}
  run keyword if  '${global_procedure_type}'!='esco'  Input text  id=TenderPeriod_time  ${time}
  ...              ELSE                    Input text  id=tenderPeriod_endDate_time  ${time}

Редагувати поле description
  [Arguments]  ${new_value}
  Input text  id=description  ${new_value}

Змінити лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${field}  ${new_value}
  Перейти до редагування тендера    ${username}  ${tender_uaid}
  Run Keyword  Редагувати поле лота ${field}  ${lot_id}  ${new_value}
  Зберегти зміни в тендері


Натиснути кнопку зберегти зміни у тендері
  ${locator}=  Set Variable  'Access to the path'
  :FOR  ${i}  IN RANGE  3
  \       Wait Scroll Click     id=SaveChanges
  \       ${mutex_status}=  Run Keyword And Return Status  Wait Until Page Contains  ${locator}  5
  \       Return From Keyword If  '${mutex_status}'=='False'
  \       Sleep  20


Зберегти зміни в тендері
  Run Keyword  Натиснути кнопку зберегти зміни у тендері
  Run Keyword And Ignore Error  Wait Scroll Click  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present
  Дочекатись зникнення blockUI

Перейти до редагування тендера
  [Arguments]  ${username}  ${tender_uaid}
  Перейти на сторінку тендера за потреби
  Дочекатись зникнення blockUI
  ${methodType}=  Get Text  id=procedureType
  ${methodType}=  get_method_type   ${methodType.lower()}
  Set Global Variable  ${global_procedure_type}  ${methodType}
  Wait Scroll Click     id=update_tender_btn
  Дочекатись зникнення blockUI

Редагувати поле лота value.amount
  [Arguments]  ${lot_id}  ${new_value}
  ${new_value}=  float_to_string_2f  ${new_value}  # at least 2 fractional point precision, avoid rounding
  Input text  id=lotValue_0  ${new_value}

Редагувати поле лота minimalStep.amount
  [Arguments]  ${lot_id}  ${new_value}
  ${new_value}=  float_to_string_2f  ${new_value}  # at least 2 fractional point precision, avoid rounding
  Input text  id=minimalStep_0  ${new_value}

Редагувати поле лота description
  [Arguments]  ${lot_id}  ${new_value}
  Input text  id=lotDescription_0  ${new_value}

Отримати документ до лоту
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${doc_id}
  Відкрити розділ Деталі Закупівлі
  Відкрити всі лоти
  Run Keyword And Return  etender.Отримати документ  ${username}  ${tender_uaid}  ${doc_id}

Отримати інформацію про status
  Reload Page
  Дочекатись зникнення blockUI
  ${return_value}=   Отримати текст із поля і показати на сторінці   status
  ${return_value}=   convert_etender_string_to_common_string  ${return_value.lower()}
  [Return]  ${return_value}

Отримати інформацію із тендера
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  Run Keyword And Ignore Error  Відкрити всі лоти
  Run Keyword And Return  Отримати інформацію про ${field}

Отримати інформацію про funders[0].name
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_name"]

Отримати інформацію про funders[0].address.countryName
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_country"]

Отримати інформацію про funders[0].address.locality
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_city"]

Отримати інформацію про funders[0].address.postalCode
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_postIndex"]

Отримати інформацію про funders[0].address.region
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_region"]

Отримати інформацію про funders[0].address.streetAddress
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_addressStr"]

Отримати інформацію про funders[0].contactPoint.url
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_url"]

Отримати інформацію про funders[0].identifier.id
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_id"]

Отримати інформацію про funders[0].identifier.legalName
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_legalName"]

Отримати інформацію про funders[0].identifier.scheme
  Run Keyword And Return   Get Text     xpath=//span[@id="funder_scheme"]

Отримати інформацію про agreementDuration
  ${agreementDuration}=    Get Text     xpath=//p[contains(text(), 'Строк, на який укладається рамкова угода:')]
  ${year}  ${month}  ${day}=  convet_raw_to_chack  ${agreementDuration}
  run keyword and return  'P${year}Y${month}M${day}D'


Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}  # TODO remove
  Wait Until Element Is Visible    ${locator.${fieldname}}    30
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [return]  ${return_value}

Отримати інформацію про procurementMethodType
  ${methodType}=    Get Text   id=procedureType
  Run Keyword And Return  get_method_type  ${methodType.lower()}

Отримати інформацію про complaintPeriod.endDate
  ${complaintperiod}=       Get Text    id=complaintPeriod
  Run Keyword And Return    convert_etender_date_to_iso_format    ${complaintperiod}

Отримати інформацію про title
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [return]  ${return_value}

Отримати інформацію про qualificationPeriod.endDate
  Reload Page
  ${datetime}=      Отримати текст із поля і показати на сторінці  qualificationPeriod.endDate
  Run Keyword And Return  convert_etender_date_to_iso_format  ${datetime}

Отримати інформацію про qualifications[0].status
  Reload Page
  Відкрити розділ Деталі Закупівлі
  ${return_value}=  Отримати текст із поля і показати на сторінці  qualifications[0].status
  ${return_value}=  convert_etender_string_to_common_string  ${return_value}
  [return]  ${return_value}

Отримати інформацію про qualifications[1].status
  Reload Page
  Відкрити розділ Деталі Закупівлі
  ${return_value}=  Отримати текст із поля і показати на сторінці  qualifications[1].status
  ${return_value}=  convert_etender_string_to_common_string  ${return_value}
  [return]  ${return_value}

Отримати інформацію про description
  ${return_value}=   Отримати текст із поля і показати на сторінці   description
  [return]  ${return_value}

Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   parse_currency_value_with_spaces   ${return_value}
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про minimalStepPercentage
  ${return_value}=   Wait and Get Attribute  //span[contains(@id, 'minimalStepPercentage')]  value
  Run Keyword And Return  Convert To Number  ${return_value}

Отримати інформацію про NBUdiscountRate
  ${return_value}=  Wait and Get Attribute  id=nbuDiscRate  value
  Run Keyword And Return  Convert To Number  ${return_value}

Отримати інформацію про fundingKind
  ${return_value}=   Wait and Get Text  //span[contains(@id, 'fundingKind')]
  Run Keyword And Return   convert_etender_string_to_common_string  ${return_value}

Отримати інформацію про yearlyPaymentsPercentageRange
  ${return_value}=   Wait and Get Attribute  //span[contains(@id, 'yearlyPaymentsPercentageRange')]  value
  Run Keyword And Return  Convert To Number  ${return_value}


Отримати інформацію із лоту про minimalStepPercentage
  [Arguments]  ${lot_block}
  ${return_value}=  Wait and Get Attribute  ${lot_block}//span[contains(@id, 'minimalStepPercentage')]  value
  Run Keyword And Return  Convert To Number  ${return_value}


Отримати інформацію із лоту про fundingKind
  [Arguments]  ${lot_block}
  ${return_value}=  Wait and Get Text  ${lot_block}//span[contains(@id, 'fundingKind')]
  Run Keyword And Return   convert_etender_string_to_common_string  ${return_value}


Отримати інформацію із лоту про yearlyPaymentsPercentageRange
  [Arguments]  ${lot_block}
  ${return_value}=  Wait and Get Attribute  ${lot_block}//span[contains(@id, 'yearlyPaymentsPercentageRange')]  value
  Run Keyword And Return  Convert To Number  ${return_value}



Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці  value.amount
  ${return_value}=   Set Variable  ${return_value.replace(u'\xa0','')}  # nbsp converting attempt
  ${return_value}=   Set Variable  ${return_value.replace(' ','')}
  ${return_value}=   Convert To Number   ${return_value.replace(',','.')}
  [return]  ${return_value}

Отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.currency
  [return]  ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  ${return_value}=  Run Keyword If  'ПДВ' in '${return_value}'  Set Variable  True
    ...  ELSE  Set Variable  False
  Run Keyword And Return  Convert To Boolean   ${return_value}

Отримати інформацію про causeDescription
  ${return_value}=  Отримати текст із поля і показати на сторінці  causeDescription
  [return]  ${return_value}

Отримати інформацію про cause
  ${return_value}=  Отримати текст із поля і показати на сторінці  cause
  ${return_value}=  convert_etender_string_to_common_string  ${return_value}
  [return]  ${return_value}


#Отримати інформацію про contracts[0].status
#  Reload Page
#  Відкрити розділ Деталі Закупівлі
#  Відкрити всі лоти
#  ${return_value}=  Отримати текст із поля і показати на сторінці  contracts[0].status
#  ${return_value}=  Set Variable  ${return_value.strip()}
#  ${return_value}=  convert_etender_string_to_common_string  ${return_value}
#  [return]  ${return_value}
#
#Отримати інформацію про contracts[0].dateSigned
#  ${return_value}=  Get Text  id=qa_dateSigned
#  ${return_value}=  parse_etender_date  ${return_value}  True
##  Wait Scroll Click  xpath=//input[contains(@id,"contractDocuments")]  #развернуть документы контракта
#  [return]  ${return_value}
#
#Отримати інформацію про contracts[0].period.startDate
#  ${return_value}=  Get Text  id=qa_contractPeriodStartDate
#  Run Keyword And Return  cut_letters_and_parse_etender_date  ${return_value}
#
#Отримати інформацію про contracts[0].period.endDate
#  ${return_value}=  Get Text  id=qa_contractPeriodEndDate
#  Run Keyword And Return  cut_letters_and_parse_etender_date  ${return_value}
#
#Отримати інформацію про contracts[0].value.amount
#  ${return_value}=  Get Text  id=qa_contractAmount
#  [return]  ${return_value}
#  TODO: 5 методов ниже дублируют 5 методов выше, нижние более универсальны

Отримати інформацію про contracts[${n}].value.amount
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  ${i}=  Convert To String  ${n}
  Run Keyword And Return  Get Text  xpath=(//span[@id="qa_contractAmount"])[${i}]


Отримати інформацію про contracts[${n}].dateSigned
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  ${i}=  Convert To String  ${n}
  ${return_value}=  Get Text  xpath=(//div[@id="qa_dateSigned"])[${i}]
  Run Keyword And Return  parse_etender_date  ${return_value}  True


Отримати інформацію про Contracts[${n}].period.startDate
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  ${i}=  Convert To String  ${n}
  ${return_value}=  Get Text  xpath=(//span[@id="qa_contractPeriodStartDate"])[${i}]
  Run Keyword And Return  cut_letters_and_parse_etender_date  ${return_value}


Отримати інформацію про contracts[${n}].period.endDate
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  ${i}=  Convert To String  ${n}
  ${return_value}=  Get Text  xpath=(//span[@id="qa_contractPeriodEndDate"])[${i}]
  Run Keyword And Return  cut_letters_and_parse_etender_date  ${return_value}


Отримати інформацію про Contracts[${n}].status
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  log  ${n}
  ${n}=  Run Keyword If  '${n}'=='0'  Evaluate  ${n}+1  ELSE  Set Variable  0
  ${i}=  Convert To String  ${n}
  ${return_value}=  Get Text  xpath=(//div[@id="qa_contractStatus"])[${i}]
  Run Keyword And Return  convert_etender_string_to_common_string  ${return_value}


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

Отримати інформацію про procuringEntity.address.countryName
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.countryName
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.locality
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.locality
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.postalCode
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.postalCode
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.region
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.region
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.streetAddress
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.streetAddress
  [return]  ${return_value}

Отримати інформацію про procuringEntity.contactPoint.name
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.contactPoint.name
  [return]  ${return_value}

Отримати інформацію про procuringEntity.contactPoint.telephone
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.contactPoint.telephone
  [return]  ${return_value}

Отримати інформацію про procuringEntity.contactPoint.url
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.contactPoint.url
  [return]  ${return_value}

Отримати інформацію про procuringEntity.identifier.legalName
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.identifier.legalName
  [return]  ${return_value}

Отримати інформацію про procuringEntity.identifier.scheme
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.identifier.scheme
  ${return_value}=  Set Variable   ${return_value[:-1]}
  ${return_value}=  Set Variable   ${return_value.replace(u"Код ","")}
  ${return_value}=  Set Variable   ${return_value.replace(u"ЄДРПОУ","UA-EDR")}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.identifier.id
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.identifier.id
  [return]  ${return_value}

Отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  tenderPeriod.startDate
  ${return_value}=   Set Variable  ${return_value.replace(u'з ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  tenderPeriod.endDate
  ${return_value}=   Set Variable  ${return_value.replace(u'по ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про enquiryPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  enquiryPeriod.startDate
  ${return_value}=   Set Variable  ${return_value.replace(u'з ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  enquiryPeriod.endDate
  ${return_value}=   Set Variable  ${return_value.replace(u'по ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}


Отримати дані про clarificationsUntil
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Return  Get Text  xpath=//*[@id='qa_ComplaintPeriodFinished']


Отримати інформацію про enquiryPeriod.clarificationsUntil
  ${return_value}=  Wait Until Keyword Succeeds   10 s  5 x  Отримати дані про clarificationsUntil
  ${return_value}=  Set Variable  ${return_value.replace(u'Період подачі вимог/скарг на умови закупівлі завершився - ','')}
  Log  ${return_value}
  ${return_value}=  add_minutes_to_etender_date  ${return_value}
  Log  ${return_value}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}


Отримати інформацію про items[0].additionalClassifications[0].id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}

Отримати інформацію про items[0].additionalClassifications[0].scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value}

Отримати інформацію про items[0].additionalClassifications[0].description
  Run Keyword And Return    Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].description

Отримати інформацію про questions[${i}].title
  ${locator}=  Set Variable  id=quest_title_${i}
  Відкрити розділ запитань
  Wait Until Element Is Visible         ${locator}    30
  Run Keyword And Return   Get Text     ${locator}

Отримати інформацію про questions[${i}].description
  ${locator}=  Set Variable  id=quest_descr_${i}
  Відкрити розділ запитань
  Wait Until Element Is Visible         ${locator}    30
  Run Keyword And Return   Get Text     ${locator}

Отримати інформацію про questions[0].date
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   questions[0].date

Отримати інформацію про questions[${i}].answer
  Reload Page
  ${locator}=  Set Variable  id=question_answer_${i}
  Відкрити розділ запитань
  Wait Until Element Is Visible         ${locator}    30
  Run Keyword And Return   Get Text     ${locator}

Отримати інформацію про awards[${n}].complaintPeriod.endDate
  Перейти на сторінку тендера за потреби
  Дочекатись зникнення blockUI
  Run Keyword And Ignore Error  Відкрити всі лоти
  Відкрити розділ Деталі Закупівлі
  ${i}=  Evaluate  ${n}+1
  ${i}=  Convert To String  ${i}
  ${return_value}=  Get Text  xpath=//div[@ng-if="award.complaintPeriod.endDate"]/div[2]/span
  ${return_value}=  Set Variable  ${return_value.replace(u'по ','')}
  Run Keyword And Return     convert_etender_date_to_iso_format_and_add_timezone   ${return_value}

Отримати інформацію про awards[0].status
  Відкрити розділ Деталі Закупівлі
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].status
  ${return_value}=  Set Variable  ${return_value.strip()}
  Run Keyword And Return    convert_etender_string_to_common_string   ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.countryName
  Відкрити розділ Деталі Закупівлі
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Run Keyword And Return    Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.countryName

Отримати інформацію про awards[0].suppliers[0].address.locality
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.locality
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.postalCode
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.postalCode
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.region
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.region
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.streetAddress
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.streetAddress
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].name
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].name
  [return]  ${return_value}

Отримати інформацію про awards[0].value.valueAddedTaxIncluded
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].value.valueAddedTaxIncluded
  ${return_value}=  Set Variable  ${return_value.strip()}
  Run Keyword And Return    convert_etender_string_to_common_string     ${return_value}

Отримати інформацію про awards[0].value.currency
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].value.currency
  # process values like this:   "   9 254,00 UAH, включаючи ПДВ  "
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${return_value}=  Set Variable  ${return_value.split(',')[1]}
  ${return_value}=  Set Variable  ${return_value.split(' ')[1]}
  [return]  ${return_value}

Отримати інформацію про awards[0].value.amount
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].value.amount
  # process values like this  "   9 254,00 UAH, включаючи ПДВ  "
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${part_one}=  Set Variable  ${return_value.split(',')[0]}
  ${part_two}=  Set Variable  ${return_value.split(',')[1]} # get fractional part with currency
  ${part_two}=  Set Variable  ${part_two.split(' ')[0]}  # remove currency and leave fractional part only
  ${part_one}=  Set Variable  ${part_one.replace(u'\xa0','')}
  ${part_one}=  Set Variable  ${part_one.replace(' ','')}
  ${return_value}=  Set Variable  ${part_one}.${part_two}
  ${return_value}=  Convert To Number  ${return_value}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].contactPoint.telephone
  Відкрити розділ Деталі Закупівлі
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].contactPoint.telephone
  ${return_value}=  Set Variable  ${return_value.replace(u'Телефон: ','')}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].contactPoint.name
  Run Keyword And Ignore Error  Відкрити всі лоти
  Mouse Over  xpath=//li[@id="naviTitle0"]/span   # just to move cursor away
  Sleep  1
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].contactPoint.name
  ${return_value}=  Set Variable  ${return_value.replace(u'Контактна особа: ','')}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].contactPoint.email
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].contactPoint.email
  ${return_value}=  Set Variable  ${return_value.replace(u'email: ','')}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].identifier.scheme
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].identifier.scheme
  ${return_value}=  Set Variable  ${return_value.replace(u'Код ','')}
  ${return_value}=  Set Variable  ${return_value.split(':')[0]}
  ${return_value}=  Set Variable  ${return_value.replace(u"ЄДРПОУ","UA-EDR")}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].identifier.legalName
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].identifier.legalName
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].identifier.id
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].identifier.id
  ${return_value}=  Set Variable  ${return_value.split(':')[1]}
  ${return_value}=  Set Variable  ${return_value.strip()}
  [return]  ${return_value}

Отримати інформацію про documents[0].title
  Відкрити розділ Деталі Закупівлі
  Run Keyword And Return  Get Text  xpath=//td[contains(@class,"doc-name")]//a

Отримати інформацію про awards[0].documents[0].title
  Відкрити розділ Деталі Закупівлі
  Sleep  10
  Wait and Click    xpath=//label[@for="showAwards00"]
  Sleep  1
  Run Keyword And Return  Get Text  xpath=//awards-info//td[contains(@class,"doc-name")]//a

Отримати посилання на аукціон для глядача
  [Arguments]  ${username}  ${tender_uaid}  @{arguments}
  Reload Page
  Відкрити розділ Деталі Закупівлі
  Page Should Contain Element  xpath=//a[contains(.,"Подивитись процедуру проведення аукціону")]
  Sleep  3
  Run Keyword And Return  Get Element Attribute  xpath=//a[contains(.,"Подивитись процедуру проведення аукціону")]@href

Отримати посилання на аукціон для учасника
  [Arguments]  ${username}  ${tender_uaid}  @{arguments}
  Reload Page
  Відкрити розділ Деталі Закупівлі
  Page Should Contain Element  xpath=//a[@id='participationUrl_0']
  Sleep  3
  Run Keyword And Return  Get Element Attribute  xpath=//*[@id="participationUrl_0"]@href

Отримати інформацію про auctionPeriod.startDate
  ${date}=  Get Text  id=auctionStartDate
  Run Keyword And Return  convert_etender_date_to_iso_format_and_add_timezone  ${date}

Отримати інформацію про auctionPeriod.endDate
  ${date}=  Get Text  id=auctionEndDate
  Run Keyword And Return  convert_etender_date_to_iso_format_and_add_timezone  ${date}

Отримати інформацію із лоту про auctionPeriod.startDate
  [Arguments]  ${lot_block}
  ${date}=  Get Text  ${lot_block}//div[contains(@class, 'auctionData ng-scope')]//b
  Run Keyword And Return  convert_etender_date_to_iso_format_and_add_timezone  ${date}

Отримати інформацію із лоту про auctionPeriod.endDate
  [Arguments]  ${lot_block}
  ${date}=  Get Text  id=auctionEndDate
  Run Keyword And Return  convert_etender_date_to_iso_format_and_add_timezone  ${date}

Отримати інформацію про milestones[${n}].code
  Відкрити всі лоти
  ${value}=  Get Text  xpath=//*[@id="qa_milestone_${n}"]//div[@id="qa_milestoneCode"]
  Run Keyword And Return  convert_milestone_from_text_to_code  ${value}

Отримати інформацію про milestones[${n}].title
  ${value}=     Get Text        xpath=//*[@id="qa_milestone_${n}"]//div[@id="qa_milestoneTitle"]
  Run Keyword And Return  convert_milestone_from_text_to_title  ${value}

Отримати інформацію про milestones[${n}].percentage
  ${value}=     Get Text        xpath=//*[@id="qa_milestone_${n}"]//div[@id="qa_milestonePercentage"]
  Run Keyword And Return  Convert To Number  ${value}

Отримати інформацію про milestones[${n}].duration.days
  ${value}=     Get Text        xpath=//*[@id="qa_milestone_${n}"]//div[@id="qa_milestoneDurationDays"]
  Run Keyword And Return  Convert To Number  ${value}

Отримати інформацію про milestones[${n}].duration.type
  ${value}=     Get Text        xpath=//*[@id="qa_milestone_${n}"]//div[@id="qa_milestoneDurationType"]
  Run Keyword And Return  convert_milestone_from_text_to_day_type  ${value}

Отримати інформацію про mainProcurementCategory
  ${value}=     Get Text        xpath=//div[@id="qa_mainProcurementCategory"]
  Run Keyword And Return  convert_main_procurement_category  ${value}

Отримати інформацію із предмету
  [Arguments]    ${username}    ${tender_uaid}    ${item_id}    ${fieldname}
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  ${item_row}=  Set Variable    xpath=//tr[contains(.,'${item_id}')]
  Run Keyword And Return    Отримати інформацію із предмету про ${fieldname}  ${item_row}

Отримати інформацію із предмету про description
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'item_description')]

Отримати інформацію із предмету про deliveryDate.startDate
  [Arguments]  ${item_row}
  ${return_value}=  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_start')]
  ${return_value}=   Set Variable  ${return_value.replace(u'з ','')}
  Run Keyword And Return    convert_etender_date_to_iso_format   ${return_value}, 00:00

Отримати інформацію із предмету про deliveryDate.endDate
  [Arguments]  ${item_row}
  ${return_value}=  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_end')]
  Run Keyword And Return    convert_etender_date_to_iso_format   ${return_value.replace(u'по ','')}, 00:00

# TODO: фикс ET-14350 - починит 7 кейсов ниже

Отримати інформацію із предмету про deliveryAddress.countryName
  [Arguments]  ${item_row}
  ${text}=  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_country')]
#  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_country')]
  Run Keyword And Return  Fetch From Left  ${text}  ,

Отримати інформацію із предмету про deliveryAddress.region
  [Arguments]  ${item_row}
#  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_region')]
  ${text}=  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_region')]
  Run Keyword And Return  Fetch From Left  ${text}  ,

Отримати інформацію із предмету про deliveryAddress.postalCode
  [Arguments]  ${item_row}
#  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_postIndex')]
  ${text}=  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_postIndex')]
  Run Keyword And Return  Fetch From Left  ${text}  ,

Отримати інформацію із предмету про deliveryAddress.locality
  [Arguments]  ${item_row}
  ${text}=  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_city')]
  Run Keyword And Return  Fetch From Left  ${text}  ,

Отримати інформацію із предмету про deliveryAddress.streetAddress
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_addressStr')]

Отримати інформацію із предмету про deliveryLocation.latitude
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_latitude')]

Отримати інформацію із предмету про deliveryLocation.longitude
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'delivery_longitude')]

Отримати інформацію із предмету про classification.scheme
  [Arguments]  ${item_row}
  ${return}=  Wait and Get Text  //table[contains(@class,"itemTable")]//th[contains(.,"Класифікатор ")]
  Run Keyword And Return  convert_etender_string_to_common_string  ${return}

Отримати інформацію із предмету про classification.id
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'classification_code')]

Отримати інформацію із предмету про classification.description
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'classification_name')]

Отримати інформацію із предмету про unit.name
  [Arguments]  ${item_row}
  Run Keyword And Return  Wait and Get Text  ${item_row}//*[contains(@id,'item_unit')]

Отримати інформацію із предмету про unit.code
  [Arguments]  ${item_row}
  ${return_value}=  Wait and Get Text  ${item_row}//*[contains(@id,'item_unit')]
  Run Keyword And Return  convert_unit_name_to_unit_code  ${return_value}

Отримати інформацію із предмету про quantity
  [Arguments]  ${item_row}
  ${quantity}=  Wait and Get Text  ${item_row}//*[contains(@id,'item_quantity')]
  Run Keyword And Return  Convert To Number  ${quantity}

Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field}
  Reload Page
  Дочекатись зникнення blockUI
  ${question_locator}=  Set Variable  xpath=//div[@name="questionBlock" and contains(.,"${question_id}")]
  log  ${question_locator}
  Відкрити розділ запитань
  Wait Until Element Is Visible  ${question_locator}  10
  Run Keyword And Return   Get Text  ${question_locator}//*[@name="question_${field}"]

Отримати інформацію із документа
# TODO: refactor
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  ${prepared_locator}=  Set Variable  ${locator_document_${field}.replace('XX_doc_id_XX','${doc_id}')}
  log  ${prepared_locator}
  Run Keyword And Ignore Error  Розгорнути документи договору
  Wait Until Page Contains Element  ${prepared_locator}  10
#  ${raw_value}=   Get Text  ${prepared_locator}
  scrollIntoView by script  ${prepared_locator}
  ${raw_value}=  Get Element Attribute    ${prepared_locator}@innerText
  Capture Page Screenshot
  Run Keyword And Return  Конвертувати інформацію із документа про ${field}  ${raw_value}

Розгорнути документи договору
  JavascriptClick  '//input[contains(@id, "contractDocuments")]'  # костыль для открытия доков когтракта

Конвертувати інформацію із документа про title
  [Arguments]  ${raw_value}
  ${return_value}=  Set Variable  ${raw_value.split(',')[0]}
  [return]  ${return_value}

Конвертувати інформацію із документа про description
  [Arguments]  ${raw_value}
  ${return_value}=  Set Variable  ${raw_value.split('(')[1].replace(')','')}
  [return]  ${return_value}

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  ${title}=  etender.Отримати інформацію із документа  ${username}  ${tender_uaid}  ${doc_id}  title
  ${prepared_locator}=  Set Variable  ${locator_document_href.replace('XX_doc_id_XX','${doc_id}')}
  log  ${prepared_locator}
  ${href}=  Get Element Attribute  ${prepared_locator}
  ${document_file}=  download_file_from_url  ${href}  ${OUTPUT_DIR}${/}${title}
  [return]  ${document_file}

Отримати інформацію із лоту
  [Arguments]    ${username}    ${tender_uaid}    ${object_id}    ${fieldname}
  Перейти на сторінку тендера за потреби
  Відкрити всі лоти
  ${lot_block}=  Set Variable    xpath=//div[contains(@lottitle,"${object_id}")]
  Run Keyword And Return    Отримати інформацію із лоту про ${fieldname}  ${lot_block}

Отримати інформацію із лоту про title
  [Arguments]  ${lot_block}
  Run Keyword And Return  Wait and Get Attribute  ${lot_block}//*[contains(@id,'lotTitle')]  title

Отримати інформацію із лоту про description
  [Arguments]  ${lot_block}
  Run Keyword And Return  Wait and Get Text  ${lot_block}//*[contains(@id,'lotDescription')]

Отримати інформацію із лоту про value.amount
  [Arguments]  ${lot_block}
  ${raw_value}=  Wait and Get Attribute  ${lot_block}//*[contains(@id,'lotValue')]  value
  Run Keyword And Return    Convert To Number  ${raw_value}

Отримати інформацію із лоту про value.currency
  [Arguments]  ${lot_block}
  Run Keyword And Return  Wait and Get Text  ${lot_block}//*[contains(@id,'lotCurrency')]

Отримати інформацію із лоту про value.valueAddedTaxIncluded
  [Arguments]  ${lot_block}
  ${raw_value}=  Wait and Get Text  ${lot_block}//*[contains(@id,'lotVatInc')]
  ${raw_value}=  Set Variable If  'ПДВ' in '${raw_value}'     True    False
  Run Keyword And Return    Convert To Boolean   ${raw_value}

Отримати інформацію із лоту про minimalStep.amount
  [Arguments]  ${lot_block}
  ${raw_value}=  Wait and Get Text  ${lot_block}//*[contains(@id,'lotMinimalStep')]
  ${raw_value}=  parse_currency_value_with_spaces  ${raw_value}
  Run Keyword And Return  Convert To Number  ${raw_value}

Отримати інформацію із лоту про minimalStep.valueAddedTaxIncluded
  [Arguments]  ${lot_block}
  ${raw_value}=  Wait and Get Text  ${lot_block}//*[contains(@id,'lotVatInc')]
  ${raw_value}=  Set Variable If  'ПДВ' in '${raw_value}'     True    False
  Run Keyword And Return    Convert To Boolean   ${raw_value}

Отримати інформацію із лоту про minimalStep.currency
  [Arguments]  ${lot_block}
  ${raw_value}=  Wait and Get Text  ${lot_block}//*[contains(@id,'lotMinimalStep')]
  Run Keyword And Return  get_minimalStep_currency  ${raw_value}

Отримати інформацію із нецінового показника
  [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Ignore Error  Wait Scroll Click   xpath=//tr[.//span[contains(.,'${object_id}')]]//span[@data-toggle="collapse"]
  Capture Page Screenshot
  Відкрити всі лоти
  Run Keyword And Return  Отримати інформацію із нецінового показника про ${field_name}  ${object_id}

Отримати інформацію із нецінового показника про title
  [Arguments]  ${object_id}
  Run Keyword And Return  Get Text  xpath=//span[contains(.,'${object_id}')]

Отримати інформацію із нецінового показника про description
  [Arguments]  ${object_id}
  Run Keyword And Return  Get Text  xpath=//span[contains(.,'${object_id}')]/../../..//span[contains(@ng-bind, "description")]

Отримати інформацію із нецінового показника про featureOf
  [Arguments]  ${object_id}
  Run Keyword And Return  Get Element Attribute  xpath=//span[contains(.,'${object_id}')]@name

Відкрити розділ Деталі Закупівлі
  Дочекатись зникнення blockUI
  JavascriptClick  '//li[@id="naviTitle0"]/span'  # go to Деталі Закупівлі tab
  Дочекатись зникнення blockUI

Відкрити розділ вимог і скарг
  Дочекатись зникнення blockUI
  JavascriptClick     '//li[@id="naviTitle2"]/span'  # go to complaints
  Дочекатись зникнення blockUI

Заповнити інформацію про постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${object}  ${document}
  Reload Page
  Відкрити розділ Деталі Закупівлі
  ${amount}=             Get From Dictionary  ${object.data.value}  amount
  ${supplier_name}=      Get From Dictionary  ${object.data.suppliers[0]}               name
  ${supplier_code}=      Get From Dictionary  ${object.data.suppliers[0].identifier}    id
  ${supplier_subcInfo}=  Get From Dictionary  ${object.data.suppliers[0].identifier}    legalName
#  ${qualified}=          Get From Dictionary  ${object.data}                            qualified
  ${countryName}=        Get From Dictionary  ${object.data.suppliers[0].address}       countryName
  ${region}=             Get From Dictionary  ${object.data.suppliers[0].address}       region
  ${locality}=           Get From Dictionary  ${object.data.suppliers[0].address}       locality
  ${streetAddress}=      Get From Dictionary  ${object.data.suppliers[0].address}       streetAddress
  ${postalCode}=         Get From Dictionary  ${object.data.suppliers[0].address}       postalCode
  ${contact_name}=       Get From Dictionary  ${object.data.suppliers[0].contactPoint}  name
  ${contact_email}=      Get From Dictionary  ${object.data.suppliers[0].contactPoint}  email
  ${contact_url}=        Get From Dictionary  ${object.data.suppliers[0].contactPoint}  url
  ${contact_phone}=      Get From Dictionary  ${object.data.suppliers[0].contactPoint}  telephone
  ${contact_fax}=        Get From Dictionary  ${object.data.suppliers[0].contactPoint}  faxNumber
  ${scale}=        Get From Dictionary        ${object.data.suppliers[0]}  scale
  ${amount}=  float_to_string_2f  ${amount}
  Відкрити всі лоти
  Input text  id=amount  ${amount}
  # TODO: read curency from dict
  Select From List By Label  id=currency  грн
  Input text  id=orgName    ${supplier_name}
  Input text  id=orgCode    ${supplier_code}
  Input text  id=subcInfo   ${supplier_subcInfo}
  Select From List By Value     id=orgScale  ${scale}
  # TODO: use qualified from dict
  Run Keyword And Ignore Error  Wait Scroll Click  xpath=//div[@ng-if="!detailes.isLimitedReporting"]//input[1]  # Відповідність кваліфікаційним критеріям: Відповідає
  Select From List By Label  xpath=//select[@ng-model="data.country"]  ${countryName}
  Run Keyword If  '${region}' == 'місто Київ'  Select From List By Label  xpath=//*[contains(@id,"_region")]  місто Київ
  Run Keyword If  '${region}' != 'місто Київ'  Run Keywords
  ...  Select From List By Label  xpath=//*[contains(@id,"_region")]     ${region}
  ...  AND  Input text            xpath=//*[contains(@name,"_newCity")]  ${locality}
  Input text  xpath=//*[contains(@name,"_addressStr")]  ${streetAddress}
  Input text  xpath=//*[contains(@name,"_postIndex")]   ${postalCode}
  Input text  name=cpName  ${contact_name}
  Input text  id=email  ${contact_email}
  Input text  id=url  ${contact_url}
  Input text  id=phone  ${contact_phone}
  Input text  id=fax  ${contact_fax}
  Wait Scroll Click  id=qa_SubmitAwardCreate
  Sleep  30
  Reload Page

Оцінити постачальника в limited процедурі
  [Arguments]  ${username}  ${document}
  Reload Page
  Відкрити розділ Деталі Закупівлі
  Відкрити всі лоти
  Перейти до оцінки кандидата
  Wait and Select By Label      xpath=//div[@ng-controller="modalGetAwardsCtrl"]//select  Повідомлення про рішення
  Завантажити док  ${username}  ${document}  xpath=//button[@ng-model="lists.documentsToAdd"]  id=downloadAwardDocs
  Відкрити розділ Деталі Закупівлі
  Відкрити всі лоти
  Capture Page Screenshot
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата

Підтвердити постачальника в limited процедурі
  [Arguments]  ${username}
  Run Keyword And Ignore Error  Перейти до оцінки кандидата
  ${methodType}=  Get From Dictionary  ${USERS.users['${username}']}  method_type
  Wait Scroll Click  id=qa_NextStep
  Підписати авард
  Run Keyword And Ignore Error  Перейти до оцінки кандидата
  Sleep  5
  Wait Scroll Click         id=qa_NextStep        # button - Наступний крок
  Підтвердити переможця
  Sleep  5


Створити постачальника, додати документацію і підтвердити його
  [Arguments]  ${username}  ${tender_uaid}  ${object}  ${document}
  Sleep  30
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload before signing  # there: button - Перейти до підпису"
  Підписати ЕЦП
  Sleep  30
  Run Keyword  Заповнити інформацію про постачальника  ${username}  ${tender_uaid}  ${object}  ${document}
  Run Keyword  Оцінити постачальника в limited процедурі  ${username}  ${document}
  Run Keyword  Підтвердити постачальника в limited процедурі  ${username}
  ${methodType}=  Get From Dictionary  ${USERS.users['${username}']}  method_type
  Sleep  15


Wait for upload
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Ignore Error  Відкрити всі лоти
  Перейти до оцінки кандидата
  Sleep  2
  Page Should Not Contain  Не всі документи експортовані

Wait for upload before signing
  Reload Page
  Wait Scroll Click     xpath=//button[contains(.,"Перейти до підпису")]  15
  Sleep  1
  Page Should Not Contain  Не всі документи експортовані
  Page Should Not Contain  Не всі документи экспортовано до Центральної бази.
  Wait Until Element Is Visible  id=CAsServersSelect

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_index}
  Перейти на сторінку контракту за потреби
  Log  Temporary sleep to compensate timings, let's wait for 1 minute to be sure  WARN
  Sleep  60
  Reload Page
  Run Keyword And Ignore Error  Відкрити розділ Деталі Закупівлі

  #сделал чтобы не сломать остальную логику на контрактах
  #TODO: вынести переход на стр. контракта в кейворд, почистить код от ненужных действий и ожиданий.

#  ${tmp_location_tender}=  Get Location

# ==================  1 - enter values into fields, save
  Run Keyword And Ignore Error  Відкрити всі лоти
  Run Keyword And Ignore Error  Click Element     xpath=//a[.="Внести інформацію про договір"]
  Wait and Input    id=contractNumber  ${contract_index}
  ${time_now_tmp}=     get_time_now
  ${date_now_tmp}=     get_date_now
  ${date_future_tmp}=  get_date_10d_future
  Input text  name=dateSigned  ${date_now_tmp}
  Input text  name=timeSigned  ${time_now_tmp}
  Input text  name=endDate     ${date_future_tmp}
  Зберегти інформацію про контракт
#  Wait Scroll Click     id=qa_saveContractInfo  # button - Опублікувати документи та завершити пізніше
#  Wait and Input        xpath=//div[@id="saveData"]//button[@ng-click="save(documentsToAdd)"]  10

# ==================  2 - wait for upload
#  Sleep  60  # wait for upload
#  Go To  ${tmp_location_tender}
  Reload Page
#  Capture Page Screenshot
#  Відкрити розділ Деталі Закупівлі
#  Wait Scroll Click     xpath=//a[.="Редагувати інформацію про договір "]

# ==================  3 - upload doc

  Wait and Select By Label      id=docType  Підписаний договір
  ${file_path}  ${file_name}  ${file_content}=   create_fake_doc
  Завантажити док  ${username}  ${file_path}  xpath=//button[@ng-model="documentsToAdd"]
  Run Keyword And Ignore Error  Відкрити розділ Деталі Закупівлі
  Run Keyword And Ignore Error  Wait Scroll Click     id=qa_EditContractInfo
  ${methodType}=  Get From Dictionary  ${USERS.users['${username}']}  method_type
  Run Keyword If  '${methodType}' in ('aboveThresholdEU', 'aboveThresholdUA', 'negotiation', 'reporting')  Підтвердити контракт додаванням ЕЦП
  Wait Scroll Click  xpath=//button[@click-and-block="sign()"]  # button - Завершити закупівлю
  Capture Page Screenshot
  Wait Until Page Contains  Підтверджено!  60

Підписати ЕЦП
  [Arguments]
  Дочекатись зникнення blockUI
  Wait and Select By Label  id=CAsServersSelect  Тестовий ЦСК АТ "ІІТ"
  ${key_dir}=  Normalize Path  ${CURDIR}/../../
  Choose File  id=PKeyFileInput  ${key_dir}/Key-6.dat
  ${PKeyPassword}=  Get File  password.txt
  Wait and Input    id=PKeyPassword  ${PKeyPassword}
  Дочекатись Зникнення blockUI
  Wait and Click    id=PKeyReadButton  5
  Wait and Click    id=SignDataButton  20
  Дочекатись Зникнення blockUI
  Wait and Click    xpath=//div[@id="modalSign"]//button[contains(@class,"close")]

Підтвердити контракт додаванням ЕЦП
  Wait Scroll Click     xpath=//button[@click-and-block="showSignModalContract(contract)"]  10
  Підписати ЕЦП
# shall be signed here -------------------------------------------------------------
  Capture Page Screenshot
  Sleep  30
  Capture Page Screenshot
  Reload Page
  Sleep  5

Редагувати угоду
  [Arguments]  ${username}  ${tender_uaid}  ${contract_index}  ${field}  ${value}
  Перейти на сторінку контракту за потреби
  Run Keyword And Return  Редагувати поле договору ${field}  ${value}


Редагувати поле договору value.amount
  [Arguments]  ${value}
  Input String  id=qa_valueAmount   ${value}
  Зберегти інформацію про контракт


Редагувати поле договору value.amountNet
  [Arguments]  ${value}
  Input String  id=qa_valueAmountNet    ${value}
  # TODO ↓
  Wait and Input    id=contractNumber  contractnumber
  ${time_now_tmp}=     get_time_now
  ${date_now_tmp}=     get_date_now
  ${date_future_tmp}=  get_date_10d_future
  Input text  name=dateSigned  ${date_now_tmp}
  Input text  name=timeSigned  ${time_now_tmp}
  Input text  name=endDate     ${date_future_tmp}
  Зберегти інформацію про контракт

Зберегти інформацію про контракт
  Wait Scroll Click     id=qa_saveContractInfo
  Wait and Click    id=qa_saveData
  Sleep  2

Відповісти на вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
  # TODO: remove workaround and open complaint using given complaintID
  ${tmp_hacked_title}=  Get From Dictionary  ${USERS.users['Tender_User'].tender_claim_data.claim.data}  title
  ${tmp_hacked_id}=     Get From Dictionary  ${USERS.users['Tender_User'].tender_claim_data}  complaintID
  log  ${tmp_hacked_id}
  ${tmp_hacked_title}=  Run Keyword If  '${tmp_hacked_id}' != '${complaintID}'  temporary keyword for title update  ${USERS.users['Tender_User'].lot_claim_data}  ${complaintID}
  ...   ELSE  Set Variable  ${tmp_hacked_title}
  Reload Page
  Sleep   25
  Дочекатись зникнення blockUI
  Відкрити розділ вимог і скарг
  Wait and Click  xpath=//div[@role="tab" and contains(.,"${tmp_hacked_title.split(':')[0]}")]
  Wait Scroll Click  xpath=(//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]
  Sleep  5
  ${resolution}=      Get From Dictionary  ${answer_data.data}  resolution
  ${resolutionType}=  Get From Dictionary  ${answer_data.data}  resolutionType
  ${tendererAction}=  Get From Dictionary  ${answer_data.data}  tendererAction
  Wait and Input    id=tenderAction   ${tendererAction}
  Input text        id=descriptionEl  ${resolution}
  Select From List By Value  id=resolutionTypeEl  ${resolutionType}
  Wait and Click    id=btnanswerComplaint

# TODO  REFACTOR
Відповісти на вимогу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}  ${award_index}
  # TODO: rework duplicated code - see "Відповісти на вимогу про виправлення умов закупівлі"
  # TODO: remove workaround and open complaint using given complaintID
  ${tmp_hacked_title}=  Get From Dictionary  ${USERS.users['Tender_User'].claim_data.claim.data}  title
  Reload Page
  Дочекатись зникнення blockUI
  Відкрити розділ вимог і скарг
  Wait and Click  xpath=//div[@role="tab" and contains(.,"${tmp_hacked_title.split(':')[0]}")]
  Wait Scroll Click  xpath=(//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]
  ${resolution}=      Get From Dictionary  ${answer_data.data}  resolution
  ${resolutionType}=  Get From Dictionary  ${answer_data.data}  resolutionType
  ${tendererAction}=  Get From Dictionary  ${answer_data.data}  tendererAction
  Input text  id=tenderAction   ${tendererAction}
  Input text  id=descriptionEl  ${resolution}
  Select From List By Value  id=resolutionTypeEl  ${resolutionType}
  Wait and Click  id=btnanswerComplaint

temporary keyword for title update
  [Arguments]  ${lot_claim_data}  ${complaintID}
  ${tmp_hacked_title}=  Get From Dictionary  ${lot_claim_data.claim.data}  title
  ${tmp_hacked_id}=     Get From Dictionary  ${lot_claim_data}             complaintID
  [return]  ${tmp_hacked_title}

Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
  Sleep  3
  # TODO: rework duplicated code - see "Створити постачальника, додати документацію і підтвердити його"
  Перейти на сторінку тендера за потреби
  Дочекатись зникнення blockUI
  Перейти до оцінки кандидата
  Дочекатись зникнення blockUI
  Select From List By Label  xpath=//div[@id="modalGetAwards"]//select[@id="docType"]  Повідомлення про рішення
  Завантажити док  ${username}  ${document}  xpath=//div[@id="modalGetAwards"]//button[@id="qa_uploadAwardDocument"]  xpath=//div[@id="modalGetAwards"]//button[@id="downloadAwardDocs"]
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата
  Reload Page

Відхилити кваліфікацію
  [Arguments]  ${username}  ${tender_uaid}  ${bid_index}
  Reload Page
  Дочекатись зникнення blockUI
  ${is_btn_visible}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//button[@id = '#qa_rejectQualif' and @data-target='#cansel-0-${bid_index}']
  run keyword if  '${is_btn_visible}'=='True'  Wait Scroll Click  xpath=//button[@id = '#qa_rejectQualif' and @data-target='#cansel-0-${bid_index}']  15
  Capture Page Screenshot
  Wait Until Page Contains  Підстави для скасування  60

  Capture Page Screenshot
#  Reload Page
  Wait and Click  id=qa_cause0  7
  Wait and Input  id=qa_qualifCancelDescr  texttexttext
  Wait and Click  id=qa_disqualifyPrequalification  10
  Reload Page
  Дочекатись зникнення blockUI


Скасувати кваліфікацію
  [Arguments]  ${username}  ${tender_uaid}  ${bid_index}
  Wait Until Keyword Succeeds  3 x  10 s   Натиснути скасування прекваліфікації  ${bid_index}


Натиснути скасування прекваліфікації
  [Arguments]  ${bid_index}
  Reload Page
  Дочекатись зникнення blockUI
  Capture Page Screenshot
  JavascriptClick  '//div[@id="qa_qualification_block_0${bid_index}"]//button[@id="qa_cancelQualification"]'
  Дочекатись зникнення blockUI


Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  # TODO: rework duplicated code - see "Створити постачальника, додати документацію і підтвердити його"
  Перейти на сторінку тендера за потреби
  Перейти до оцінки кандидата
  Wait Scroll Click     id=qa_NextStep       # button - Наступний крок
  ${passed}=  Run Keyword And Return Status     Підтвердити переможця
  Return From Keyword If  ${passed}  # Выходим если допорог и успешно подтвердили. если нет такой кнопки - идём дальше
  Підписати авард
  Wait Scroll Click     id=qa_NextStep
  ${status}=  Run Keyword And Return Status  Element Should Be Visible  id=qa_selfEligible
  RUN KEYWORD IF  '${status}'=='True'  Wait and Click         id=qa_selfEligible  10
  RUN KEYWORD IF  '${status}'=='True'  Wait and Click         id=qa_selfQualified  10
  Підтвердити переможця

Затвердити постачальників
  Wait and Click  id=submitPreQualification  10

Дискваліфікувати постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  Перейти на сторінку тендера за потреби
  Перейти до оцінки кандидата
  Select From List By Label  xpath=//div[@id="modalGetAwards"]//select[@id="docType"]  Повідомлення про рішення
  ${file_path}  ${file_name}  ${file_content}=   create_fake_doc
  Завантажити док  ${username}  ${file_path}  xpath=//div[@id="modalGetAwards"]//button[@id="qa_uploadAwardDocument"]  xpath=//div[@id="modalGetAwards"]//button[@id="downloadAwardDocs"]
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата
  Reload Page
  Перейти до оцінки кандидата
  Wait Scroll Click     id=qa_NextStep
  Підписати авард
  Reload Page
  Перейти до оцінки кандидата
  Wait Scroll Click     id=qa_NextStep
  Відхилити переможця
  Sleep  5
  Wait and Click  xpath=//input[@ng-model="checked"]
  Wait and Input  id=qa_causeDesc  Hello
  Wait and Click  id=qa_CancelAward
  Reload Page


Підписати авард
  Wait and Click    id=qa_OpenSignModal
  Підписати ЕЦП
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата

Підтвердити переможця
  Wait and Click    id=qa_accept_award

Відхилити переможця
  Wait and Click    id=qa_disqualify_award

Перейти до оцінки кандидата
  Sleep  20
  Wait Scroll Click    xpath=//a[@data-target="#modalGetAwards"]
  Дочекатись зникнення blockUI

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  Перейти на сторінку тендера за потреби
  Sleep  5
  Reload Page
  Sleep  15
  Wait and Click    xpath=//button[@data-target="#modalCancelAward"]
  Wait and Input    xpath=//textarea[@ng-model="cancelAwardModel.description"]  text
  Wait and Click    xpath=//button[@ng-click="cancelAward()"]
  Sleep  15
  Reload Page

Відкрити подробиці кваліфікації за індексом
  [Arguments]  ${qualification_num}
  Дочекатись зникнення blockUI
  Capture Page Screenshot
  Sleep  5
  ${status}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//div[@id="accordion-0-${qualification_num}"]//button[contains(.,"Допустити до аукціону") and @data-toggle="collapse"]   # inner confirmation button
  RUN KEYWORD IF  '${status}'=='True'  Wait Until Element Is Visible  xpath=//div[@id="accordion-0-${qualification_num}"]//button[contains(.,"Допустити до аукціону") and @data-toggle="collapse"]   # inner confirmation button
  ${is_expanded}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//div[@id="aply-0-${qualification_num}"]//button[@click-and-block="vm.q.active(qualification)"]
  Return From Keyword If  '${is_expanded}' != 'False'
  ${newis_expanded}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//div[contains(@id, "aply-0-")]//button[@click-and-block="vm.q.active(qualification)"]
  Return From Keyword If  '${newis_expanded}' != 'False'
  RUN KEYWORD IF  '${status}'=='True'  Wait Scroll Click     xpath=//div[@id="accordion-0-${qualification_num}"]//button[contains(.,"Допустити до аукціону") and @data-toggle="collapse"]
  ...         ELSE  Wait Scroll Click  xpath=//div[contains(@id, "accordion-0-")]//button[contains(.,"Допустити до аукціону") and @data-toggle="collapse"]
  Sleep  10
  Capture Page Screenshot

Wait for doc upload in qualification
  [Arguments]  ${qualification_num}
  Reload Page
  Wait Scroll Click     xpath=(//div[contains(@class,"row")]//div[contains(@ng-if,"qualification.documents.length") and contains(.,"Показати документи")])[1+${qualification_num}]
  Page Should Not Contain  Очікує публікації в ЦБД

Завантажити документ у кваліфікацію
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${qualification_num}
  Перейти на сторінку тендера за потреби
  Дочекатись зникнення blockUI
  Відкрити розділ Деталі Закупівлі
  Capture Page Screenshot
  Відкрити подробиці кваліфікації за індексом  ${qualification_num}
  Sleep  1
  Capture Page Screenshot
  Завантажити док  ${username}  ${document}  xpath=//div[@id="aply-0-${qualification_num}"]//button[@ng-model="qualification.addDocuments"]
  Відкрити розділ Деталі Закупівлі
  Wait Until Keyword Succeeds   10 min  20 x  Wait for doc upload in qualification  ${qualification_num}  # there: open qualification doc section and check are all docs are loaded
  Capture Page Screenshot
  Reload Page

Підтвердити кваліфікацію
  [Arguments]  ${username}  ${tender_uaid}  ${qualification_num_p}
  ${qualification_num}=  Set Variable  ${qualification_num_p}
  ${qualification_num}=     get_modulus_from_number   ${qualification_num}
# Upload document to qualification object
  Перейти на сторінку тендера за потреби
  Дочекатись зникнення blockUI
  Відкрити розділ Деталі Закупівлі
  Відкрити подробиці кваліфікації за індексом  ${qualification_num}

# Set qualification checkboxes and approve it
  Sleep  10
  Відкрити подробиці кваліфікації за індексом  ${qualification_num}
  ${newstatus}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//div[@id="aply-0-${qualification_num}"]//input[@ng-model="qualification.eligible"]
  run keyword if  '${newstatus}'=='True'  Wait Scroll Click  xpath=//div[@id="aply-0-${qualification_num}"]//input[@ng-model="qualification.eligible"]
   ...         ELSE                     Wait Scroll Click  xpath=//div[contains(@id, "aply-0-")]//input[@ng-model="qualification.eligible"]
  run keyword if  '${newstatus}'=='True'  Wait and Click     xpath=//div[@id="aply-0-${qualification_num}"]//input[@ng-model="qualification.qualified"]
   ...         ELSE                     Wait and Click     xpath=//div[contains(@id, "aply-0-")]//input[@ng-model="qualification.qualified"]
  Capture Page Screenshot
  run keyword if  '${newstatus}'=='True'  Wait Scroll Click  xpath=//div[@id="aply-0-${qualification_num}"]//button[@click-and-block="vm.q.active(qualification)"]
   ...         ELSE                     Wait Scroll Click  xpath=//div[contains(@id, "aply-0-")]//button[@click-and-block="vm.q.active(qualification)"]
  Wait Until Page Contains  Пропозицію кваліфіковано!  60


Затвердити остаточне рішення кваліфікації
  [Arguments]  ${username}  ${tender_uaid}
  Capture Page Screenshot
  Reload Page
  Wait Scroll Click     id=qa_startStandStillPeriod
  Sleep  360
  Reload Page


Створити другий етап
  Reload Page
  Дочекатись зникнення blockUI
  Capture Page Screenshot
  Click Element  xpath=//button[text()="Оголосити 2-ий етап"]
  Sleep  3
  Reload Page
  Capture Page Screenshot


Перевести тендер на статус очікування обробки мостом
  [Arguments]  ${username}  ${tender_uaid}
  Перейти на сторінку тендера за потреби
  ${passed}=  Run Keyword And Return Status  Wait Until Keyword Succeeds  60 s  30 s  Створити другий етап


Отримати тендер другого етапу та зберегти його
  [Arguments]  ${username}  ${tender_uaid}
  Перейти на сторінку тендера за потреби
  Reload Page
  Дочекатись зникнення blockUI
  Capture Page Screenshot
  Reload Page


Активувати другий етап
  [Arguments]  ${username}  ${tender_uaid}
  Перейти на сторінку тендера за потреби
  Log  ${tender_uaid}
  Reload Page
  Дочекатись зникнення blockUI
  Click Element  xpath=//a[contains(normalize-space(text()), "Посилання на 2-й етап")]
  Дочекатись зникнення blockUI
  Click Element  id=update_tender_btn
  Дочекатись зникнення blockUI
  ${new_time_value}=  Run Keyword  get_time_offset
  Input String  xpath=//input[@ng-model="updateTenderModel.tenderPeriod.endDate" and @placeholder="час"]  ${new_time_value}
  Click Element  xpath=//button[@click-and-block="submit()"]
  Дочекатись зникнення blockUI
  Run Keyword And Ignore Error  Wait Scroll Click  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present
  Дочекатись зникнення blockUI
  Click Element  xpath=//a[@ng-click="vm.activeTendering()"]
  Дочекатись зникнення blockUI
  Sleep  30
