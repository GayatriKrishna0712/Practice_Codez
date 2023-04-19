Google
Hard
ID 9814



#Find the number of times the words 'bull' and 'bear' occur in the contents. We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
#Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

select 'bull' as word, count(*) nentry from google_file_store
where contents LIKE '%bull %'
union
select 'bear' as word, count(*) nentry from google_file_store
where contents LIKE '%bear %'
