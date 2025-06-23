SELECT 
    Author,
    COUNT(*) AS TimesBorrowed,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS AuthorRank
FROM Books B
INNER JOIN Loans L ON B.BookID = L.BookID
GROUP BY Author;