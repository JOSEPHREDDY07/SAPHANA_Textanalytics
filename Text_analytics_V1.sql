CREATE COLUMN TABLE "SCHEMA"."PROD_REVIEWS"
( ID INTEGER PRIMARY KEY,
  PRODUCT NVARCHAR(200),
  REVIEW NVARCHAR(5000) );

INSERT INTO "SCHEMA"."PROD_REVIEWS" VALUES (51, 'Similac Pro-Advance',
'The product has grey impurity stuff after adding water. Really concern about 
the quality. I have to buy them from retail stores (COSTCO/TARGET) etc. 
Their same product do not have this issue. Although it is on sale sometime, 
I would rather pay more to buy from retail stores as this is daily baby food!');

INSERT INTO "SCHEMA"."PROD_REVIEWS" VALUES (52, 'Pampers Swaddlers',
'These are knock off diapers. They look the same 
but they feel rough/like plastic. I was having to put diaper cream on my baby to alleviate the 
irritation only to discover it was the diaper itself. 
It’s also shorter than the normal pampers and the art is similar but not the same. Buyer beware!');

INSERT INTO "SCHEMA"."PROD_REVIEWS" VALUES (53, 'Gerber Extensive HA Powder',
'We were originally feeding Similac Alimentum but after a few weeks 
we began to notice a sharp increase in stomach discomfort and reflux. 
As a result we made the decision to switch to Gerber Extensive HA and 
have had great success with it for several weeks now. After switching to 
Gerber we noticed an almost immediate reduction in reflux and stomach discomfort and 
now have a very happy baby. This formula is working very well for our baby and if you 
are having issues with the other hypoallergenic options this is probably worth a shot.');

INSERT INTO "SCHEMA"."PROD_REVIEWS" VALUES (54, 'Enfamil Nutramigen Infant Formula',
'I recived the bottles and they where all spoiled and separated liquids!
 Very very disappointed that was $65.00 wasted!!');

select * from "SCHEMA"."PROD_REVIEWS";

CREATE FULLTEXT INDEX EXT_CORE_VOC_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'EXTRACTION_CORE_VOICEOFCUSTOMER'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_EXT_CORE_VOC_INDEX";
--to drop the index
DROP FULLTEXT INDEX EXT_CORE_VOC_INDEX;

--you can try other configuration using below sql

CREATE FULLTEXT INDEX LING_BASIC_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'LINGANALYSIS_BASIC'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_LING_BASIC_INDEX";

DROP FULLTEXT INDEX LING_BASIC_INDEX;
    	
CREATE FULLTEXT INDEX LING_STEMS_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'LINGANALYSIS_STEMS'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_LING_STEMS_INDEX";

DROP FULLTEXT INDEX LING_STEMS_INDEX;

CREATE FULLTEXT INDEX LING_FULL_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'LINGANALYSIS_FULL'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_LING_FULL_INDEX";

DROP FULLTEXT INDEX LING_FULL_INDEX;

CREATE FULLTEXT INDEX EXT_CORE_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'EXTRACTION_CORE'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_EXT_CORE_INDEX";

DROP FULLTEXT INDEX EXT_CORE_INDEX;


CREATE FULLTEXT INDEX EXT_CORE_PUBLIC_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'EXTRACTION_CORE_PUBLIC_SECTOR'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_EXT_CORE_PUBLIC_INDEX";

DROP FULLTEXT INDEX EXT_CORE_PUBLIC_INDEX;

CREATE FULLTEXT INDEX EXT_CORE_ENTERPRISE_INDEX ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'EXTRACTION_CORE_ENTERPRISE'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_EXT_CORE_ENTERPRISE_INDEX";

DROP FULLTEXT INDEX EXT_CORE_ENTERPRISE_INDEX;

CREATE FULLTEXT INDEX "SCHEMA"."GRAMMATICAL_ROLE_INDEX" ON "SCHEMA"."PROD_REVIEWS" ("REVIEW")
CONFIGURATION 'GRAMMATICAL_ROLE_ANALYSIS'
TEXT ANALYSIS ON;

SELECT * FROM "SCHEMA"."$TA_GRAMMATICAL_ROLE_INDEX" order by ID;

DROP FULLTEXT INDEX GRAMMATICAL_ROLE_INDEX;