PEW RESEARCH CENTER FOR THE PEOPLE & THE PRESS
OCTOBER POLITICAL
October 20-25, 2016
N=2,583

***************************************************************************************************************************

This dataset includes cell phone interviews conducted using an RDD sample of cell phone numbers. 
Cell phone interviews include households that are cell-only as well as those that also have a landline phone. 
The dataset contains several weight variables. 

WEIGHT is the weight for the combined sample of all landline and cell phone interviews. 
Data for all Pew Research Center reports are analyzed using this weight.

Two other weights can be used to compare the combined sample with the landline sample by itself 
and with the cell phone sample by itself.

LLWEIGHT is for analysis of the landline RDD sample only. Interviews conducted by cellphone are not 
given a weight and are excluded from analysis when this weight is used.

CELLWEIGHT is for analysis of the cell RDD sample only. Interviews conducted by landline are not
given a weight and are excluded from analysis when this weight is used.

***************************************************************************************************************************

Beginning in the Fall of 2008, the Pew Research Center started using respondents’ self-reported zip code as  
the basis for geographic variables such as region, state and county. We do this because the error rate in the original 
geographic information associated with the sample is quite high, especially for respondents from the cell phone sample. 

For respondents who do not provide a zip code or for those we cannot match, we use the sample geographic information. 
We continue to include the original sample geographic variables in the datasets (these variables are preceded by an ‘s’) 
for archival purposes only.

To protect the privacy of respondents, telephone numbers, county of residence and zip code have been removed from the data file.

***************************************************************************************************************************

Releases from this survey:
October 27, 2016 "As Election Nears, Voters Divided Over Democracy and ‘Respect’"
http://www.people-press.org/2016/10/27/as-election-nears-voters-divided-over-democracy-and-respect/


***************************************************************************************************************************
SYNTAX

***The following syntax is for constructed demographic variables***.

*The combined race variable (racecmb) was computed using the following syntax:
recode race_1 (1=1) (2=2) (3=3) (4 thru 7=5) (8 thru 9=9) into racecmb.
if race_2>0 and race_2 <8 racecmb=4.
variable label racecmb "Combining Race".
value label racecmb
1 "White"
2 "Black or African-American"
3 "Asian or Asian-American"
4 "Mixed Race"
5 "Or some other race"
9 "Don’t know/Refused (VOL.)".

*The race-ethnicity variable (racethn) was computed using the following syntax:
if racecmb=1 and hisp ge 2 racethn=1.
if racecmb=2 and hisp ge 2 racethn=2.
if (racecmb ge 3 and racecmb le 5) and (hisp ge 2) racethn=4.
if racecmb=9 racethn=9.
if hisp=1 racethn=3.
variable label racethn “Race-Ethnicity”.
value label racethn
1 “White non-Hispanic”
2 “Black non-Hispanic”
3 “Hispanic”
4 “Other”
9 “Don’t know/Refused (VOL.)”.




***Syntax for extra variables related to voting and voter registration***.
 
* STATEBAL (State ballot recoded based on responses) is computed as follows:
do if reg le 2.
Compute statebal=statereg.
end if.
do if reg>2.
Compute statebal=statenv.
end if.
if (statereg=99) or (statenv=99) statebal=sstate. 
Var lab statebal ‘State of registration/State live in’.

* SAMEDAY (states which allow “same day” registration) is computed as follows:
recode statebal (16=1) (19=1) (23=1) (27=1) (30=1) (33=1) (55=1) (56=1) (38=3) (else=2) into sameday.
val lab sameday 1 ‘Same day registration’ 2 ‘Pre-registration required’ 3 ‘North Dakota’.

* REGFINAL (whether R is registered to vote) variable is computed as follows:
compute regfinal=2.
if (reg=1) regfinal=1.
if (reg=2 and sameday=1) regfinal=1.
if (planreg=1) regfinal=1.
If (statebal=38) regfinal=1.
val lab regfinal 1 ‘Registered/Plan to/N.Dakota’ 2 ‘Not registered’.




*********************************************************************************.
***The data set includes additional variables for presidential vote preference***.

*Q10HORSE combines vote preference for REGISTERED VOTERS using the following syntax:
do if REGFINAL=1.
compute Q10HORSE=0.
if (q10=1 or q10a=1) Q10HORSE=1.
if (q10=2 or q10a=2) Q10HORSE=2.
if (q10=3 or q10a=3) Q10HORSE=3.
if (q10=4 or q10a=4) Q10HORSE=4.
if (q10=5 and q10a ge 5) Q10HORSE=5.
if (q10=9 and q10a=9) Q10HORSE=9.
end if.
exe.

var lab Q10HORSE ‘2016 preference with leaners’.
val lab Q10HORSE 1 ‘Clinton/lean Clinton’ 2 ‘Trump/lean Trump’ 3 ‘Johnson/lean Johnson’ 4 ‘Stein/lean Stein’ 5 ‘Other-refused to lean’ 9 ‘DK-refused to lean’.


*Q10HORSEGP combines vote preference for the GENERAL POPULATION using the following syntax:
compute Q10HORSEGP=0.
if (q10=1 or q10a=1 or q15=1 or q15a=1) Q10HORSEGP=1.
if (q10=2 or q10a=2 or q15=2 or q15a=2) Q10HORSEGP=2.
if (q10=3 or q10a=3) Q10HORSEGP=3.
if (q10=4 or q10a=4) Q10HORSEGP=4.
if (q10=5 and q10a ge 5 or (q15=3 and q15a=3)) Q10HORSEGP=5.
if (q10=9 and q10a=9 or (q15=9 and q15=9)) Q10HORSEGP=9.
end if.
exe.

var lab Q10HORSEGP ‘2016 preference with leaners’.
val lab Q10HORSEGP 1 ‘Clinton/lean Clinton’ 2 ‘Trump/lean Trump’ 3 ‘Johnson/lean Johnson’ 4 ‘Stein/lean Stein’ 5 ‘Other-refused to lean’ 9 ‘DK-refused to lean’.

*Q11HORSE2 combines the two-way vote preference (no third-party) for REGISTERED VOTERS using the following syntax:
do if REGFINAL=1.
compute Q11HORSE2=0.
if (q10=1 or q10a=1) or (Q11=1 or Q11a=1) Q11HORSE2=1.
if (q10=2 or q10a=2) or (Q11=2 or Q11a=2) Q11HORSE2=2.
if (q11=3 or q11a=3) Q11HORSE2=3.
if (q11=9 or q11a=4) Q11HORSE2=9.
end if.
exe.

var lab Q14HORSE2 ‘2016 2-way preference with leaners’.
val lab Q14HORSE2 1 ‘Clinton/lean Clinton’ 2 ‘Trump/lean Trump’ 3 ‘Other-refused to lean’ 9 ‘DK-refused to lean’.


***************************************************************************************************************************
