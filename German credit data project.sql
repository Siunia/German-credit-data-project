create database portfolio_project_credit_data;
use portfolio_project_credit_data;

select * from credit_data;

#ogólna demografia kredytobiorców
select 'kobiety' as płeć, count(*) as liczebność from credit_data where sex like 'female'
union all
select 'mężczyżni' as płeć, count(*) as liczebność from credit_data where sex = 'male'; #liczba kredytobiorców z podziałem na płeć
select round(avg(age),2) as 'Średni wiek kredytobiorcy' from credit_data; #średni wiek kredytobiorcy

#Czy wiek kredytobiorcy ma wpływ na skuteczność spłacania kredytu?

select sex, risk, count(risk) as risk, concat(95/(95+215) * 100,'%') as bad_female_percentage, concat(205/(205+485) * 100,'%') as bad_male_percentage from credit_data
group by sex,risk
order by sex; # 0 = brak ryzyka; 1 = wysokie ryzyko #odsetek kredytobiorców ze złą zdolnością kredytową z podziałem na płeć

SELECT age, SUM(COUNT(age)) OVER (PARTITION BY age) AS suma_liczebności_grupy
FROM credit_data
GROUP BY age
ORDER BY age;

select age, count(risk_num) high_risk from credit_data 
group by age
order by age;


#Jak widać poniżej, wysokim ryzykiem kredytowym odznacza się grupa kredytobiorców zaliczających się do widełek wiekowych 24-40. 
#Najpewniejszą grupą kredytobiorców są osoby powyżej 50 roku życia.

#Czy istnieje zależność między długością kredytu a jego wielkością?


select (sum(duration)) / (sum(credit_amount)) as Korelacja from credit_data;

#Istnieje wysoka korelacja dodatnia wynosząca 64%. Na tej podstawie możemy wnioskować, że im większa kwota kredytu, tym dłuższy okres spłaty pożyczki.

#Jak wygląda średnia kwota kredytu ze względu na jego cel?

select round(avg(credit_amount),2) as średnia_wartość_kredytu, purpose as cel from credit_data
group by cel
order by średnia_wartość_kredytu desc;

#Kredytobiorcy najczęściej zaciągają pożyczki celem wakacji lub innych.

#Plus podział na mężczyzn i kobiety:

select sex as Płeć, round(avg(credit_amount),2) as średnia_wartość_kredytu, purpose as cel from credit_data
group by cel, sex
order by cel desc;