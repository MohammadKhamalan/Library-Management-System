SELECT B.BookID, B.Title, Br.BorrowerID, Br.FirstName
FROM Loans L
INNER JOIN Books B ON L.BookID=B.BookID 
INNER JOIN Borrowers Br ON L.BorrowerID=Br.BorrowerID
WHERE L.DateReturned IS NULL AND DATEDIFF(DAY,L.DueDate,GETDATE()) > 30;