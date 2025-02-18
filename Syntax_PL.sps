* Encoding: UTF-8.
*EQ1 -  How do learning outcomes vary across different secure coding domains (SQL, XSS, Cryptography)?
* Compute descriptive statistics for Learning Outcomes

DESCRIPTIVES VARIABLES=SQL_Diff_Sum XSS_Diff_Sum Crypto_Diff_Sum
  /STATISTICS=MEAN STDDEV MIN MAX SKEWNESS KURTOSIS.

*EQ2 - What insights do RIMMS descriptive statistics provide about the participants’ learning experience?
 * Compute descriptive statistics for RIMMS variables.

DESCRIPTIVES VARIABLES=Attention_Mean Relevance_Mean Confidence_Mean Satisfaction_Mean
  /STATISTICS=MIN MAX MEAN STDDEV.


*EQ3 -  How does challenge performance relate to participants’ knowledge improvements? 
* Compute Pearson correlations for all relevant variables

CORRELATIONS 
  /VARIABLES=Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints SQL_Diff_Sum XSS_Diff_Sum Crypto_Diff_Sum
  /MATRIX=OUT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

*Regressions
* Perform multiple linear regression with SQL_Diff_Sum as the dependent variable.
REGRESSION
  /DEPENDENT SQL_Diff_Sum
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with XSS_Diff_Sum as the dependent variable.
REGRESSION
  /DEPENDENT XSS_Diff_Sum
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with Crypto_Diff_Sum as the dependent variable.
REGRESSION
  /DEPENDENT Crypto_Diff_Sum
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.


 *EQ4 -  How does challenge performance influence perceived learning experience (RIMMS)?
 * Compute Pearson correlations including Learning Experience variables.

CORRELATIONS 
  /VARIABLES=Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints Attention_Mean Relevance_Mean Confidence_Mean Satisfaction_Mean
  /PRINT=TWOTAIL SIG
  /MISSING=PAIRWISE.

*Regressions
* Perform multiple linear regression with Attention_Mean as the dependent variable.
REGRESSION
  /DEPENDENT Attention_Mean
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with Relevance_Mean as the dependent variable.
REGRESSION
  /DEPENDENT Relevance_Mean
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with Confidence_Mean as the dependent variable.
REGRESSION
  /DEPENDENT Confidence_Mean
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with Satisfaction_Mean as the dependent variable.
REGRESSION
  /DEPENDENT Satisfaction_Mean
  /METHOD=ENTER Graduation Crypto WebLvl1 WebLvl2 SQL General XSS Hints
  /STATISTICS COEFF OUTS R ANOVA.

*EQ5 - To what extent does perceived learning experience (RIMMS) explain improvements in secure coding knowledge?
 * Compute Pearson correlations for EQ5 variables.

CORRELATIONS 
  /VARIABLES=Attention_Mean Relevance_Mean Confidence_Mean Satisfaction_Mean SQL_Diff_Sum XSS_Diff_Sum Crypto_Diff_Sum
  /PRINT=TWOTAIL SIG
  /MISSING=PAIRWISE.

*Regressions
 * Perform multiple linear regression with SQL_Diff_Sum as the dependent variable.
REGRESSION
  /DEPENDENT SQL_Diff_Sum
  /METHOD=ENTER Attention_Mean Relevance_Mean Confidence_Mean Satisfaction_Mean
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with XSS_Diff_Sum as the dependent variable.
REGRESSION
  /DEPENDENT XSS_Diff_Sum
  /METHOD=ENTER Attention_Mean Relevance_Mean Confidence_Mean Satisfaction_Mean
  /STATISTICS COEFF OUTS R ANOVA.

* Perform multiple linear regression with Crypto_Diff_Sum as the dependent variable.
REGRESSION
  /DEPENDENT Crypto_Diff_Sum
  /METHOD=ENTER Attention_Mean Relevance_Mean Confidence_Mean Satisfaction_Mean
  /STATISTICS COEFF OUTS R ANOVA.
    






