-- 1 Select the offer id, action, and date provided by a particular branch name
SELECT o.OFFER_ID, o.ACTION, o.O_DATE, b.BRANCH_NAME
FROM OFFERS o, OFFERS_BRANCHES ob, BRANCHES b
WHERE b.BRANCH_NAME = 'Mountain View';
-- 2 Display all the transaction references, transaction amounts, the number of points collected from 
--    each transaction, and the transaction date for a particular customer name
SELECT TREF, AMOUNT, T_POINTS, T_DATE
FROM CUSTOMERS, TRANSACTIONS
WHERE CNAME = 'Megan';
-- 3 Find the branch IDs and the number of offers provided by each branch id
SELECT BRANCH_ID, count(*)
FROM OFFERS_BRANCHES
GROUP BY BRANCH_ID;
-- 4 Find the branch names and the number of offers provided by each branch name
SELECT b.BRANCH_NAME, COUNT(ob.OFFER_ID) as count
FROM OFFERS_BRANCHES ob, BRANCHES b
WHERE ob.BRANCH_ID = b.BRANCH_ID
GROUP BY b.BRANCH_NAME;
-- 5 Display for a particular transaction reference, the transaction reference, date, time, amount, 
--    the number of points collected, and the product ids and names included in the transaction with 
--    their quantities, prices, and number of points
SELECT t.TREF, t.T_DATE, t.T_TIME, t.AMOUNT, t.T_POINTS, p.PROD_ID, p.PROD_NAME, tp.QUANTITY, p.PRICE, p.PROD_POINTS
FROM TRANSACTIONS t, TRANSACTIONS_PRODUCTS tp, PRODUCTS p
WHERE t.TREF = tp.TREF AND tp.PROD_ID = p.PROD_ID and t.TREF = '1';
-- 6 Find the number of expired cards available in the database
SELECT COUNT(CID)
FROM CARDS
WHERE STATUS = 'E';
-- 7 Find the customer with the maximum number of expired cards
select * from 
(SELECT COUNT(CARD_ID) EXP_CARD_COUNT, CID
FROM CARDS
WHERE STATUS = 'E'
GROUP BY CID) order by exp_card_count desc 
fetch first 1 rows only;
-- 8 Find the redemption history of a particular customer name. You should display the prize ID, 
--    prize description, customer name,center id, and number of points redeemed
SELECT p.PRIZE_ID, p.P_DESCRIPTION, c.CNAME, rh.CENTER_ID, rh.QUANTITY*p.POINTS_NEEDED Points_Redeemed
FROM PRIZES p, REDEMPTION_HISTORY rh, POINT_ACCOUNTS pa, CUSTOMERS c
WHERE c.CNAME = 'Jill' AND c.CID = pa.CID AND rh.PRIZE_ID = p.PRIZE_ID;
-- 9 Display the name and occupation of the members of a particular family name
SELECT CNAME, OCCUPATION
FROM CUSTOMERS
WHERE FAMILY_ID = '1';
-- 10 Display the sum of points of the members of a particular family ID
SELECT SUM(NUM_OF_POINTS)
FROM POINT_ACCOUNTS
WHERE FAMILY_ID = '11';
-- 11 Display the customer name with the maximum number of collected points
SELECT CNAME
FROM CUSTOMERS
WHERE CID = (SELECT CID
             FROM POINT_ACCOUNTS
             WHERE NUM_OF_POINTS = (SELECT MAX(NUM_OF_POINTS)
                                    FROM POINT_ACCOUNTS)
            );
-- 12 Find the total number of points redeemed on a particular date
SELECT SUM(rh.QUANTITY * p.POINTS_NEEDED) Points_On_Dec_21_1985
FROM REDEMPTION_HISTORY rh, PRIZES p
WHERE rh.PRIZE_ID = p.PRIZE_ID AND rh.R_DATE = '21-DEC-85';
-- 13 Find the number of prizes redeemed by a particular customer id
SELECT COUNT(*)
FROM REDEMPTION_HISTORY
WHERE CID = '30';
-- 14 Find the number of customers who redeemed prizes from a particular center id
SELECT COUNT(*)
FROM REDEMPTION_HISTORY
WHERE CENTER_ID = '5';
-- 15 Find the total number of prizes in the database
SELECT COUNT(*)
FROM PRIZES;
-- 16 Display a list of customer names living in Fairfax and whose occupation is Engineer
SELECT c.CNAME
FROM CUSTOMERS c, ADDRESSES a
WHERE  c.CID = a.CID AND a.CITY = 'Fairfax' AND c.OCCUPATION = 'Engineer';
-- 17 Find the list of products not included in any tansaction
SELECT PROD_ID
FROM PRODUCTS
WHERE PROD_ID NOT IN (SELECT DISTINCT PROD_ID
                      FROM TRANSACTIONS_PRODUCTS
                      );
-- 18 Find the product bought the most by customers
SELECT PROD_ID
FROM (SELECT PROD_ID, SUM(QUANTITY)QUANTITY
     FROM TRANSACTIONS_PRODUCTS
     GROUP BY PROD_ID)
WHERE QUANTITY = (SELECT MAX(QUANTITY)
                  FROM(SELECT PROD_ID, SUM(QUANTITY)QUANTITY
                  FROM TRANSACTIONS_PRODUCTS
                  GROUP BY PROD_ID
                 )
     );
