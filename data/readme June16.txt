PEW RESEARCH CENTER FOR THE PEOPLE & THE PRESS
JUNE VOTER ATTITUDES-WITH HISPANIC OVERSAMPLE
June 15-26, 2016
N=2,245   HISPANIC OVERSAMPLE N=245

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

This dataset includes an oversample of 245 Hispanics (using a screening RDD landline and cell sample to oversample)  
in addition to a regular RDD sample. The weight variables adjust for this and weight these cases into their  
proper proportion in the general public.


For complete details on the sample segments and weighting see the Methodology document (June16 Methodology.pdf)

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

July 7, 2016 "2016 Campaign: Strong Interest, Widespread Dissatisfaction"
http://www.people-press.org/2016/07/07/2016-campaign-strong-interest-widespread-dissatisfaction/

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




**** Two-way presidential vote choice for “Registered Voters” (REG=1) ****.
do if REG=1.
compute Q9HORSE3=0.
if (q9=1 or q9a=1) Q9HORSE3=1.
if (q9=2 or q9a=2) Q9HORSE3=2.
if (q9=3 or q9a=3) Q9HORSE3=3.
if (q9 ge 4 and q9a=4) or (q9=4 and q9a=9) Q9HORSE3=4.
if (q9=9 and q9a=9) Q9HORSE3=9.
end if.
exe.

var lab Q9HORSE3 ‘3-way 2016 preference with leaners’.
val lab Q9HORSE3 1 ‘Clinton/lean Clinton’ 2 ‘Trump/lean Trump’ 3 ’Johnson/lean Johnson’ 
4‘Other-refused to lean’ 9 ‘DK-refused to lean’.

**** Presidential vote choice for “Registered Voters” (REG=1) ****.
do if REG=1.
compute Q10HORSE=0.
if (q10=1 or q10a=1) Q10HORSE=1.
if (q10=2 or q10a=2) Q10HORSE=2.
if ((q10=3 and q10a ge 3) or q10a=3) Q10HORSE=3.
if (q10=9 and q10a=9) q10HORSE=9.
end if.
exe.

var lab Q10HORSE ‘2016 preference with leaners’.
val lab Q10HORSE 1 ‘Clinton/lean Clinton’ 2 ‘Trump/lean Trump’ 3 ‘Other-refused to lean’
9 ‘DK-refused to lean’.
