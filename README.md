# SAPHANA_Textanalytics
Text Analytics using SAP HANA
Sentiment analysis of Product reviews/survey data:
Customer centric company tries to understand what customer need and deliver that. Customer experience is the key to business success. Customer centricity is a new way of doing business that give positive customer experience. But what customers saying about your brand? Businesses are using tools or web scraping techniques to collect the product reviews, customer feedback data or social media data. Web scarping is a method of gathering data available on websites. Once you have the product reviews, customer feedback data or survey results data, sentiment analysis helps to find the insights on the data. The text analytics tools can provide insights analyzing the text data and separates the text data into tags like positive, negative, and strong positive. You can
Understand what your customers like and dislike about your product.
Compare your product reviews with those of your competitors.
Get the latest product insights daily with the end to end automation.
 In this blog will show how to perform text sentiment analysis based on product reviews using HANA data base text analytics capability. I will also highlight how we can use HANA data base SQL and HANA Information views to perform Text analysis and visually represent the results using word cloud.
You need to load the Reviews data in HANA Table. You can automate the data loading process to the table from the sources like twitter, face book, web scrapping data using the ETL Tools or using python scripts.
Language modules use the following language processing technologies:
•	Linguistic analysis to handle natural language processing
•	Entity extraction to handle named entity extraction
•	Fact extraction to handle sentiment analysis, public sector events, and enterprise facts
•	Grammatical role analysis to handle functional syntactic roles in the sentence, such as subject or object. This is applied only to English
Below are types of Text Analysis Configuration Available in SAP HANA:
Linguistic Analysis
•	Basic(LINGANALYSIS_BASIC)
•	Stems(LINGANALYSIS_STEMS)
•	Full(LINGANALYSIS_FULL)
Entity and Fact Extraction
•	Core(EXTRACTION_CORE)
•	Core Voice Of Customer(EXTRACTION_CORE_VOICEOFCUSTOMER)
•	Core Enterprise(EXTRACTION_CORE_ENTERPRISE)
•	Core Public Sector(EXTRACTION_CORE_PUBLIC_SECTOR)
Grammatical Role Analysis
•	Grammar Role Identification(GRAMMATICAL_ROLE_ANALYSIS)

SAP HANA is shipped with several predefined, standard text analysis configurations. Such configurations are  available in “sap.hana.ta.config” repository package as shown in Figure

 
Entity and Fact Extraction is Core Voice of Customer
This configuration helps to extract additional entities and facts beyond the core configuration to support sentiment and request analysis. Also known as Sentiment Analysis which is the process of using rules to retrieve specific information about customers’ sentiments and requests when processing and analyzing text. These same rules also retrieve emoticons and profanities.
Steps for analysis
1.	Create the table to store all the product wise reviews in SAP HANA
2.	Populate/load the table using ETL tools/Python script/ Insert statement form the sources like flat file, web scrapped output file.
3.	Create full text index with the required configurations, for sentiment analysis use 'EXTRACTION_CORE_VOICEOFCUSTOMER' configuration.
With the creation of above index system creates table ($TA_<indexname> ) with the extracted sentiment analysis data.
4.	Select the data form the extracted sentiment analysis table data ($TA_<indexname> ) to see the results.
5.	Use the above table to create visulaizions (word cloud, bar chart of sentiment count)

1. Create the table to store all the product wise reviews in SAP HANA
CREATE COLUMN TABLE "SCHEMA"."PROD_REVIEWS"
( ID INTEGER PRIMARY KEY,
  PRODUCT NVARCHAR(200),
  REVIEW NVARCHAR(5000) );

2. Inserting sample data into Table

INSERT INTO "SCHEMA"."PROD_REVIEWS" VALUES (51, 'Similac Pro-Advance',
'The product has grey impurity stuff after adding water. Really concern about 
the quality. I have to buy them from retail stores (COSTCO/TARGET) etc. 
Their same product do not have this issue. Although it is on sale sometime, 
I would rather pay more to buy from retail stores as this is daily baby food!');

INSERT INTO "SCHEMA"."PROD_REVIEWS" VALUES (54, 'Enfamil Nutramigen Infant Formula',
'I recived the bottles and they where all spoiled and separated liquids!
 Very very disappointed that was $65.00 wasted!!');

I inserted few more lines like above.

Table data:

select * from "SCHEMA"."PROD_REVIEWS"

 

3.Creation of full text index with the required configurations, for sentiment analysis use 'EXTRACTION_CORE_VOICEOFCUSTOMER' configuration.

CREATE FULLTEXT INDEX EXT_CORE_VOC_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'EXTRACTION_CORE_VOICEOFCUSTOMER'
TEXT ANALYSIS ON;
4. Select the data form the extracted sentiment analysis table data ($TA_<indexname> ) to see the results.
SELECT * FROM "SCHEMA"."$TA_EXT_CORE_VOC_INDEX";
 
5.Use the above table to create visulaizions through HANA Model (word cloud, bar chart of sentiment count)

Word cloud of sentiment analysis results
 
 

To summarize, text analysis is the process of analyzing unstructured data, extracting relevant information and then transforming that information into structured information that can be leveraged in different ways using different configurations.
You can create custom dictionaries in SAP HANA.  To implement certain custom use cases, customers have to implement their own dictionaries for performing Text Analysis.
Use Case: A company has their own number of products in product portfolio which are not covered completely by standard configuration. In such case, they can create a custom dictionary with an entity category Product and add all the products names in the portfolio.
Sample HANA SQL  codes are attached.




