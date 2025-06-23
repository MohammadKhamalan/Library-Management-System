SELECT 
    Br.BorrowerID,
    Br.FirstName,
    Br.LastName,
    COUNT(*) AS TotalBorrowed,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS RankByFrequency
FROM Loans L
INNER JOIN Borrowers Br ON L.BorrowerID = Br.BorrowerID
GROUP BY Br.BorrowerID, Br.FirstName, Br.LastName
ORDER BY RankByFrequency;
