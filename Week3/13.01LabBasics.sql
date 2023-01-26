use bank;
#Get the id values of the first 5 clients from district_id with a value equals to 1.
select * from client where district_id = 1 limit 5;	
#In the client table, get an id value of the last client where the district_id equals to 72.
select* from client where district_id = 72
order by client_id desc
limit 1;
#Get the 3 lowest amounts in the loan table.
select amount from loan order by amount limit 3;
#4. What are the possible values for status, ordered alphabetically in ascending order in the loan table?
select distinct status from loan order by status;
#5. What is the loan_id of the highest payment received in the loan table?
select loan_id from loan order by payments desc limit 1;
#6. What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
select account_id, amount from loan order by account_id limit 5;
#7. What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select account_id from loan where duration = 60 order by amount limit 5;
#8. What are the unique values of k_symbol in the order table?
select distinct k_symbol from `order` where k_symbol<>"";
#9. In the order table, what are the order_ids of the client with the account_id 34?
select order_id from `order` where account_id = 34;
#10. In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select distinct account_id from `order` where order_id between 29540 and 29560;
#11. In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select amount from `order` where account_to = 30067122;
#12. In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
select trans_id, `date`, `type`, amount from trans where account_id = 793 order by `date` desc limit 10;
#13. In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
select district_id, count(client_id) from `client` where district_id < 10 group by district_id order by district_id;
#14. In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select `type`, count(card_id) from card group by `type`;
#Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select account_id, sum(amount) from loan group by account_id order by sum(amount) desc limit 10;
#In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
select* from loan;
select `date`, count(loan_id) from loan where `date` < 930907 group by `date` order by `date` desc;
#In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
select distinct duration, `date`, count(loan_id) from loan where `date` like '9712%' group by duration, `date` order by `date`, duration;
#18. In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
select account_id, `type`, sum(amount) as total_amount from trans where account_id = 396 group by `type`;
#19. From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer
select account_id, case when `type` = 'prijem' then 'INCOMING' WHEN `type` = 'vydaj' then 'OUTGOING' END as 'transaction_type', floor(sum(amount)) as total_amount from trans where account_id = 396 group by `type`;
#20. From the previous result, modify your query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference.
select account_id, floor(sum(case when `type`='PRIJEM' then `amount` end) as `incoming_amount` floor(sum(case when `type`='vydaj' then `amount` end) as `outgoing_amount` floor(sum(case when `type`='PRIJEM' then `amount` when `type`='vydaj' then -`amount`end) as total_amount from trans where account_id = 396;