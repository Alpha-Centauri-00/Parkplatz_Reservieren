from winotify import Notification
from exchangelib import Credentials, Configuration, Account, DELEGATE, EWSDateTime
from datetime import datetime, timezone, timedelta
import os


def check_OrNo():
        
    try:
        credentials = Credentials(username=os.environ['USERNAME'], password=os.environ['PASSWORD'])
        config = Configuration(server=os.environ['EXSERVER'], credentials=credentials)

        account = Account(primary_smtp_address=os.environ['EMAILADDR'], config=config, autodiscover=True, access_type=DELEGATE)
        now = datetime.now(timezone.utc)

        start_date = datetime(now.year, now.month, 1, 0, 0, 0, tzinfo=timezone.utc)
        last_day = datetime(now.year, now.month + 1, 1, 0, 0, 0, tzinfo=timezone.utc) - timedelta(days=1)
        appointments = account.calendar.view(start=EWSDateTime.from_datetime(start_date), end=EWSDateTime.from_datetime(last_day))

        
        _meeting = "-OrNo"               # This name must be modified
        #_meeting = "Januar TechNo"      # This name must be modified
        matching_appointments = []

        for appointment in appointments:
            if _meeting in appointment.subject:
                matching_appointments.append((appointment.subject, appointment.start))


        if matching_appointments:
            
            for _, start_time in matching_appointments:
                #return "Mi " + start_time.date().strftime("%d.%m")+ "."
                return "Fr " + start_time.date().strftime("%d.%m")+ "."
                
                
        else:
            return f"No meeting for ({_meeting}) has been found!"

    except Exception as e:
        return f"{e} \n!!! Check OpenVPN Connection. !!!"


def show_notification(title: str, message: str, _icon: str):
    toast = Notification(app_id="imBook",
                        title=title,
                        msg=message,
                        icon=_icon)
    toast.show()


def get_absPath(ico_name:str):

    _dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(_dir,ico_name)
