WITH ActiveBorrowers AS(
SELECT BorrowerID,COUNT(*) AS BorrowCount
FROM Loans
WHERE DateReturned IS NULL
GROUP BY BorrowerID
)
SELECT * FROM ActiveBorrowers 
WHERE BorrowCount >=2;
