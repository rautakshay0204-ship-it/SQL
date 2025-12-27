Select * From constituencywise_details

Select * From constituencywise_results

Select * From partywise_results

Select * From states

Select * From statewise_results

Select Candidate,Total_Votes From constituencywise_details Where Total_Votes>1000000 Group by Candidate,Total_Votes

---- Total Seats
Select DISTINCT COUNT(Parliament_Constituency) As Total_Seats From constituencywise_results

---- What is the total number of seats available for elections in each state
Select s.state,COUNT(cr.Parliament_Constituency) As Total_Avaialable_seats From constituencywise_results cr 
Join statewise_results sr On Cr.Parliament_Constituency=sr.Parliament_Constituency
join states s on sr.state_id=s.state_id Group by s.state

---- Total Seats Won by NDA Allianz
Select SUM(Won) As NDA_Total_seats 
From partywise_results Where Party IN('Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM')


---- Seats Won by NDA Allianz Parties
SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
ORDER BY Seats_Won DESC

----Total Seats Won by I.N.D.I.A. Allianz
Select SUM(Won) As Total_India_Alianz From partywise_results Where Party In( 'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')

---- Seats Won by I.N.D.I.A. Allianz Parties
Select Party,Won From partywise_results Where Party In('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
Order by Won DESC

---- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50)

--I.N.D.I.A Allianz
Update partywise_results Set party_alliance='I.N.D.I.A' Where Party In('Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
)
--NDA Allianz
Update partywise_results set party_alliance='NDA' Where Party In(   'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
)
--OTHER
Update partywise_results set party_alliance = 'Other' Where Party Is Null

---- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
Select p.party_alliance,COUNT(cr.Constituency_ID) As Won_seats From constituencywise_results cr Join partywise_results p on p.Party_ID=cr.Party_ID 
Where p.party_alliance In('NDA','I.N.D.I.A','OTHER') Group by p.party_alliance Order by Won_seats DESC

---- Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
Select cr.Winning_Candidate,p.party,p.party_alliance,cr.Total_Votes,cr.Margin,cr.Constituency_Name,s.State From constituencywise_results cr
Join partywise_results p On p.Party_ID=cr.Party_ID
Join statewise_results sr On sr.Parliament_Constituency=cr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
Where s.state ='Uttar Pradesh' And cr.Constituency_Name='AMETHI'

---- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
Select cd.Candidate,cd.Postal_Votes,cd.EVM_Votes,cd.Party,cd.Total_Votes,cr.constituency_Name  From constituencywise_details cd
Join constituencywise_results cr on cr.Constituency_ID=cd.Constituency_ID where cr.Constituency_Name='Mathura' Order by cd.Total_Votes DESC

---- Which parties won the most seats in s State, and how many seats did each party win?
Select p.party,COUNT(Cr.Constituency_ID) As Won_seats From constituencywise_results cr Join partywise_results p On p.Party_ID=cr.Party_ID
Join statewise_results sr On cr.Parliament_Constituency=sr.Parliament_Constituency
Join states s On sr.State_ID=s.State_ID Where S.State='Andhra Pradesh' Group by p.party Order by Won_seats DESC 

---- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
Select s.state,SUM(CASE When p.party_alliance='NDA'Then 1 Else 0 End) As NDA_Seat_won,
SUM(CASE When p.party_alliance ='I.N.D.I.A' Then 1 Else 0 End) As INDIA_Seat_Won,
SUM(CASE When p.party_alliance = 'OTHER' Then 1 Else 0 End) As OTHER_Won 
From constituencywise_results Cr Join partywise_results p On cr.Party_ID=p.Party_ID
Join statewise_results sr on cr.Parliament_Constituency= sr.Parliament_Constituency
Join states s On sr.state_ID=s.state_ID Where p.party_alliance In('NDA','I.N.D.I.A','OTHER') Group by s.state Order by s.state

---- Which candidate received the highest number of EVM votes in each constituency (Top 10)?
Select Top 10 cr.Constituency_Name,cd.Constituency_ID,cd.Candidate,cd.EVM_Votes  From constituencywise_details cd 
Join constituencywise_results cr On cd.Constituency_ID=cr.Constituency_ID 
Where cd.EVM_Votes=(Select MAX(cd1.EVM_Votes) From constituencywise_details cd1 where cd1.Constituency_ID=cd.Constituency_ID) Order by cd.EVM_Votes DESC

---- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
WITH Rankedcandidates As(Select cd.Constituency_ID,cd.Candidate,cd.Party,cd.EVM_Votes,cd.Postal_Votes,cd.EVM_Votes+cd.Postal_Votes As Total_votes,
ROW_NUMBER() Over(Partition by cd.Constituency_ID Order by cd.EVM_Votes + cd.Postal_Votes DESC)As VoteRank From constituencywise_details cd 
Join Constituencywise_results cr On cd.Constituency_ID=cr.Constituency_ID 
Join statewise_results sr on sr.Parliament_Constituency=cr.Parliament_Constituency
Join states s on sr.State_ID=s.State_ID Where s.State='Maharashtra') 
Select cr.Constituency_Name,MAX (CASE When rc.VoteRank= 1 Then rc.Candidate End) As Wining_Candidate,
MAX (CASE When rc.VoteRank=2 Then rc.Candidate End) As Runnerup_Candidate From Rankedcandidates rc
Join Constituencywise_results cr On rc.Constituency_ID=cr.Constituency_ID Group by cr.Constituency_Name Order by cr.Constituency_Name

---For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes 
--(including EVM and postal), and the breakdown of EVM and postal votes?

Select COUNT(DISTINCT cr.Constituency_ID ) As Total_Seats,
COUNT(DISTINCT cd.Candidate ) As Total_Candidates,
COUNT(DISTINCT p.party ) As Total_Parties ,
SUM(cd.EVM_Votes + cd.Postal_Votes) As Total_Votes,
SUM(cd.EVM_Votes) As Evm_Votes,
SUM(cd.Postal_Votes) As Postal_Votes From constituencywise_results cr 
Join constituencywise_details cd On cr.Constituency_ID=cd.Constituency_ID
Join statewise_results sr On cr.Parliament_Constituency=sr.Parliament_Constituency
Join states s On s.State_ID=sr.State_ID
Join partywise_results p On p.Party_ID=cr.Party_ID Where s.State='Maharashtra'