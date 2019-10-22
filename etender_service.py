# -*- coding: utf-8 -
from time import strftime

from iso8601 import parse_date
from datetime import datetime, date, time, timedelta
import dateutil.parser
from pytz import timezone
import os
from decimal import Decimal
import re


TZ = timezone(os.environ['TZ'] if 'TZ' in os.environ else 'Europe/Kiev')

def get_all_etender_dates(initial_tender_data):
    tender_period = initial_tender_data.tenderPeriod
    start_dt = dateutil.parser.parse(tender_period['startDate'])
    end_dt = dateutil.parser.parse(tender_period['endDate'])
    data = type('periods', (), {  # dynamically creating objects instead of another dict
        'tenderStart': type('date', (), {'date': start_dt.strftime("%d-%m-%Y"),
                                         'time': start_dt.strftime("%H:%M")}),
        'tenderEnd': type('date', (), {'date': end_dt.strftime("%d-%m-%Y"),
                                       'time': end_dt.strftime("%H:%M")})})
    if 'enquiryPeriod' in initial_tender_data:
        end_period = dateutil.parser.parse(initial_tender_data.enquiryPeriod['endDate'])
        data.enquiryEnd = type('date', (), {'date': end_period.strftime("%d-%m-%Y"),
                                            'time': end_period.strftime("%H:%M")}) 
    return data

def get_procedure_type(methodType):
    return {
        'aboveThresholdUA': 'Відкриті торги',
        'belowThreshold': 'Допорогові закупівлі',
        'negotiation': 'Переговорна процедура',
        'aboveThresholdEU': 'Відкриті торги з публікацією англійською мовою',
        'aboveThresholdUA.defense': 'Переговорна процедура для потреб оборони',
        'reporting': 'Звіт про укладений договір',
        'competitiveDialogueEU': 'Конкурентний діалог з публікацією англійською мовою 1-ий етап',
        'competitiveDialogueUA': 'Конкурентний діалог 1-ий етап',
        'open_esco': 'Відкриті торги для закупівлі енергосервісу',
        'esco': 'Відкриті торги для закупівлі енергосервісу',
        'closeFrameworkAgreementUA': 'Відкриті торги для укладання рамкової угоди',
        'open_framework': 'Відкриті торги для укладання рамкової угоди'
    }[methodType].decode('utf-8')

def get_method_type(procedure_name):
    return {
        u'переговорна процедура для потреб оборони': 'aboveThresholdUA.defense',
        u'допорогові закупівлі': 'belowThreshold',
        u'відкриті торги з публікацією англійською мовою': 'aboveThresholdEU',
        u'переговорна процедура': 'negotiation',
        u'відкриті торги': 'aboveThresholdUA',
        u'конкурентний діалог 1-ий етап': 'competitiveDialogueUA',
        u'конкурентний діалог 2-ий етап': 'competitiveDialogueUA.stage2',
        u'звіт про укладений договір': 'reporting',
        u'відкриті торги для закупівлі енергосервісу': 'open_esco',
        u'відкриті торги для закупівлі енергосервісу': 'esco',
        u'конкурентний діалог з публікацією англійською мовою 1-ий етап': 'competitiveDialogueEU',
        u'конкурентний діалог з публікацією англійською мовою 2-ий етап': 'competitiveDialogueEU.stage2',
        u'відкриті торги для укладання рамкової угоди': 'closeFrameworkAgreementUA',
        u'відкриті торги для укладання рамкової угоди': 'open_framework'

    }[procedure_name]


def parse_etender_date(date, as_string=False):
    # converts date from ui to datetime
    d = datetime.strptime(date, '%d-%m-%Y, %H:%M')
    if as_string:
        return str(d)
    return d


def cut_letters_and_parse_etender_date(date, as_string=True):
    # converts date from ui
    d = datetime.strptime(date.split(' ')[1], '%d-%m-%Y')
    if as_string:
        return str(d)
    return d


def prepare_locator_to_scroll(locator):
    if locator[:3] == 'id=':
        return '//*[@id="{}"]'.format(locator[3:])
    return locator[6:].replace("'", '"')  # 6 for xpath=


def to_iso(date):
    return date.isoformat()


def convert_etender_date_to_iso_format(date):
    return TZ.localize(parse_etender_date(date)).isoformat()


def convet_fra_to_variable(raw):
    b = re.findall(r'P(\d+)Y(\d+)M(\d+)D.*', raw)
    c, d, e = b[0]
    return c, d, e


def convet_raw_to_chack(raw):
    raw = raw.replace(' ', '')
    b = re.findall(r'(\d+)р(\d+)м(\d+)д', raw)
    c, d, e = b[0]
    return c, d, e


def get_year_from_full_date(string):
    data_as_str = string.split('T')[0]
    data_as_datetime = datetime.strptime(data_as_str, '%Y-%m-%d')
    return str(data_as_datetime.year)


def convert_date_to_etender_format(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d-%m-%Y")
    return date_string


def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%Y-%m-%d %H:%M")
    return date_string


def convert_time_to_etender_format(isodate):
    iso_dt = parse_date(isodate)
    time_string = iso_dt.strftime("%H:%M")
    return time_string


def float_to_string_2f(value):
    return '{:.2f}'.format(value)


def float_to_string_3f(value):
    return '{:.3f}'.format(value)


def string_to_float(string):
    return float(string)


def change_data(initial_data):
    #TODO: remove redundant hardcoded values
    # initial_data['data']['procuringEntity']['identifier']['legalName'] = u"TenderOwner#"
    # initial_data['data']['procuringEntity']['identifier']['id'] =        u"88008800"
    # initial_data['data']['procuringEntity']['name'] = u"TenderOwner#"
    initial_data['data']['items'][0]['deliveryAddress']['locality'] = u"м. Київ"
    initial_data['data']['items'][0]['deliveryAddress']['region'] =  u"Київська область"
    initial_data['data']['procuringEntity']['address']['locality']       = u"Алупка"
    initial_data['data']['procuringEntity']['address']['postalCode']     = u"13531"
    initial_data['data']['procuringEntity']['address']['region']         = u"АР Крим"
    initial_data['data']['procuringEntity']['address']['streetAddress']  = u"Фрунзе, 666"
    initial_data['data']['procuringEntity']['contactPoint']['name']      = u"Владелец Этого Тендера"
    initial_data['data']['procuringEntity']['contactPoint']['telephone'] = u"613371488228"
    initial_data['data']['procuringEntity']['contactPoint']['url']       = u"http://e-tender.ua/"
    return initial_data


def change_data_for_tender_owner(initial_data):
    initial_data['data']['procuringEntity']['identifier']['legalName'] = u"TenderOwner#"
    initial_data['data']['procuringEntity']['identifier']['id'] =        u"88008800"
    initial_data['data']['procuringEntity']['name'] = u"TenderOwner#"
    return initial_data

def change_buyers_data(initial_data):
    initial_data['data']['buyers'][0]['name'] = u"TenderOwner#"
    initial_data['data']['buyers'][0]['identifier']['id'] = u"88008800"
    initial_data['data']['buyers'][0]['identifier']['legalName'] = u"TenderOwner#"

    initial_data['data']['procuringEntity']['name'] = initial_data['data']['buyers'][0]['name']
    initial_data['data']['procuringEntity']['identifier']['id'] = initial_data['data']['buyers'][0]['identifier']['id']
    initial_data['data']['procuringEntity']['identifier']['legalName'] = \
        initial_data['data']['buyers'][0]['identifier']['legalName']

    return initial_data


def convert_etender_date_to_iso_format_and_add_timezone(date):
    return TZ.localize(parse_etender_date(date)).isoformat()


def get_time_now():
    time_string = datetime.now().strftime("%H:%M")
    return time_string


def get_date_now():
    date_string = datetime.now().strftime("%d-%m-%Y")
    return date_string


def get_date_10d_future():
    date_string = (datetime.now() + timedelta(days=10)).strftime("%d-%m-%Y")
    return date_string


def get_time_offset(add_minutes=17):
    _now = datetime.now() + timedelta(minutes=add_minutes)
    return _now.time().strftime('%H:%M')


def add_minutes_to_etender_date(date_as_str, mins=1):
    """date_as_str like '16-09-2019, 17:09' """
    a = datetime.strptime(date_as_str, '%d-%m-%Y, %H:%M')
    b = a + timedelta(minutes=mins)
    return datetime.strftime(b, '%d-%m-%Y, %H:%M')


def convert_common_string_to_etender_string(string):
    dict = get_helper_dictionary()
    for key, val in dict.iteritems():
        if val == string:
            return key
    return string


def parse_currency_value_with_spaces(raw):
    # to convert raw values like '2 216 162,83 UAH' to string which is ready for conversion to float
    return ''.join(raw.split(' ')[:-1]).replace(',', '.')

def get_minimalStep_currency(raw_value):
    # to get currency 'UAH' from raw values like '2 216 162,83 UAH'
    result_dic = raw_value.split(' ')
    result = result_dic[-1]
    return result

def parse_currency_value_with_spaces_percentage(raw):
    # to convert raw values like '1,3244%' to string which is ready for conversion to float
    result = raw.replace('%', '')
    result = Decimal(result)
    result = (result / 100)
    result = float(result)
    return result


def parse_currency_value_with_spaces_percentage_NBU(raw):
    # to convert raw values like 'Hi – 1,3244%' to string which is ready for conversion to float
    result = raw.split(' ', 4)[4]
    result = result.replace('%', '')
    result = Decimal(result)
    result = (result / 100)
    result = float(result)
    return result



def convert_etender_string_to_common_string(string):
    return get_helper_dictionary().get(string, string)


def get_helper_dictionary():
    return {
        u"КЛАСИФІКАТОР ДК 021:2015 (CPV)": u"ДК021",
        u"кг.": u"кілограм",
        u"грн.": u"UAH",
        u"(з ПДВ)": True,
        u"з ПДВ": True,
        u"без ПДВ":       False,
        # TODO: remove this temporary workaround, consult with quinta team about input data
        u"Дніпро": u"Дніпропетровськ",
        #tender statuses
        u'період уточнень': u'active.enquiries',
        u'очікування пропозицій': u'active.tendering',
        u'прекваліфікація': u'active.pre-qualification',
        u'оцінка пропозицій': u'active.pre-qualification',
        u'блокування перед аукціоном': u'active.pre-qualification.stand-still',
        u'проведення переговорів': u'active.pre-qualification.stand-still',
        u'перший проміжний етап': u'active.stage2.pending',
        u'період аукціону': u'active.auction',
        u'кваліфікація переможця': u'active.qualification',
        u'пропозиції розглянуто': u'active.awarded',
        u'завершена закупівля': u'complete',
        u'перший етап завершено': u'complete',
        u'закупівля не відбулась': u'unsuccessful',
        u'відмінена закупівля': u'cancelled',
        #bid statuses
        u'Пропозиція не дійсна': u'invalid',
        u"ст.35 ч. 2 п. 1": u"artContestIP",
        u"ст.35 ч. 2 п. 2": u"noCompetition",
        u"ст.35 ч. 2 п. 4": u"twiceUnsuccessful",
        u"ст.35 ч. 2 п. 5": u"additionalPurchase",
        u"ст.35 ч. 2 п. 6": u"additionalConstruction",
        u"ст.35 ч. 2 п. 7": u"stateLegalServices",
        u"Договір поки що не опубліковано": u"pending",
        u"Договір опубліковано": u"active",
        u"Переможець торгів": u"active",
        u"учасник виграв закупівлю": u"active",
        u'вимога': u'claim',
        u'відповідь надана': u'answered',
        u'задоволено': u'resolved',
        u'не задоволено': u'declined',
        u'скасована скаржником': u'cancelled',
        u'відхилено': u'invalid',
        u'залишена без відповіді': u'ignored',
        u'очікується кваліфікація': u'pending',
        u'відкликається скаржником': u'stopping',
        u'очікує розгляду органом оскарження': u'pending',
        u'Співфінансування з бюджетних коштів': u'budget',
        u'на розгляді': u'pending',
        u'Пропозиція не активована': u'invalid'
    }

def get_feature_index(i):
    return {0.05: '1',
            0.01: '2',
            0: '3'}[i]

def get_doc_type_index(i):
    return {'financial_documents': '1',
            'qualification_documents': '2',
            'eligibility_documents': '3'}.get(i, i)

def convert_unit_name_to_unit_code(string):
    return {
        u"блок": u"D64",
        u"гектар": u"HAR",
        u"кілограми": u"KGM",
        u"кілометри": u"KMT",
        u"літр": u"LTR",
        u"лот": u"LO",
        u"метри квадратні": u"MTK",
        u"метри кубічні": u"MTQ",
        u"метри": u"MTR",
        u"місяць": u"MON",
        u"набір": u"SET",
        u"пара": u"PR",
        u"пачка": u"RM",
        u"пачок": u"NMP",
        u"послуга": u"E48",
        u"рейс": u"E54",
        u"тони": u"TNE",
        u"упаковка": u"PK",
        u"Флакон": u"VI",
        u"штуки": u"H87",
        u"ящик": u"BX",
    }.get(string, string)


def convert_milestone_from_text_to_code(string):
    return {
        u"Аванс": u"prepayment",
        u"Пiсляоплата": u"postpayment"
    }.get(string, string)


def convert_milestone_from_text_to_title(string):
    return {
        u"Виконання робіт": "executionOfWorks",
        u"Поставка товару": "deliveryOfGoods",
        u"Надання послуг": "submittingServices",
        u"Підписання договору": "signingTheContract",
        u"Дата подання заявки": "submissionDateOfApplications",
        u"Дата виставлення рахунку": "dateOfInvoicing",
        u"Дата закінчення звітного періоду": "endDateOfTheReportingPeriod",
        u"Інша подія": "anotherEvent",
    }.get(string, string)


def convert_milestone_from_text_to_day_type(string):
    return {
        u"Робочі": "working",
        u"Банківські": "banking",
        u"Календарні": "calendar"
    }.get(string, string)


def convert_main_procurement_category(string):
    return {
        u"Товари": "goods",
        u"Послуги": "services",
        u"Роботи": "works"
    }.get(string, string)


def get_modulus_from_number(number):
    if isinstance(number, int):
        pass
    elif isinstance(number, str):
        number = int(number)
    elif isinstance(number, unicode):
        number = int(number)
    return abs(number)


def get_breakdown_title_value(value):
    return {
        'state': u'Державний бюджет України',
        'crimea': u'Бюджет Автономної Республіки Крим',
        'local': u'Місцевий бюджет',
        'own': u'Власний бюджет(кошти від господарської діяльності підприємства)',
        'fund': u'Бюджет цільових фондів(що не входять до складу Державного або місцевого бюджетів)',
        'loan': u'Кредити та позики міжнародних валютно - кредитних організацій',
        'other': u'Інше'}[value]
