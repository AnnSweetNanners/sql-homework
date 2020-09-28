
--100 Highest Transactions
SELECT
cc.id_card_holder,ch.name,t.amount, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
ORDER BY amount DESC LIMIT 100;

--Count Transactions from 7AM-9AM
SELECT
cc.id_card_holder,ch.name,t.amount, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
ORDER BY amount DESC LIMIT 100;

--Count Transactions from 7AM-9AM Order by Incidence
SELECT
cc.id_card_holder, ch.name, COUNT(ch.name) as incidence, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
GROUP BY cc.id_card_holder, ch.name, EXTRACT(HOUR from t.date)
ORDER BY incidence DESC;

--Count Top 5 Merchant Types by Incident
SELECT
COUNT(m.name) as merchant_count, mc.name as merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE amount<2
GROUP BY mc.name
ORDER BY merchant_count DESC

--Count Top 5 Merchants by Incident
SELECT
COUNT(m.name) as merchant_count, m.name
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE amount<2
GROUP BY m.name
ORDER BY merchant_count DESC

--Count Transactions Less than 2 Dollars with Incidence
SELECT cc.id_card_holder, ch.name, t.amount, COUNT(t.date)as incidence
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE amount <2
GROUP BY cc.id_card_holder, ch.name, t.amount
ORDER BY incidence DESC;

--Transactions for Cardholder 2
SELECT
cc.id_card_holder,t.amount, t.date
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE cc.id_card_holder=2

--Transactions Cardholder 18
SELECT
cc.id_card_holder,t.amount, t.date
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE cc.id_card_holder=18

--Combined Cardholder 2 and 18
SELECT
cc.id_card_holder,t.amount, t.date
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE cc.id_card_holder=2 
OR cc.id_card_holder=18

--Daily Transactions Cardholder 25
SELECT cc.id_card_holder, ch.name,t.amount, EXTRACT(MONTH from t.date) as month, mc.name AS merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON ch.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE cc.id_card_holder=25;

--Cardholder 25 transactions for January
SELECT cc.id_card_holder, ch.name,t.amount, EXTRACT(MONTH from t.date) as month, mc.name AS merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON ch.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE cc.id_card_holder=25 AND EXTRACT(MONTH from t.date)=1.0;

--Find Restaraunt Transactions for Cardholder 25
SELECT ch.name, t.amount, EXTRACT(MONTH from t.date) as month, mc.name as merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE ch.id_card_holder=25 AND mc.name='restaurant'
ORDER BY mc.name

--Create View of Top 100 Transactions
CREATE VIEW hundred_highest_transactions AS
SELECT cc.id_card_holder,ch.name,t.amount, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
ORDER BY amount DESC LIMIT 100;

--Create View searching Transactions from 7 AM to 9 AM
CREATE VIEW transactions_7_to_9 AS
SELECT
cc.id_card_holder,ch.name,t.amount, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
ORDER BY amount DESC LIMIT 100

--Create View searching Transactions 7AM to 9AM with incident count
CREATE VIEW transactions_7_to_9_incidence AS
SELECT
cc.id_card_holder, ch.name, COUNT(ch.name) as incidence, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
GROUP BY cc.id_card_holder, ch.name, EXTRACT(HOUR from t.date)
ORDER BY incidence DESC;

--Create View searching Top 5 Merchant Types by Incidence
CREATE VIEW top_5_merchants_incidence AS
SELECT
COUNT(m.name) as merchant_count, mc.name as merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE amount<2
GROUP BY mc.name
ORDER BY merchant_count DESC;

--Create View searching Top 5 Merchants by Name
CREATE VIEW top_5_merchants_by_name AS
SELECT COUNT(m.name) as merchant_count, m.name
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE amount<2
GROUP BY m.name
ORDER BY merchant_count DESC

--Create View searching transactions Under 2 Dollars
CREATE VIEW under_two_dollars AS
SELECT cc.id_card_holder, ch.name, t.amount, COUNT(t.date)as incidence
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE amount <2
GROUP BY cc.id_card_holder, ch.name, t.amount
ORDER BY incidence DESC;