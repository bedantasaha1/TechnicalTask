from datetime import datetime,timedelta
def NextLotteryDay(inputdate):
    day=inputdate.weekday()
    hour=inputdate.hour
    minute=inputdate.minute
    if (day>1)& (day<6)|((day==1)&(hour>21))|((day==1)&(hour==21)&(minute>=30))|((day==6)&(hour<21))|((day==6)&(hour==21)&(minute<30)):
        Nextday= (inputdate+timedelta(6-day)).date()
        Time="9:30"
 
    elif (day==0)|((day==1)&(hour<21))|((day==1)&(hour==21)&(minute<30)):
        Nextday= (inputdate+timedelta(1-day)).date()
        Time="9:30"
        
    elif ((day==6)&(hour>21))|((day==6)&(hour==21)&(minute>=30)):
        Nextday= (inputdate+timedelta(2)).date()
        Time="9:30"
    print("!!!!***!!!! The next Lottery Draw will be on " +str(Nextday)+ " at "+Time +" pm !!!!***!!!!")
if __name__ == '__main__':
    dateoption=str(input("Do you want the next default date?:\nType 'YES' for default, type 'NO' to insert another date manually: \n"))
    if dateoption.strip().lower()=="yes":
        inputdate=datetime.today()
        NextLotteryDay(inputdate)
    elif dateoption.strip().lower()=="no":
        try:
            y = int(input("Enter Year:" ))
            m = int(input("Enter Month:" ))
            d = int(input("Enter date(day of the month):" ))
            h = int(input("Enter hour in 0 to 23 format:" ))
            mi = int(input("Enter minute:" ))
            inputdate=datetime(y,m,d,h,mi)
            NextLotteryDay(inputdate)
        except Exception as e:
            print("SORRY!!!!")
            print(e)
    else:
        print("Please type YES or NO")