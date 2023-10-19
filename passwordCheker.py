psswd = input()
psswd=list(psswd)
print(f'password:{psswd}')
if len(psswd)<4 or psswd[0].isdigit() or psswd[0]=='/' or ' ' in psswd :
    print('password is invalid')
else:
    cap=0
    small=0
    num=0
    special=0
    for i in psswd:
        if (ord(i)>=97 and ord(i)<=122):
            small+=1
        elif (ord(i)>=65 and ord(i)<=90):
            cap+=1
        elif i.isdigit():
            num+=1
        else:
            special+=1
    print(f'cap:{cap},small:{small},num:{num},special:{special}')
    if cap>0 and small>0 and num>0 and special>0:
        print('password is valid')

