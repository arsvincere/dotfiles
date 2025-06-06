from datetime import date, datetime

# years left
age = 60
end = datetime(1988 + age, 7, 11)
y = (end - datetime.now()).days // 365

# time left in this year
now_year = date.today().year
end_year = datetime(now_year + 1, 1, 1)
time_left = end_year - datetime.now()

# format
d = time_left.days
h, remainder = divmod(time_left.seconds, 3600)
m, s = divmod(remainder, 60)
out = f"󰔟 {y} {d}  󰄉 {h:02}:{m:02}:{s:02}"

print(out, flush=True)
