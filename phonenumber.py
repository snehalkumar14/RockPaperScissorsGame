import phonenumbers
from phonenumbers import timezone
from phonenumbers import geocoder,carrier

#.....It gives the phone number
ph=input('enter phonenumber with country code::')
Phonenumber=phonenumbers.parse(ph)
print(Phonenumber)

#......It gives the  timeZone of the  phone number
tz=timezone.time_zones_for_number(Phonenumber)
print(tz)


#........It gives the carrier name i.e which company is the phonenumber registered
c=carrier.name_for_number(Phonenumber,'en')

#.........These gives the location
r=geocoder.country_name_for_number(Phonenumber,'en')
r2=geocoder.description_for_number(Phonenumber,'en')

#........It gives the phonenumber is  valid or not
valid=phonenumbers.is_valid_number(Phonenumber)

#........It gives the phone number is possible or not
Possible=phonenumbers.is_possible_number(Phonenumber)

print(c)
print(r)
print(r2)
print(valid)
print(Possible)