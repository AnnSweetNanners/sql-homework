SELECT
cc.id_card_holder, ch.name,t.amount, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
ORDER BY amount DESC LIMIT 100;

SELECT
COUNT(m.name) as merchant_count, mc.name as merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE amount<=2
GROUP BY mc.name
ORDER BY merchant_count DESC

SELECT
ch.name, COUNT(ch.name) as incidence, EXTRACT(HOUR from t.date)
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE EXTRACT(HOUR from t.date)>6 AND EXTRACT(HOUR from t.date)<9
GROUP BY ch.name, EXTRACT(HOUR from t.date)
ORDER BY incidence DESC;


CREATE VIEW low_dollar_transaction_incidence AS
SELECT cc.id_card_holder, ch.name, t.amount, COUNT(t.date)as incidence
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE amount <=2
GROUP BY cc.id_card_holder, ch.name, t.amount
ORDER BY incidence DESC;


SELECT cc.id_card_holder, ch.name, t.amount, COUNT(t.date)as incidence
FROM credit_card as cc
INNER JOIN card_holder as ch ON cc.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE amount <=2
GROUP BY cc.id_card_holder, ch.name, t.amount
ORDER BY incidence DESC;

SELECT cc.id_card_holder, ch.name,t.amount, t.date, TO_CHAR(t.date, MONTH)) AS month
FROM credit_card as cc
INNER JOIN card_holder as ch ON ch.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE cc.id_card_holder=25;

ORDER BY month


SELECT * from merchant_category
SELECT * from transaction
SELECT * from merchant
select * from credit_card


SELECT ch.name, t.amount, EXTRACT(MONTH from t.date) as month
FROM credit_card as cc
INNER JOIN card_holder as ch ON ch.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
WHERE cc.id_card_holder=25
GROUP BY ch.name, t.amount, t.date;

SELECT cc.id_card_holder, ch.name,t.amount, EXTRACT(MONTH from t.date) as month, mc.name AS merchant_type
FROM credit_card as cc
INNER JOIN card_holder as ch ON ch.id_card_holder=ch.id_card_holder
INNER JOIN transaction as t ON t.card=cc.card
INNER JOIN merchant as m on m.m_id=t.id_merchant
INNER JOIN merchant_category as mc on mc.mc_id = m.id_merchant_category
WHERE cc.id_card_holder=25;
