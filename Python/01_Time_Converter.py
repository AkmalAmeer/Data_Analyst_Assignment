def convert_minutes(total_minutes):
    hrs = total_minutes // 60
    mins = total_minutes % 60

    if hrs > 0 and mins > 0:
        return f"{hrs} hrs {mins} minutes"
    elif hrs > 0:
        return f"{hrs} hrs"
    else:
        return f"{mins} minutes"


total_minutes = int(input("Enter minutes: "))
print(convert_minutes(total_minutes))
