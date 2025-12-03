s = input("Enter a string: ")

seen = set()      
unique_string = ""

for ch in s:
    if ch not in seen:
        seen.add(ch)
        unique_string+=ch

print("Unique string:", unique_string)
