
# Get card_id and year_issued for all gold cards.

select * from bank.card;
select card_id, year(convert(substring(issued, 1, 6), date)) as year_issued from bank.card where type = 'gold';


# When was the first gold card issued? (Year)

select card_id, min(year(convert(substring(issued, 1, 6), date))) as year_issued from bank.card where type = 'gold';

# Get issue date as:
        # date_issued: 'November 7th, 1993'
 
select date_format(convert(substring(issued, 1, 6), date),'%M-%D-%Y') from bank.card;

        # fecha_emision: '07 of November of 1993'
        
select date_format(convert(substring(issued, 1, 6), date),'%d of %M of %Y') from bank.card;

# Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.



# Check for transactions with null or empty values for the column amount.

select * from bank.trans where (amount = ' ');

# Count how many transactions have empty and non-empty k_symbol (in one query).

select count(trans_id) from bank.trans where (k_symbol != ' ') or (k_symbol =' ');


