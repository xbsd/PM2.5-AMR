encode COUNTRY, gen(COUNTRY2)
xtset COUNTRY2 YEAR
tab YEAR, gen(YEAR2)
tab Region数字, gen(Region数字2)
tab Income数字, gen(Income数字2)
gen lnGDP=ln(GDP)
gen lnGDPpercapita=ln(GDPpercapita)
gen lnPopulation=ln(Population)
gen lnCurrenthealthexpenditureperc=ln(Currenthealthexpenditureperc)
ssc install winsor2
ssc install domin
ssc install moremata


reg MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Algeria",beta

reg MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita,beta
estat vif
est store MMAMR


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Algeria" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Argentina" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Australia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Austria" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bahrain" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Belarus" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Belgium" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bolivia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bosnia and Herzegovina" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Brazil" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bulgaria" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Canada" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Chile" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "China" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Cambodia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Colombia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Croatia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Cuba" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Cyprus" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Czech Republic" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Denmark" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Dominican Republic" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Ecuador" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Egypt" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "El Salvador" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Estonia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Finland" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "France" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Georgia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Germany" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Ghana" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Greece" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Guatemala" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Honduras" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Hungary" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Iceland" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "India" ,sets((i.YEAR) (i.Income数字))


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Ireland" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Italy" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Korea, Republic of" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Latvia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Lithuania" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Luxembourg" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Malawi" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Malaysia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Malta" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Mexico" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Montenegro" ,sets((i.YEAR) (i.Income数字))


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Netherlands" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "New Zealand" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Nicaragua" ,sets((i.YEAR) (i.Income数字))


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Norway" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Pakistan" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Panama" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Paraguay" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Peru" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Philippines" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Poland" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Portugal" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Romania" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Russia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Serbia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Slovakia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Slovenia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "South Africa" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Spain" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Sweden" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Switzerland" ,sets((i.YEAR) (i.Income数字))


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Thailand" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "The former Yugoslav Republic of Macedonia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Tunisia" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Turkey"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "United Kingdom" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "United States" ,sets((i.YEAR) (i.Income数字))

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Venezuela" ,sets((i.YEAR) (i.Income数字))


#######
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Algeria" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Argentina" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Australia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Austria" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bahrain" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Belarus" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Belgium" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bolivia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bosnia and Herzegovina" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Brazil" 
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Bulgaria" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Canada" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Chile" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "China" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Colombia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Croatia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Cuba" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Cyprus" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Czech Republic" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Denmark" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Dominican Republic" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Ecuador" 
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Egypt" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "El Salvador" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Estonia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Finland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "France" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Georgia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Germany" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Ghana" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Greece" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Guatemala" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Honduras"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Hungary" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Iceland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "India" 


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Ireland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Italy" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Korea, Republic of" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Latvia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Lithuania" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Luxembourg" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Malawi" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Malaysia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Malta" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Mexico" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Montenegro" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Netherlands" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "New Zealand" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Nicaragua" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Norway" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Pakistan" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Panama"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Paraguay" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Peru" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Philippines" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Poland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Portugal" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Romania" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Russia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Serbia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Slovakia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Slovenia"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "South Africa" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Spain" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Sweden" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Switzerland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Thailand" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "The former Yugoslav Republic of Macedonia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Tunisia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Turkey"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "United Kingdom" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "United States" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  COUNTRY== "Venezuela" 

#######GDPpercapita
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Algeria" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Argentina" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Australia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Austria" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Bahrain" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Belarus" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Belgium" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Bolivia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Bosnia and Herzegovina" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Brazil" 
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Bulgaria" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Canada" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Chile" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "China" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Colombia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Croatia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Cuba" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Cyprus" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Czech Republic" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Denmark" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Dominican Republic" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita  if  COUNTRY== "Ecuador" 
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Egypt" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "El Salvador" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Estonia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Finland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "France" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Georgia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Germany" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Ghana" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Greece" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Guatemala" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Honduras"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Hungary" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Iceland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "India" 


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Ireland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita  if  COUNTRY== "Italy" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Korea, Republic of" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Latvia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Lithuania" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Luxembourg" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Malawi" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Malaysia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Malta" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Mexico" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Montenegro" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Netherlands" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "New Zealand" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Nicaragua" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Norway" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Pakistan" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Panama"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Paraguay" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Peru" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Philippines" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Poland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Portugal" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Romania" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Russia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Serbia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Slovakia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Slovenia"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "South Africa" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Spain" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Sweden" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Switzerland" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Thailand" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "The former Yugoslav Republic of Macedonia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Tunisia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Turkey"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "United Kingdom" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "United States" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  COUNTRY== "Venezuela" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Southeast Asia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Australasia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "East Asia" 


domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "North Africa and Middle East" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "5North Africa and Middle East" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "4North Africa and Middle East" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "3North Africa and Middle East" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "2North Africa and Middle East" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "High-income Asia Pacific" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Eastern Sub-Saharan Africa" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "2Eastern Sub-Saharan Africa" 
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "1Eastern Sub-Saharan Africa"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "1Western Sub-Saharan Africa" 

reg MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Western Sub-Saharan Africa" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Andean Latin America"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "South Asia"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Southern Sub-Saharan Africa"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Eastern Europe"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Central Latin America"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc GDPpercapita if  Sregion== "Central Sub-Saharan Africa"

####
domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Southeast Asia" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "North Africa and Middle East" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "High-income Asia Pacific" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Eastern Sub-Saharan Africa" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Western Sub-Saharan Africa" 

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "South Asia"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Southern Sub-Saharan Africa"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Eastern Europe"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Central Latin America"

domin MMAMR PM25 Usage Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc  if  Sregion== "Central Sub-Saharan Africa"

stepwise,pe(.05): regress AR PM25 Usage BDWS GDPpercapita  Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc, b

####分细菌
winsor2 MMAcinetobacter_baumannii MMKlebsiella_pneumoniae MMPseudomonas_aeruginosa MMStaphylococcus_aureus MMStreptococcus_pneumoniae MMEscherichia_coli MMEnterococcus_faecalis MMEnterococcus_faecium PM25 Usage Governance BDWS GDPpercapita Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc, replace cuts(5 95) trim
winsor2 MMAcinetobacter_baumannii MMKlebsiella_pneumoniae MMPseudomonas_aeruginosa MMStaphylococcus_aureus MMStreptococcus_pneumoniae MMEscherichia_coli MMEnterococcus_faecalis MMEnterococcus_faecium PM25 Usage Governance BDWS GDPpercapita Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc, replace cuts(5 95)

domin MMAcinetobacter_baumannii PM25 Usage Governance BDWS GDPpercapita Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMKlebsiella_pneumoniae PM25 Usage Governance GDPpercapita BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMPseudomonas_aeruginosa PM25 Usage Governance GDPpercapita BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMStaphylococcus_aureus PM25 Usage Governance GDPpercapita BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMStreptococcus_pneumoniae PM25 Usage GDPpercapita Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMEscherichia_coli PM25 Usage Governance GDPpercapita BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMEnterococcus_faecalis PM25 Usage Governance GDPpercapita BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

domin MMEnterococcus_faecium PM25 Usage GDPpercapita  Governance BDWS Populationdensity Primarycompletionrate Tm Rainfall Currenthealthexpenditureperc ,sets((i.YEAR) (i.Income数字)) 

esttab Acinetobacter_baumannii Klebsiella_pneumoniae Pseudomonas_aeruginosa Staphylococcus_aureus Streptococcus_pneumoniae Escherichia_coli Enterococcus_faecalis Enterococcus_faecium  using e:/tableStrimless.rtf, replace

#残差出图
rvpplot PM25
rvpplot Ozone
rvpplot Usage
rvpplot SMSS
rvpplot GDP
rvpplot Population
rvpplot Primarycompletionrate
rvpplot Tm
rvpplot Rainfall 
rvpplot Currenthealthexpenditure
rvpplot BDWS
rvpplot GDPpercapita 
rvpplot Populationdensity 

#异方差
reg PercentResistant PM25 Ozone Usage SMSS GDP Population Primarycompletionrate Tm Rainfall Currenthealthexpenditure YEAR22 YEAR23 YEAR24 YEAR25 YEAR26 YEAR27 YEAR28 YEAR29 YEAR210 YEAR211 YEAR212 YEAR213 YEAR214 YEAR215 YEAR216 YEAR217 YEAR218 YEAR219 Region22 Region23 Region24 Region25 Region26 Income22 Income23 Income24

estat hettest,iid
estat imtest,white

