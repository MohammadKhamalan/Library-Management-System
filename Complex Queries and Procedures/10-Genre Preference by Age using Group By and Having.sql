WITH AgeGroups AS (
    SELECT 
        br.BorrowerID,
        FLOOR(DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) / 10) * 10 AS AgeGroup,
        b.Genre
    FROM Borrowers br
    INNER JOIN Loans l ON br.BorrowerID = l.BorrowerID
    INNER JOIN Books b ON l.BookID = b.BookID
),
GenreCounts AS (
    SELECT 
        AgeGroup,
        Genre,
        COUNT(*) AS BorrowingCount
    FROM AgeGroups
    GROUP BY AgeGroup, Genre
),
PreferredGenres AS (
    SELECT 
        AgeGroup,
        Genre,
        BorrowingCount,
        RANK() OVER (PARTITION BY AgeGroup ORDER BY BorrowingCount DESC) AS Rank
    FROM GenreCounts
)
SELECT 
    AgeGroup,
    Genre AS PreferredGenre,
    BorrowingCount
FROM PreferredGenres
WHERE Rank = 1
ORDER BY AgeGroup;