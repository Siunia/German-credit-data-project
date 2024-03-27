-- Najliczniejsza grupa kredytobiorców --

 -- Najliczniejsza grupa kredytobiorców mieści się w widełkach wiekowych 22-37.
 
select age, count(*) as Licznik from credit_data
group by age
having licznik > 25;

-- Im starszy kredytobiorca, tym wyższy zaciągany przez niego kredyt. Średnia długość kredytowania wzrasta wraz ze średnią wartością kredytu.

select age as Wiek, round(AVG(credit_amount),2) as 'Średnia wartość kredytu', round(AVG(duration),2) 'Średnia długość kredytowania' from credit_data
group by Wiek
having wiek between 22 and 37
order by 'średnia wartość kredytu' desc, 'średnia długość kredytowania' desc;

-- Job (numeric: 0 - unskilled and non-resident, 1 - unskilled and resident, 2 - skilled, 3 - highly skilled)

select job as 'Kwalifikacje', round(AVG(credit_amount),2) as 'Średnia wartość kredytu', round(AVG(duration),2) 'Średnia długość kredytowania' from credit_data
group by job
order by job;

-- Pracownicy niewykwalifikowani zaciągają relatywnie podobne kwoty pożyczek na podobny okres kredytowania. Pracownicy wykwalifikowani zaś zaciągają dużo większe kredyty na dłuższy okres spłaty.

select sex as Płeć, round(avg(Credit_amount),2) as 'Średnia wielkość kredytu', purpose as Cel from credit_data
group by sex, purpose
order by round(avg(Credit_amount),2) desc;

-- Zarówno kobiety jak i mężczyżni zaciągają największe kwoty kredytu na wakacje i inne pochodne wypoczynku.
